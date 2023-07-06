part of 'sign_up_success_screen.dart';

extension SignUpListener on _SignUpSuccessScreenState {
  void listener(BuildContext context, SignUpSuccessState state) {
    state.maybeWhen(
        loading: () => toggleLoading(true, showSpinner: true),
        exception: (appException) =>
            showErrorDialogByAppException(appException),
        resendEmailSuccess: () {
          toggleLoading(false);
          _resendButtonValue.value = false;
          _timerValue.value = true;
          _countDownController.start();
        },
        orElse: () {});
  }

  
}
