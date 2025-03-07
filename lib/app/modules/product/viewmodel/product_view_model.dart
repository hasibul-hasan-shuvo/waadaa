import 'package:core/base/base_view_model.dart';
import 'package:di/di.dart';
import 'package:domain/models/product/product_with_variants_map_table.dart';
import 'package:domain/usecases/product_by_id_use_case.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_state.dart';

@injectable
class ProductViewModel extends BaseViewModel<ProductState> {
  final ProductByIdUseCase _productByIdUseCase;

  ProductViewModel(
    this._productByIdUseCase,
  ) : super(ProductState.initial());

  @override
  void onViewReady() {
    super.onViewReady();
    getProductById();
  }

  void setId(String id) {
    updateState(state.setId(id));
  }

  void getProductById() {
    callDataService(
      _productByIdUseCase.getProductById(state.id),
      onSuccess: _handleGetProductByIdSuccessResponse,
    );
  }

  void _handleGetProductByIdSuccessResponse(
      ProductWithVariantsMapTable productWithVariantsMapTable) {
    // Handle response data
  }
}
