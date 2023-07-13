part of '../../sign_in/view/sign_in_screen.dart';

extension SignInListener on _SignInScreenState {
  void listener(BuildContext context, SignInState state) {
    state.maybeWhen(
        loading: () => toggleLoading(true, showSpinner: true),
        exception: (appException) {
          showErrorDialogByAppException(appException);
        },
        success: (userInfo) {
          toggleLoading(false);
          context.read<AuthenticationCubit>().onSignInSuccess(userInfo);
          DashboardRoute().go(context);
        },
        orElse: () {});
  }
}
