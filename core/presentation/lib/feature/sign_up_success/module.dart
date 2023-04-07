import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/feature/authentication/cubit/authentication_cubit.dart';
import 'package:presentation/feature/sign_up_success/cubit/sign_up_success_cubit.dart';
import 'package:presentation/feature/sign_up_success/sign_up_success_repository.dart';
import 'package:presentation/feature/sign_up_success/views/sign_up_success_screen.dart';

class SignUpSuccessModule {
  static String routeName = 'sign_up_success';
  static String routePath = 'sign_up_success/:userName';

  static buildRoute() {
    return GoRoute(
        path: routePath,
        name: routeName,
        builder: (context, state) {
          final userName = state.params['userName'] ?? '';

          return RepositoryProvider(
            create: (context) => SignUpSuccessRepository(),
            child: BlocProvider(
              create: (context) => SignUpSuccessCubit(
                context.read<SignUpSuccessRepository>(),
                context.read<AuthenticationCubit>()
              ),
              child: SignUpSuccessScreen(userName: userName),
            ),
          );
        });
  }
}
