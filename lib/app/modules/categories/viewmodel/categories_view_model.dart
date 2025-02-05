import 'package:di/configure_dependencies.dart';
import 'package:di/di.dart';
import 'package:domain/usecases/category_list_use_case.dart';
import 'package:waadaa/app/base/base_view_model.dart';
import 'package:waadaa/app/modules/categories/viewmodel/categories_state.dart';

@injectable
class CategoriesViewModel extends BaseViewModel<CategoriesState> {
  CategoriesViewModel() : super(CategoriesState.initial());

  final CategoryListUseCase _categoryListUseCase = getIt<CategoryListUseCase>();

  void getAllCategories() {
    _categoryListUseCase.call();
  }
}
