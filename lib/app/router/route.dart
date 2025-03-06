import 'package:core/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoute extends GoRoute {
  final BasePage Function(BuildContext, GoRouterState) buildPage;

  AppRoute({
    required super.path,
    required super.name,
    required this.buildPage,
    super.parentNavigatorKey,
  }) : super(
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage(
              name: name,
              key: state.pageKey,
              child: buildPage.call(context, state),
            );
          },
        );
}
