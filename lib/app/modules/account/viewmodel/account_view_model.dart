import 'package:core/base/base_view_model.dart';
import 'package:di/di.dart';
import 'package:waadaa/app/modules/account/viewmodel/account_state.dart';

@injectable
class AccountViewModel extends BaseViewModel<AccountState> {
  AccountViewModel() : super(AccountState.initial());
}
