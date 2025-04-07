import 'package:core/base/base_state.dart';
import 'package:core/base/base_status.dart';
import 'package:domain/models/product/product_type.dart';
import 'package:domain/models/product/product_variant.dart';
import 'package:waadaa/app/modules/home/models/product_ui_model.dart';
import 'package:waadaa/app/modules/product/models/product_estimated_delivery_ui_model.dart';
import 'package:waadaa/app/modules/product/models/product_info_ui_model.dart';
import 'package:waadaa/app/modules/product/models/product_price_ui_model.dart';
import 'package:waadaa/app/modules/product/models/product_variant_ui_model.dart';

class ProductState extends BaseState {
  final String id;
  final ProductType productType;

  final bool isProductImagesLoading;
  final List<String> productImages;
  final List<String> productCarouselImages;
  final Map<String, List<String>> colorImages;

  final bool isProductInfoLoading;
  final ProductInfoUiModel productInfo;

  final bool isPriceLoading;
  final ProductPriceUiModel productPrice;

  final Map<String, String> selectedVariant;
  final Map<String, List<ProductVariantUiModel>> variants;
  final List<ProductVariant> variantCombinations;
  final Map<String, List<ProductVariant>> variantsMapTable;

  final String sizeChartUrl;

  final bool isEstimatedDeliveryLoading;
  final ProductEstimatedDeliveryUiModel estimatedDelivery;

  final List<ProductUiModel> frequentlyBoughtProducts;
  final List<ProductUiModel> recommendedProducts;
  final List<ProductUiModel> recentlyViewedProducts;

  ProductState({
    super.status,
    required this.id,
    required this.productType,
    required this.isProductImagesLoading,
    required this.productImages,
    required this.productCarouselImages,
    required this.colorImages,
    required this.isProductInfoLoading,
    required this.productInfo,
    required this.isPriceLoading,
    required this.productPrice,
    required this.selectedVariant,
    required this.variants,
    required this.variantCombinations,
    required this.variantsMapTable,
    required this.sizeChartUrl,
    required this.isEstimatedDeliveryLoading,
    required this.estimatedDelivery,
    required this.frequentlyBoughtProducts,
    required this.recommendedProducts,
    required this.recentlyViewedProducts,
  });

  ProductState.initial()
      : id = '',
        productType = ProductType.single,
        isProductImagesLoading = false,
        productImages = [],
        productCarouselImages = [],
        colorImages = {},
        isProductInfoLoading = false,
        productInfo = ProductInfoUiModel.empty(),
        isPriceLoading = false,
        productPrice = ProductPriceUiModel.empty(),
        selectedVariant = {},
        variants = {},
        variantCombinations = [],
        variantsMapTable = {},
        sizeChartUrl = '',
        isEstimatedDeliveryLoading = false,
        estimatedDelivery = ProductEstimatedDeliveryUiModel.empty(),
        frequentlyBoughtProducts = [],
        recommendedProducts = [],
        recentlyViewedProducts = [];

  @override
  ProductState copyWith({
    BaseStatus? status,
    String? id,
    ProductType? productType,
    bool? isProductImagesLoading,
    List<String>? productImages,
    List<String>? productCarouselImages,
    Map<String, List<String>>? colorImages,
    bool? isProductInfoLoading,
    ProductInfoUiModel? productInfo,
    bool? isPriceLoading,
    ProductPriceUiModel? productPrice,
    Map<String, String>? selectedVariant,
    Map<String, List<ProductVariantUiModel>>? variants,
    List<ProductVariant>? variantCombinations,
    Map<String, List<ProductVariant>>? variantsMapTable,
    String? sizeChartUrl,
    bool? isEstimatedDeliveryLoading,
    ProductEstimatedDeliveryUiModel? estimatedDelivery,
    List<ProductUiModel>? frequentlyBoughtProducts,
    List<ProductUiModel>? recommendedProducts,
    List<ProductUiModel>? recentlyViewedProducts,
  }) {
    return ProductState(
      status: status ?? this.status,
      id: id ?? this.id,
      productType: productType ?? this.productType,
      isProductImagesLoading:
          isProductImagesLoading ?? this.isProductImagesLoading,
      productImages: productImages ?? this.productImages,
      productCarouselImages:
          productCarouselImages ?? this.productCarouselImages,
      colorImages: colorImages ?? this.colorImages,
      isProductInfoLoading: isProductInfoLoading ?? this.isProductInfoLoading,
      productInfo: productInfo ?? this.productInfo,
      isPriceLoading: isPriceLoading ?? this.isPriceLoading,
      productPrice: productPrice ?? this.productPrice,
      selectedVariant: selectedVariant ?? this.selectedVariant,
      variants: variants ?? this.variants,
      variantCombinations: variantCombinations ?? this.variantCombinations,
      variantsMapTable: variantsMapTable ?? this.variantsMapTable,
      sizeChartUrl: sizeChartUrl ?? this.sizeChartUrl,
      isEstimatedDeliveryLoading:
          isEstimatedDeliveryLoading ?? this.isEstimatedDeliveryLoading,
      estimatedDelivery: estimatedDelivery ?? this.estimatedDelivery,
      frequentlyBoughtProducts:
          frequentlyBoughtProducts ?? this.frequentlyBoughtProducts,
      recommendedProducts: recommendedProducts ?? this.recommendedProducts,
      recentlyViewedProducts:
          recentlyViewedProducts ?? this.recentlyViewedProducts,
    );
  }

  ProductState setId(String id) {
    return copyWith(id: id);
  }

  ProductState setProductType(ProductType productType) {
    return copyWith(productType: productType);
  }

  ProductState updateProductImagesLoadingState(bool isLoading) {
    return copyWith(isProductImagesLoading: isLoading);
  }

  ProductState setProductImages(List<String> images) {
    return copyWith(productImages: images);
  }

  ProductState updateProductCarouselImages(List<String> images) {
    return copyWith(productCarouselImages: images);
  }

  ProductState setProductColorImages(Map<String, List<String>> images) {
    return copyWith(colorImages: images);
  }

  ProductState updateProductInfoLoadingState(bool isLoading) {
    return copyWith(isProductInfoLoading: isLoading);
  }

  ProductState updateProductInfo(ProductInfoUiModel productInfo) {
    return copyWith(productInfo: productInfo);
  }

  ProductState updateProductPriceLoadingState(bool isLoading) {
    return copyWith(isPriceLoading: isLoading);
  }

  ProductState updateProductPrice(ProductPriceUiModel productPrice) {
    return copyWith(productPrice: productPrice);
  }

  ProductState setSelectedVariant(Map<String, String> newSelectedVariant) {
    return copyWith(selectedVariant: newSelectedVariant);
  }

  ProductState updateSelectedVariant(String variantType, String value) {
    final newSelectedVariant = Map<String, String>.from(selectedVariant);
    newSelectedVariant[variantType] = value;

    return copyWith(selectedVariant: newSelectedVariant);
  }

  ProductState clearSelectedVariant() {
    return copyWith(selectedVariant: {});
  }

  ProductState updateVariants(
      Map<String, List<ProductVariantUiModel>> variants) {
    return copyWith(variants: variants);
  }

  ProductState setVariantCombinations(List<ProductVariant> combinations) {
    return copyWith(variantCombinations: combinations);
  }

  ProductState setVariantsMapTable(
      Map<String, List<ProductVariant>> variantsMapTable) {
    return copyWith(variantsMapTable: variantsMapTable);
  }

  ProductState setSizeChartUrl(String sizeChartUrl) {
    return copyWith(sizeChartUrl: sizeChartUrl);
  }

  ProductState updateEstimatedDeliveryLoadingState(bool isLoading) {
    return copyWith(isEstimatedDeliveryLoading: isLoading);
  }

  ProductState updateEstimatedDelivery(
      ProductEstimatedDeliveryUiModel estimatedDelivery) {
    return copyWith(estimatedDelivery: estimatedDelivery);
  }

  ProductState updateFrequentlyBoughtProducts(List<ProductUiModel> products) {
    return copyWith(frequentlyBoughtProducts: products);
  }

  ProductState updateRecommendedProducts(List<ProductUiModel> products) {
    return copyWith(recommendedProducts: products);
  }

  ProductState updateRecentlyViewedProducts(List<ProductUiModel> products) {
    return copyWith(recentlyViewedProducts: products);
  }
}
