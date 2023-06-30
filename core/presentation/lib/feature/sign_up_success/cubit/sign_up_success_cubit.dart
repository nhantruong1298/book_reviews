import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/exception/app_exception.dart';
import 'package:presentation/exception/app_exception_handler.dart';
import 'package:presentation/feature/authentication/cubit/authentication_cubit.dart';
import 'package:presentation/injectors/all.dart';

part 'sign_up_success_cubit.freezed.dart';
part 'sign_up_success_state.dart';

class SignUpSuccessCubit extends Cubit<SignUpSuccessState> {
  late final AppExceptionHandler _appExceptionHandler;
  final AuthenticationCubit _authenticationCubit;
  SignUpSuccessCubit(this._authenticationCubit)
      : super(const SignUpSuccessInitial()) {
    _appExceptionHandler = getIt<AppExceptionHandler>();
  }

  void onResendPressed(String email) async{
    emit(const LoadingState(true));
    try {
      await _authenticationCubit.sendEmailVerification();
      emit(const SignUpSuccessReadyState());
    } catch (e, stackTrace) {
      final appException = _appExceptionHandler.map(e, stackTrace: stackTrace);
      emit(SignUpSuccessExceptionState(appException));
    } finally {
      emit(const LoadingState(false));
    }
  }
}
