import 'package:asset_split/src/features/asset/presentation/asset_home_screen.dart';
import 'package:asset_split/src/features/asset/presentation/asset_list_screen.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AssetHomeScreen(),
      routes: [
        GoRoute(
          path: 'assets',
          builder: (context, state) => const AssetListScreen(),
        )
      ],
    ),
  ],
);
