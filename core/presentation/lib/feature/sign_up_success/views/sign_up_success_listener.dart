part of 'sign_up_success_screen.dart';

extension SignUpListener on _SignUpSuccessScreenState {
  void listener(BuildContext context, SignUpSuccessState state) {
    state.maybeWhen(
        loading: (isLoading) => toggleLoading(isLoading, showSpinner: true),
        exception: (appException) =>
            showErrorDialogByAppException(appException),
        ready: () {
           _resendButtonValue.value = false;
          _timerValue.value = true;
          _countDownController.start();
        },
        orElse: () {});
  }

   void onButtonBackPressed() {
    //TODO: Go to sign in screen after implement SignInModule 
  }
}
