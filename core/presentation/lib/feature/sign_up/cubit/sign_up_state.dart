part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.init() = SignUpInitial;
  const factory SignUpState.loading() = LoadingState;
  const factory SignUpState.success(String email,String userId) = SignUpSuccessState;
  const factory SignUpState.exception(AppException appException) =
      SignUpExceptionState;
}
