import 'package:asset_split/src/features/asset/presentation/add_new_asset_screen.dart';
import 'package:asset_split/src/features/asset/presentation/asset_home_screen.dart';
import 'package:asset_split/src/features/asset/presentation/asset_list_screen.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  home,
  assets,
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const AssetHomeScreen(),
      routes: [
        GoRoute(
            path: 'assets',
            name: AppRoute.assets.name,
            builder: (context, state) => const AssetListScreen(),
            routes: [
              GoRoute(
                path: 'add',
                builder: (context, state) => AddNewAssetScreen(),
              ),
            ])
      ],
    ),
  ],
);
