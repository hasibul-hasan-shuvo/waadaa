import 'package:di/configure_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/app.dart';
import 'package:waadaa/app/router/navigator.dart';
import 'package:waadaa/app/router/router.dart';
import 'package:waadaa/flavors.dart';

void appMain({required AppFlavor appFlavor}) async {
  WidgetsFlutterBinding.ensureInitialized();
  F.appFlavor = appFlavor;
  await F.loadEnvironment();
  await configureDependencies();
  AppNavigator.init(AppRouter.config);
  runApp(const App());
}
