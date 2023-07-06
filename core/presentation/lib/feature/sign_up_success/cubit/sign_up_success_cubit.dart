import 'package:bloc/bloc.dart';
import 'package:domain/repository/firebase_auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/exception/app_exception.dart';
import 'package:presentation/exception/app_exception_handler.dart';
import 'package:presentation/feature/sign_up_success/views/sign_up_success_screen.dart';
import 'package:presentation/injectors/all.dart';

part 'sign_up_success_cubit.freezed.dart';
part 'sign_up_success_state.dart';

class SignUpSuccessCubit extends Cubit<SignUpSuccessState> {
  late final AppExceptionHandler _appExceptionHandler;
  late final FirebaseAuthRepository _firebaseAuthRepository;
  late final SignUpSuccessScreenExtra _extra;

  SignUpSuccessCubit() : super(const SignUpSuccessInitial()) {
    _appExceptionHandler = getIt<AppExceptionHandler>();
    _firebaseAuthRepository = getIt<FirebaseAuthRepository>();
  }

  void onResendPressed() async {
    await _sendEmailVerification();
  }

  Future<void> onScreenInit(SignUpSuccessScreenExtra extra) async {
    _extra = extra;
    await _sendEmailVerification();
  }

  Future<void> _sendEmailVerification() async {
    emit(const LoadingState());
    try {
      await _firebaseAuthRepository.sendEmailVerification(_extra.userId);
      emit(const ResendEmailSuccess());
    } catch (e, stackTrace) {
      final appException = _appExceptionHandler.map(e, stackTrace: stackTrace);
      emit(SignUpSuccessExceptionState(appException));
    }
  }
}
