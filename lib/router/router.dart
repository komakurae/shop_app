import 'package:auto_route/auto_route.dart';
import 'package:shop_app/models/product/models.dart';

import 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      page: AuthRoute.page,
      children: [
        AutoRoute(page: LoginRoute.page),
        AutoRoute(
          page: HomeRouter.page,
          children: [
            AutoRoute(
              path: '',
              page: HomeRoute.page,
              children: [
                AutoRoute(
                  page: ProductsRoute.page,
                ),
                AutoRoute(
                  page: CardsRoute.page,
                ),
                AutoRoute(page: SettingsRoute.page),
              ],
            ),
            AutoRoute(
              page: CardsFormRoute.page,
            ),
            AutoRoute(
              page: AddProductRoute.page,
            ),
          ],
        ),
      ],
    ),
  ];
}
