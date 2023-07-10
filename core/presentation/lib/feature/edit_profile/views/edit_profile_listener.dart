part of 'edit_profile_screen.dart';

extension EditProfileListener on _EditProfileScreenState {
  void listener(BuildContext _, EditProfileState state) {
    state.maybeWhen(
        loading: () => toggleLoading(true, showSpinner: true),
        exception: (appException) {
          showErrorDialogByAppException(appException);
        },
        success: (userInfo) {
          toggleLoading(false);
          context.pop(true);
        },
        orElse: () {});
  }
}
