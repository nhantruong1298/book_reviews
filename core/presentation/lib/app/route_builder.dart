import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/feature/authentication/cubit/authentication_cubit.dart';
import 'package:presentation/feature/dashboard/cubit/dashboard_cubit.dart';
import 'package:presentation/feature/dashboard/views/dashboard_screen.dart';
import 'package:presentation/feature/home/cubit/home_cubit.dart';
import 'package:presentation/feature/home/views/home_screen.dart';
import 'package:presentation/feature/sign_up/cubit/sign_up_cubit.dart';
import 'package:presentation/feature/sign_up/sign_up_repository.dart';
import 'package:presentation/feature/sign_up/views/sign_up_screen.dart';
import 'package:presentation/feature/sign_up_success/cubit/sign_up_success_cubit.dart';
import 'package:presentation/feature/sign_up_success/views/sign_up_success_screen.dart';
import 'package:presentation/feature/splash/views/splash_screen.dart';
part 'route_builder.g.dart';

//********************** SPLASH ROUTE **********************
@TypedGoRoute<SplashRoute>(
  path: '/',
)
class SplashRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SplashScreen();
}

//********************** SIGN UP ROUTE **********************
@TypedGoRoute<SignUpRoute>(
    path: '/sign-up',
    routes: <TypedGoRoute<GoRouteData>>[
      TypedGoRoute<SignUpSuccessRoute>(
        path: 'sign-up-success/:userName',
      )
    ])
class SignUpRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return RepositoryProvider(
        create: (_) => SignUpRepository(),
        child: BlocProvider(
          create: (context) => SignUpCubit(
            context.read<SignUpRepository>(),
            context.read<AuthenticationCubit>(),
          ),
          child: const SignUpScreen(),
        ));
  }
}

class SignUpSuccessRoute extends GoRouteData {
  final String userName;
  SignUpSuccessRoute(this.userName);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) =>
          SignUpSuccessCubit(context.read<AuthenticationCubit>()),
      child: SignUpSuccessScreen(userName: userName),
    );
  }
}

//********************** DASHBOARD ROUTE **********************
@TypedGoRoute<DashboardRoute>(
    path: '/dashboard', routes: <TypedGoRoute<GoRouteData>>[])
class DashboardRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: const DashboardScreen(),
    );
  }
}


//********************** HOME ROUTE **********************
class HomeRoute{
  static Widget build() {
     return BlocProvider(
      create: (context) => HomeCubit(),
      child: const HomeScreen(),
    );
  }
}























// class RouteBuilder {
//   static GoRouter get router {
//     assert(
//       _router != null,
//       'Router is not initialized. Please call initializeRouter() first.',
//     );
//     return _router!;
//   }

//   static GoRouter? _router;

//   static void init() {
//     if (_router != null) return;
//     _router = GoRouter(
//       // * define all app routing here
//       redirect: (context, state) {
//         return null;
//       },
//       routes: [
//         SplashModule.buildRoute(),
//         SignUpModule.buildRoute(routes: [
//           SignUpSuccessModule.buildRoute(),
//         ]),
//       ],
//       initialLocation: SplashModule.routePath,
//       debugLogDiagnostics: true,
//     );
//   }
// }
