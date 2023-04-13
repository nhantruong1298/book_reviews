import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/exception/app.exception_handler.dart';
import 'package:presentation/exception/app_exception.dart';
import 'package:presentation/feature/authentication/cubit/authentication_cubit.dart';
import 'package:presentation/feature/sign_up/sign_up_repository.dart';
import 'package:presentation/injectors/all.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepository _signUpRepository;
  late final AppExceptionHandler _appExceptionHandler;
  final AuthenticationCubit _authenticationCubit;
  SignUpCubit(
    this._signUpRepository,
    this._authenticationCubit,
  ) : super(const SignUpInitial()) {
    _appExceptionHandler = getIt<AppExceptionHandler>();
  }

  void onSubmit(String? userName, String? password) async {
    emit(const LoadingState(true));
    try {
      final signUpResult =
          await _signUpRepository.signUpWithEmail(userName!, password!);

      //** Update user credential
      _authenticationCubit
          .emit(AuthenticationFirebaseState(signUpResult.userCredential));

      //** Send email verification
      await _authenticationCubit.sendEmailVerification();

      emit(const SignUpSuccessState());
    } catch (error, stackTrace) {
      final appException =
          _appExceptionHandler.map(error, stackTrace: stackTrace);
      emit(SignUpExceptionState(appException));
    } finally {
      emit(const LoadingState(false));
    }
  }
}
