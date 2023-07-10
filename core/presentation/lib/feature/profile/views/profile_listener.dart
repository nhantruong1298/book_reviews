part of 'profile_screen.dart';

extension ProfileListener on _ProfileScreenState {
  void listener(BuildContext context, ProfileState state) {
    state.maybeWhen(
      
      orElse: () {});
  }
}
