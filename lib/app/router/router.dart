import 'package:core/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waadaa/app/modules/account/view/account_page.dart';
import 'package:waadaa/app/modules/brands/view/brands_page.dart';
import 'package:waadaa/app/modules/categories/view/categories_page.dart';
import 'package:waadaa/app/modules/home/view/home_page.dart';
import 'package:waadaa/app/modules/main/view/main_page.dart';
import 'package:waadaa/app/modules/my_cart/view/my_cart_page.dart';
import 'package:waadaa/app/modules/page_not_found/view/page_not_found_page.dart';
import 'package:waadaa/app/modules/product/view/product_page.dart';
import 'package:waadaa/app/modules/product/view/product_page.dart';
import 'package:waadaa/app/router/route.dart';

part 'routes.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter config = GoRouter(
    initialLocation: _Paths.main,
    routes: _routes,
    errorPageBuilder: _errorPageBuilder,
  );

  static Page _errorPageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage(
      child: const PageNotFoundPage(),
    );
  }

  static final List<GoRoute> _routes = [
    AppRoute(
      path: _Paths.main,
      name: AppRoutes.main,
      buildPage: (context, state) => const MainPage(),
    ),
    AppRoute(
      path: _Paths.home,
      name: AppRoutes.home,
      buildPage: (context, state) => const HomePage(),
    ),
    AppRoute(
      path: _Paths.brands,
      name: AppRoutes.brands,
      buildPage: (context, state) => const BrandsPage(),
    ),
    AppRoute(
      path: _Paths.categories,
      name: AppRoutes.categories,
      buildPage: (context, state) => const CategoriesPage(),
    ),
    AppRoute(
      path: _Paths.myCart,
      name: AppRoutes.myCart,
      buildPage: (context, state) => const MyCartPage(),
    ),
    AppRoute(
      path: _Paths.account,
      name: AppRoutes.account,
      buildPage: (context, state) => const AccountPage(),
    ),
    AppRoute(
      path: _Paths.pageNotFound,
      name: AppRoutes.pageNotFound,
      buildPage: (context, state) => const PageNotFoundPage(),
    ),
    AppRoute(
      path: _Paths.product,
      name: AppRoutes.product,
      buildPage: (context, state) {
        String? id = state.pathParameters['id'];

        if (id.isNullOrEmpty) {
          return const PageNotFoundPage();
        }

        return ProductPage(id: id!);
      },
    ),
  ];
}
