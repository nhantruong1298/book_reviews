import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/exception/app.exception_handler.dart';
import 'package:presentation/exception/app_exception.dart';
import 'package:presentation/feature/authentication/cubit/authentication_cubit.dart';
import 'package:presentation/feature/sign_up_success/sign_up_success_repository.dart';
import 'package:presentation/injectors/all.dart';

part 'sign_up_success_state.dart';
part 'sign_up_success_cubit.freezed.dart';

class SignUpSuccessCubit extends Cubit<SignUpSuccessState> {
  final SignUpSuccessRepository _signUpSuccessRepository;
  late final AppExceptionHandler _appExceptionHandler;
  final AuthenticationCubit _authenticationCubit;
  SignUpSuccessCubit(this._signUpSuccessRepository, this._authenticationCubit)
      : super(const SignUpSuccessInitial()) {
    _appExceptionHandler = getIt<AppExceptionHandler>();
  }

  void onResendPressed(String email) {
    emit(const LoadingState(true));
    try {
      final userCredential = _authenticationCubit.state.userCredential;

      if (userCredential != null) {
        _signUpSuccessRepository.sendEmailVerification(userCredential);
        emit(const SignUpSuccessReadyState());
      }
    } catch (e, stackTrace) {
      final appException = _appExceptionHandler.map(e, stackTrace: stackTrace);
      emit(SignUpSuccessExceptionState(appException));
    } finally {
      emit(const LoadingState(false));
    }
  }
}
