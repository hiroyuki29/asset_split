import 'package:asset_split/src/features/asset/presentation/add_new_asset_screen.dart';
import 'package:asset_split/src/features/asset/presentation/asset_home_screen.dart';
import 'package:asset_split/src/features/asset/presentation/asset_list_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../common_widget/loading_screen.dart';
import '../features/user/domain/model/user.dart';
import '../features/user/presentation/user_controller.dart';
import '../features/user/presentation/user_list_screen.dart';

enum AppRoute {
  home,
  loading,
  user,
  assets,
}

final goRouterProvider = Provider.autoDispose<GoRouter>((ref) {
  final AsyncValue<List<User>> userState = ref.watch(userStateProvider);
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (state) {
      if (userState.value == null) {
        if (state.location == '/') {
          return '/loading';
        }
      } else {
        final isNoUser = userState.value!.isEmpty;
        if (isNoUser) {
          if (state.location == '/' || state.location == '/assets') {
            return '/users';
          }
        }
      }
      return null;
    },
    // refreshListenable:
    //     GoRouterRefreshStream(ref.watch(userStateProvider.notifier).stream),
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
                builder: (context, state) => const AddNewAssetScreen(),
              ),
            ],
          ),
          GoRoute(
            path: 'users',
            name: AppRoute.user.name,
            builder: (context, state) => const UserListScreen(),
          ),
          GoRoute(
            path: 'loading',
            name: AppRoute.loading.name,
            builder: (context, state) => const LoadingScreen(),
          )
        ],
      ),
    ],
  );
});
