import 'package:bloc/bloc.dart';
import 'package:domain/model/user/update_user_info.dart';
import 'package:domain/repository/firebase_auth_repository.dart';
import 'package:domain/repository/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/exception/app_exception.dart';
import 'package:presentation/exception/app_exception_handler.dart';
import 'package:presentation/injectors/all.dart';

part 'sign_up_cubit.freezed.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  late final FirebaseAuthRepository _firebaseAuthRepository;
  late final UserRepository _userRepository;
  late final AppExceptionHandler _appExceptionHandler;
  SignUpCubit() : super(const SignUpInitial()) {
    _appExceptionHandler = getIt<AppExceptionHandler>();
    _firebaseAuthRepository = getIt<FirebaseAuthRepository>();
    _userRepository = getIt<UserRepository>();
  }

  void onSubmit(
      String userName, String password, String surname, String name) async {
    emit(const LoadingState());
    try {
      final signUpResult = await _firebaseAuthRepository
          .signUpWithEmailAndPassword(userName, password);

      await _userRepository.updateUserInfo(UpdateUserInfoParams(
        id: signUpResult.userId,
        displayName: '$surname $name',
        email: signUpResult.email,
        surname: surname,
        name: name,
      ));

      emit(SignUpSuccessState(signUpResult.email, signUpResult.userId));
    } catch (error, stackTrace) {
      final appException =
          _appExceptionHandler.map(error, stackTrace: stackTrace);
      emit(SignUpExceptionState(appException));
    }
  }
}
