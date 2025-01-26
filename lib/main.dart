import 'package:di/configure_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/app.dart';
import 'package:waadaa/app/router/navigator.dart';
import 'package:waadaa/app/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  AppNavigator.init(AppRouter.config);
  runApp(const App());
}
