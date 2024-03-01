import 'package:shop_app/router/index.dart';

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
                  page: ProductsRouter.page,
                  initial: true,
                  children: [
                    AutoRoute(
                      path: '',
                      page: ProductsRoute.page,
                    ),
                    AutoRoute(
                      path: ':id',
                      page: ProductRoute.page,
                    ),
                  ],
                ),
                AutoRoute(
                  page: CartsRoute.page,
                ),
                AutoRoute(page: UsersRoute.page),
                AutoRoute(page: SettingsRoute.page),
              ],
            ),
            AutoRoute(page: CartsFormRoute.page),
            AutoRoute(page: UserCartsRoute.page),
          ],
        ),
      ],
    ),
  ];
}
