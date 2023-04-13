
import 'package:go_router/go_router.dart';
import 'package:presentation/feature/splash/views/splash_screen.dart';

class SplashModule {
  static String routeName = 'splash';
  static String routePath = '/';

  static buildRoute({List<GoRoute> routes = const []}) {
    return GoRoute(
        path: routePath,
        name: routeName,
        routes: routes,
        builder: (context, state) {
          return const SplashScreen();
        });
  }

}
