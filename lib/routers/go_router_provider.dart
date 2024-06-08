import 'package:dst_doscom_flutter/features/home/page/detail_user.dart';
import 'package:dst_doscom_flutter/features/home/page/home.dart';
import 'package:dst_doscom_flutter/routers/router_name.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) {
  return GoRouter(
      initialLocation: RouteName.home,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: RouteName.home,
          name: RouteName.home,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: RouteName.detailUser,
          name: RouteName.detailUser,
          builder: (context, state) => const DetailUserPage(),
        ),

      ]);
}
