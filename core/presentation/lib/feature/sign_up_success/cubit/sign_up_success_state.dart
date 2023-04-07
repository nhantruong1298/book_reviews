part of 'sign_up_success_cubit.dart';

@freezed
class SignUpSuccessState with _$SignUpSuccessState {
  const factory SignUpSuccessState.init() = SignUpSuccessInitial;
  const factory SignUpSuccessState.loading(bool isLoading) = LoadingState;
  const factory SignUpSuccessState.ready() = SignUpSuccessReadyState;
  const factory SignUpSuccessState.exception(AppException appException) =
      SignUpSuccessExceptionState;
}
