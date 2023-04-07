part of '../../sign_up/views/sign_up_screen.dart';

extension SignUpListener on _SignUpScreenState {
  void listener(BuildContext context, SignUpState state) {
    state.maybeWhen(
        loading: (isLoading) => toggleLoading(isLoading, showSpinner: true),
        exception: (appException) =>
            showErrorDialogByAppException(appException),
        success: () {
          final userName = _formKey.currentState?.fields[USER_NAME_FIELD]?.value
                  as String? ??
              '';

          context.goNamed(SignUpSuccessModule.routeName, params: {
            'userName': userName,
          });
        },
        orElse: () {});
  }
}
