import 'package:di/di.dart';
import 'package:waadaa/app/base/base_view_model.dart';
import 'package:waadaa/app/modules/brands/viewmodel/brands_state.dart';

@injectable
class BrandsViewModel extends BaseViewModel<BrandsState> {
  BrandsViewModel() : super(BrandsState.initial());
}
