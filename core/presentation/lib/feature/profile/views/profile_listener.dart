part of 'profile_screen.dart';

extension ProfileListener on _ProfileScreenState {
  void listener(BuildContext context, ProfileState state) {
    state.maybeWhen(
        exception: (appException) =>
            showErrorDialogByAppException(appException),
        loading: () => toggleLoading(true, showSpinner: true),
        loaded: (userInfo) {
          toggleLoading(false);
        },
        orElse: () {});
  }
}
