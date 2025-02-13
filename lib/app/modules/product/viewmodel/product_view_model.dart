import 'package:di/di.dart';
import 'package:waadaa/app/base/base_view_model.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_state.dart';

@injectable
class ProductViewModel extends BaseViewModel<ProductState> {
  ProductViewModel() : super(ProductState.initial());
}
