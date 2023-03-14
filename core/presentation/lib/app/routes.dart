import 'package:go_router/go_router.dart';
import 'package:presentation/feature/splash/module.dart';

class RouteBuilder {
  static GoRouter get router {
    assert(
      _router != null,
      'Router is not initialized. Please call initializeRouter() first.',
    );
    return _router!;
  }

  static GoRouter? _router;

  static void init() {
    if (_router != null) return;
    _router = GoRouter(
      // * define all app routing here
      redirect: (context, state) {
        return null;
      },
      routes: [
       SplashModule.buildRoute()
      ],
      initialLocation: SplashModule.routePath,
      debugLogDiagnostics: true,
    );
  }
}
