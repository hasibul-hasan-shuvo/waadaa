import 'package:core/base/base_view_model.dart';
import 'package:core/services/logger_service.dart';
import 'package:di/di.dart';
import 'package:domain/models/product/product.dart';
import 'package:domain/models/product/product_variant.dart';
import 'package:domain/models/product/product_with_variants_map_table.dart';
import 'package:domain/models/product/variants.dart';
import 'package:domain/usecases/latest_products_use_case.dart';
import 'package:domain/usecases/product_by_id_use_case.dart';
import 'package:waadaa/app/modules/home/models/product_ui_model.dart';
import 'package:waadaa/app/modules/product/models/product_estimated_delivery_ui_model.dart';
import 'package:waadaa/app/modules/product/models/product_info_ui_model.dart';
import 'package:waadaa/app/modules/product/models/product_price_ui_model.dart';
import 'package:waadaa/app/modules/product/models/product_variant_ui_model.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_state.dart';

@injectable
class ProductViewModel extends BaseViewModel<ProductState> {
  final ProductByIdUseCase _productByIdUseCase;
  final LatestProductsUseCase _latestProductsUseCase;

  ProductViewModel(
    this._productByIdUseCase,
    this._latestProductsUseCase,
  ) : super(ProductState.initial());

  @override
  void onViewReady() {
    super.onViewReady();
    _getProductById();
    _getFrequentlyBoughtProducts();
    _getRecommendedProducts();
    _getRecentlyViewedProducts();
  }

  void setId(String id) {
    updateState(state.setId(id));
  }

  void _getProductById() {
    callDataService(
      _productByIdUseCase.getProductById(state.id),
      onStart: () {
        updateState(state.updateProductImagesLoadingState(true));
        updateState(state.updateProductInfoLoadingState(true));
        updateState(state.updateProductPriceLoadingState(true));
        updateState(state.updateEstimatedDeliveryLoadingState(true));
      },
      onComplete: () {
        updateState(state.updateProductImagesLoadingState(false));
        updateState(state.updateProductInfoLoadingState(false));
        updateState(state.updateProductPriceLoadingState(false));
        updateState(state.updateEstimatedDeliveryLoadingState(false));
      },
      onSuccess: _handleGetProductByIdSuccessResponse,
    );
  }

  void _handleGetProductByIdSuccessResponse(
      ProductWithVariantsMapTable productWithVariantsMapTable) {
    Product product = productWithVariantsMapTable.product;
    updateState(
        state.updateProductInfo(ProductInfoUiModel.fromProduct(product)));
    updateState(
        state.setProductImages(product.images.map((e) => e.url).toList()));
    updateState(
        state.setProductColorImages(productWithVariantsMapTable.colorImages));
    updateState(state.setProductType(product.productType));
    updateState(state.setVariantCombinations(
        productWithVariantsMapTable.product.variantMappings));

    updateState(state
        .setVariantsMapTable(productWithVariantsMapTable.variantsMapTable));

    updateState(
        state.setSizeChartUrl(productWithVariantsMapTable.sizeChartUrl));

    _selectLowestPriceVariant();

    _setProductVariants(
      productWithVariantsMapTable.product.variants,
      productWithVariantsMapTable.colorImages,
      productWithVariantsMapTable.product.images.first.url,
    );
  }

  void _selectLowestPriceVariant() {
    ProductVariant lowestPriceVariant = state.variantCombinations.first;

    for (var variant in state.variantCombinations) {
      if (variant.retailPrice < lowestPriceVariant.retailPrice) {
        lowestPriceVariant = variant;
      }
    }

    Map<String, String> selectedVariant = {};

    for (var element in lowestPriceVariant.attributeValues) {
      selectedVariant[element.name] = element.value;
    }

    _processSelectedVariantData(selectedVariant);
    updateState(state.setSelectedVariant(selectedVariant));
  }

  void _setProductVariants(
    List<Variants> variantsResponse,
    Map<String, List<String>> colorImages,
    String placeholderImageUrl,
  ) {
    Map<String, List<ProductVariantUiModel>> variants = {};

    for (Variants variant in variantsResponse) {
      String key = variant.name.toLowerCase();
      bool isColor = _isColorVariant(key);

      variants[key] = [];

      variants[key]?.addAll(
        variant.values
            .map((e) => ProductVariantUiModel(
                  name: e,
                  imageUrl: isColor
                      ? _getVariantImageUrl(
                          e,
                          colorImages,
                          placeholderImageUrl,
                        )
                      : placeholderImageUrl,
                ))
            .toList(),
      );
    }

    updateState(state.updateVariants(variants));
  }

  String _getVariantImageUrl(
    String variantName,
    Map<String, List<String>> colorImages,
    String placeholderImageUrl,
  ) {
    if (colorImages.containsKey(variantName)) {
      return colorImages[variantName] != null &&
              colorImages[variantName]!.isNotEmpty
          ? colorImages[variantName]?.first ?? placeholderImageUrl
          : placeholderImageUrl;
    }

    return placeholderImageUrl;
  }

  void onVariantSelect(String key, String value) {
    ProductState newState = state.updateSelectedVariant(key, value);
    _processSelectedVariantData(key, newState.selectedVariant);
    updateState(state.updateSelectedVariant(key, value));
  }

  void _processSelectedVariantData(
    String selectedKey,
    Map<String, String> selectedVariant,
  ) {
    List<ProductVariant> availableVariants = [];

    selectedVariant.forEach((key, value) {
      _updateCarouselImagesOnColorSelect(key, value);
      if (availableVariants.isEmpty) {
        availableVariants.addAll(state.variantsMapTable[value] ?? []);
      } else {
        availableVariants = availableVariants
            .where((variant) => (state.variantsMapTable[value] ?? [])
                .any((newVariant) => newVariant.id == variant.id))
            .toList();
      }
    });

    _updateVariantsAvailableStatus(
      selectedKey,
      availableVariants,
    );
    _updateProductInfoOnVariantSelect(
      selectedVariant,
      availableVariants,
    );
  }

  void _updateVariantsAvailableStatus(
    String selectedKey,
    List<ProductVariant> availableVariants,
  ) {
    AppLogger.d("Available: ${availableVariants}");
    Map<String, List<ProductVariantUiModel>> updatedVariants = {};
    state.variants.forEach((key, value) {
      if (selectedKey != key) {
        updatedVariants[key] = value.map((e) {
          bool isAvailable = availableVariants.any((variant) =>
              variant.attributeValues.any((attribute) =>
                  attribute.name == key && attribute.value == e.name));

          return ProductVariantUiModel(
            name: e.name,
            imageUrl: e.imageUrl,
            isAvailable: isAvailable,
          );
        }).toList();
      }
    });

    updateState(state.updateVariants(updatedVariants));
  }

  void _updateProductInfoOnVariantSelect(
    Map<String, String> selectedVariant,
    List<ProductVariant> availableVariants,
  ) {
    for (var variant in availableVariants) {
      bool isSelectedVariant = true;
      for (var attribute in variant.attributeValues) {
        if (selectedVariant[attribute.name] != attribute.value) {
          isSelectedVariant = false;
          break;
        }
      }

      if (isSelectedVariant) {
        updateState(state.updateProductPrice(
          ProductPriceUiModel(
            price: variant.retailPrice.toString(),
            currency: variant.currency,
            discount: '20',
            discountPrice: variant.retailPrice.toString(),
          ),
        ));

        updateState(
          state.updateEstimatedDelivery(
            ProductEstimatedDeliveryUiModel(
              deliveryDays: variant.estimatedDeliveryTime.toString(),
              savingAmount: '3000',
              currency: variant.currency,
            ),
          ),
        );
        break;
      }
    }
  }

  void _updateCarouselImagesOnColorSelect(
    String key,
    String value,
  ) {
    bool hasColorVariant = _isColorVariant(key);
    if (hasColorVariant) {
      List<String> colorImages = state.colorImages[value] ?? [];
      updateState(state.updateProductCarouselImages(
        colorImages.isEmpty ? state.productImages : colorImages,
      ));
    }
  }

  bool _isColorVariant(String key) {
    return key.toLowerCase().contains('color') ||
        key.toLowerCase().contains('colour');
  }

  void _getFrequentlyBoughtProducts() async {
    ///separate one response model to two different states
    callDataService(
      _latestProductsUseCase.getLatestProducts(),
      enableErrorMessage: false,
      onSuccess: (value) {
        updateState(state.updateFrequentlyBoughtProducts(
          value.map((e) => ProductUiModel.fromProductDomain(e)).toList(),
        ));
      },
    );
  }

  void _getRecommendedProducts() async {
    ///separate one response model to two different states
    callDataService(
      _latestProductsUseCase.getLatestProducts(),
      enableErrorMessage: false,
      onSuccess: (value) {
        updateState(state.updateRecommendedProducts(
          value.map((e) => ProductUiModel.fromProductDomain(e)).toList(),
        ));
      },
    );
  }

  void _getRecentlyViewedProducts() async {
    ///separate one response model to two different states
    callDataService(
      _latestProductsUseCase.getLatestProducts(),
      enableErrorMessage: false,
      onSuccess: (value) {
        updateState(state.updateRecentlyViewedProducts(
          value.map((e) => ProductUiModel.fromProductDomain(e)).toList(),
        ));
      },
    );
  }
}
