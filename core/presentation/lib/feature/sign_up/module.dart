
import 'package:go_router/go_router.dart';
import 'package:presentation/feature/sign_up/views/sign_up_screen.dart';


class SignUpModule {
  static String routeName = 'sign_up';
  static String routePath = '/sign_up';

  static buildRoute({List<GoRoute> routes = const []}) {
    return GoRoute(
        path: routePath,
        name: routeName,
        routes: routes,
        builder: (context, state) {
          return const SignUpScreen();
        });
  }

}
