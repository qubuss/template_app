import 'package:go_router/go_router.dart';
import 'package:templateapp/configs/navigation/routes.dart';
import 'package:templateapp/features/auth/presentation/authorization/view/authorization_route.dart';

class GoRouterConfig {
  late GoRouter router;

  GoRouterConfig() {
    router = GoRouter(
      initialLocation: Routes.auth,
      routes: <RouteBase>[
        GoRoute(
          path: Routes.auth,
          name: Routes.auth,
          builder: (context, state) => const AuthorizationRoute(),
        ),
      ],
    );
  }
}
