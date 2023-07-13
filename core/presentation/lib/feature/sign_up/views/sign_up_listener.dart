part of '../../sign_up/views/sign_up_screen.dart';

extension SignUpListener on _SignUpScreenState {
  void listener(BuildContext context, SignUpState state) {
    state.maybeWhen(
        loading: () => toggleLoading(true, showSpinner: true),
        exception: (appException) {
          showErrorDialogByAppException(appException);
        },
        success: (email, userId) {
          toggleLoading(false);
          SignUpSuccessRoute(SignUpSuccessScreenExtra(userId, email))
              .go(context);
        },
        orElse: () {});
  }
}
