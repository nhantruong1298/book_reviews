part of 'dashboard_screen.dart';

extension DashboardListener on _DashboardScreenState {
  void listener(BuildContext context, DashboardState state) {
    state.maybeWhen(
        indexChanged: (index) => _controller.animateTo(index), orElse: () {});
  }
}
