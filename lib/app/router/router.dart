import 'package:go_router/go_router.dart';
import 'package:waadaa/app/modules/home/view/home_page.dart';
import 'package:waadaa/app/router/route.dart';

part 'routes.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter config = GoRouter(
    initialLocation: _Paths.home,
    routes: _routes,
  );

  static final List<GoRoute> _routes = [
    AppRoute(
      path: _Paths.home,
      name: AppRoutes.home,
      buildPage: (context, state) => HomePage(),
    ),
  ];
}
