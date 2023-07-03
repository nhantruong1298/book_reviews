import 'package:bloc/bloc.dart';
import 'package:domain/repository/firebase_auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/exception/app_exception.dart';
import 'package:presentation/exception/app_exception_handler.dart';
import 'package:presentation/injectors/all.dart';

part 'sign_up_cubit.freezed.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  late final FirebaseAuthRepository _firebaseAuthRepository;
  late final AppExceptionHandler _appExceptionHandler;
  SignUpCubit() : super(const SignUpInitial()) {
    _appExceptionHandler = getIt<AppExceptionHandler>();
    _firebaseAuthRepository = getIt<FirebaseAuthRepository>();
  }

  void onSubmit(String? userName, String? password) async {
    emit(const LoadingState());
    try {
      await _firebaseAuthRepository.signUpWithEmailAndPassword(
          userName!, password!);

      emit(const SignUpSuccessState());
    } catch (error, stackTrace) {
      final appException =
          _appExceptionHandler.map(error, stackTrace: stackTrace);
      emit(SignUpExceptionState(appException));
    }
  }
}
