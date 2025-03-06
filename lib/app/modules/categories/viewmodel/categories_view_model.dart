import 'package:core/base/base_view_model.dart';
import 'package:di/di.dart';
import 'package:waadaa/app/modules/categories/viewmodel/categories_state.dart';

@injectable
class CategoriesViewModel extends BaseViewModel<CategoriesState> {
  CategoriesViewModel() : super(CategoriesState.initial());
}
