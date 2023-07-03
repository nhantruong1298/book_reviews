import 'package:bloc/bloc.dart';
import 'package:domain/repository/firebase_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/exception/app_exception.dart';
import 'package:presentation/exception/app_exception_handler.dart';
import 'package:presentation/injectors/all.dart';

part 'sign_up_success_cubit.freezed.dart';
part 'sign_up_success_state.dart';

class SignUpSuccessCubit extends Cubit<SignUpSuccessState> {
  late final AppExceptionHandler _appExceptionHandler;
  late final FirebaseAuthRepository _firebaseAuthRepository;
  late final UserCredential _userCredential;

  SignUpSuccessCubit() : super(const SignUpSuccessInitial()) {
    _appExceptionHandler = getIt<AppExceptionHandler>();
    _firebaseAuthRepository = getIt<FirebaseAuthRepository>();
  }

  void onResendPressed() async {
    emit(const LoadingState());
    try {
     // await _firebaseAuthRepository.sendEmailVerification(_userCredential);
     // emit(const SignUpSuccessReadyState());
    } catch (e, stackTrace) {
      final appException = _appExceptionHandler.map(e, stackTrace: stackTrace);
      emit(SignUpSuccessExceptionState(appException));
    } 
  }

  void onScreenInit(UserCredential userCredential) {
    _userCredential = userCredential;
  }
}
