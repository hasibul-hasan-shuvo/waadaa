part of 'router.dart';

class AppRoutes {
  AppRoutes._();

  static const String main = 'main';
  static const String home = 'home';
  static const String brands = 'brands';
  static const String categories = 'categories';
  static const String myCart = 'my_cart';
  static const String account = 'account';
  static const String pageNotFound = 'page_not_found';
  static const String product = 'product';
}

class _Paths {
  _Paths._();

  static const String main = '/main';
  static const String home = '/home';
  static const String brands = '/brands';
  static const String categories = '/categories';
  static const String myCart = '/my_cart';
  static const String account = '/account';
  static const String pageNotFound = '/page_not_found';
  static const String product = '/product/:id';
}
