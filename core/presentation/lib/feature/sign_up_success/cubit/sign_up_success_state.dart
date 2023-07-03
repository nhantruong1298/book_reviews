part of 'sign_up_success_cubit.dart';

@freezed
class SignUpSuccessState with _$SignUpSuccessState {
  const factory SignUpSuccessState.init() = SignUpSuccessInitial;
  const factory SignUpSuccessState.loading() = LoadingState;
  const factory SignUpSuccessState.resendEmailSuccess() = ResendEmailSuccess;
  const factory SignUpSuccessState.exception(AppException appException) =
      SignUpSuccessExceptionState;
}
