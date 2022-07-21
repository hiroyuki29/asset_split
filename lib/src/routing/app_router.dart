import 'package:asset_split/src/features/asset/domain/local_asset_repository.dart';
import 'package:asset_split/src/features/asset/presentation/add_new_asset_screen.dart';
import 'package:asset_split/src/features/asset/presentation/asset_home_screen.dart';
import 'package:asset_split/src/features/asset/presentation/asset_list_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../common_widget/loading_screen.dart';
import '../features/asset/domain/model/asset.dart';
import '../features/user/domain/local_user_repository.dart';
import '../features/user/domain/model/user.dart';
import '../features/user/presentation/user_list_screen.dart';

enum AppRoute {
  home,
  loading,
  user,
  assets,
}

final goRouterProvider = Provider.autoDispose<GoRouter>((ref) {
  final AsyncValue<List<User>> userState = ref.watch(userListStreamProvider);
  final AsyncValue<AssetList> assetList = ref.watch(assetListStreamProvider);
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
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
        } else {
          if (assetList.value == null) {
            if (state.location == '/') {
              return '/loading';
            }
          }
          if (assetList.value!.list.isEmpty) {
            if (state.location == '/') {
              return '/assets';
            }
          }
        }
      }
      return null;
    },
    // refreshListenable: GoRouterRefreshStream(currentUserId.currentUserId()),
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
