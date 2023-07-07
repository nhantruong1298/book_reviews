part of '../../sign_in/view/sign_in_screen.dart';

extension SignInListener on _SignInScreenState {
  void listener(BuildContext context, SignInState state) {
    state.maybeWhen(
        loading: () => toggleLoading(true, showSpinner: true),
        exception: (appException) {
          showErrorDialogByAppException(appException);
        },
        success: (userName, userId) {
          toggleLoading(false);
          //TODO: Forgot call onSinIn in authentication cubit
          DashboardRoute().go(context);
        },
        orElse: () {});
  }
}
