part of 'profile_cubit.dart';


@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.init() = ProfileInitial;
  const factory ProfileState.loading() = LoadingState;
  const factory ProfileState.loaded(LoadUserInfoResult userInfo) = ProfileLoadedState;
  const factory ProfileState.exception(AppException appException) =
      ProfileExceptionState;
}
