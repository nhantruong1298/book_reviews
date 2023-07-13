part of 'dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.init() = DashboardInitial;
  const factory DashboardState.loading() = LoadingState;
  const factory DashboardState.indexChanged(int index) = DashboardIndexChanged;
  const factory DashboardState.exception(AppException appException) =
      DashboardExceptionState;
}
