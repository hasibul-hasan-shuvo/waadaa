import 'package:core/base/base_view_model.dart';
import 'package:di/di.dart';
import 'package:waadaa/app/modules/page_not_found/viewmodel/page_not_found_state.dart';

@injectable
class PageNotFoundViewModel extends BaseViewModel<PageNotFoundState> {
  PageNotFoundViewModel() : super(PageNotFoundState.initial());
}
