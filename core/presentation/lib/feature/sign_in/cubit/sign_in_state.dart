part of 'sign_in_cubit.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.init() = SignInInitial;
  const factory SignInState.loading() = LoadingState;
  const factory SignInState.success(LoadUserInfoResult userInfo) = SignInSuccessState;
  const factory SignInState.exception(AppException appException) =
      SignInExceptionState;
}
