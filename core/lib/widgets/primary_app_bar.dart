import 'package:core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

//Default appbar customized with the design of our app
class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool isBackButtonEnabled;

  const PrimaryAppBar({
    super.key,
    required this.title,
    this.actions,
    this.isBackButtonEnabled = true,
  });

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: isBackButtonEnabled,
      actions: actions,
      iconTheme: context.theme.appBarTheme.iconTheme,
      centerTitle: false,
      title: Text(
        title,
        style: context.theme.appBarTheme.titleTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
