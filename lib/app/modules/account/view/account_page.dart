import 'package:flutter/material.dart';
import 'package:waadaa/app/base/base_page.dart';
import 'package:waadaa/app/modules/account/viewmodel/account_state.dart';
import 'package:waadaa/app/modules/account/viewmodel/account_view_model.dart';

class AccountPage extends BasePage<AccountViewModel, AccountState> {
  const AccountPage({super.key});

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Text("This is account page"),
    );
  }
}
