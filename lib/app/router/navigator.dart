import 'package:go_router/go_router.dart';
import 'package:waadaa/app/router/router.dart';

class AppNavigator {
  static AppNavigator? _instance;

  late final GoRouter _router;

  AppNavigator._();

  AppNavigator.init(GoRouter router) {
    if (_instance == null) {
      _router = router;
      _instance = this;
    }
  }

  static AppNavigator get instance {
    if (_instance == null) {
      throw Exception(
          "AppNavigator is not initialized. Call `AppNavigator.init()` first.");
    }
    return _instance!;
  }

  Future navigateToHome() {
    return _router.pushNamed(AppRoutes.home);
  }

  Future navigateToBrands() {
    return _router.pushNamed(AppRoutes.brands);
  }

  Future navigateToCategories() {
    return _router.pushNamed(AppRoutes.categories);
  }

  Future navigateToMyCart() {
    return _router.pushNamed(AppRoutes.myCart);
  }

  Future navigateToAccount() {
    return _router.pushNamed(AppRoutes.account);
  }
}
