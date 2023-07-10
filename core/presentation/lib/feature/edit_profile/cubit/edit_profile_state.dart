part of 'edit_profile_cubit.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState.init() = EditProfileInitial;
  const factory EditProfileState.loading() = EditProfileLoadingState;
  const factory EditProfileState.success(LoadUserInfoResult userInfo) = EditProfileSuccessState;
  const factory EditProfileState.exception(AppException appException) =
      EditProfileExceptionState;
}
