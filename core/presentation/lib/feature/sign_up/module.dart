import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/feature/authentication/cubit/authentication_cubit.dart';
import 'package:presentation/feature/sign_up/cubit/sign_up_cubit.dart';
import 'package:presentation/feature/sign_up/sign_up_repository.dart';
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
          return RepositoryProvider(
              create: (_) => SignUpRepository(),
              child: BlocProvider(
                create: (context) => SignUpCubit(
                  context.read<SignUpRepository>(),
                  context.read<AuthenticationCubit>(),
                ),
                child: const SignUpScreen(),
              ));
        });
  }
}
