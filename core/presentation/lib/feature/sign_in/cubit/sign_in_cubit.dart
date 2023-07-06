import 'package:bloc/bloc.dart';
import 'package:domain/repository/firebase_auth_repository.dart';
import 'package:domain/repository/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/exception/app_exception.dart';
import 'package:presentation/exception/app_exception_handler.dart';
import 'package:presentation/injectors/all.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

class SignInCubit extends Cubit<SignInState> {
  late final FirebaseAuthRepository _firebaseAuthRepository;
  late final AppExceptionHandler _appExceptionHandler;
  late final UserRepository _userRepository;

  SignInCubit() : super(const SignInInitial()) {
    _appExceptionHandler = getIt<AppExceptionHandler>();
    _firebaseAuthRepository = getIt<FirebaseAuthRepository>();
    _userRepository = getIt<UserRepository>();
  }

  void onSignIn(String email, String password) async {
    emit(const LoadingState());
    try {
      final signInResult = await _firebaseAuthRepository
          .signInWithEmailAndPassword(email, password);
      await _userRepository.loadUserInfo(signInResult.userId);
      print(signInResult);
      emit(SignInSuccessState(signInResult.userName, signInResult.userId));
    } catch (error, stackTrace) {
      final appException =
          _appExceptionHandler.map(error, stackTrace: stackTrace);
      //TODO: Forgot emit SignInExceptionState
    }
  }
}
