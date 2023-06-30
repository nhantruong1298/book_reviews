import 'package:bloc/bloc.dart';
import 'package:domain/repository/firebase_auth_repository.dart';
import 'package:meta/meta.dart';
import 'package:presentation/injectors/all.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  late final FirebaseAuthRepository _firebaseAuthRepository;
  SignInCubit() : super(SignInInitial()) {
    _firebaseAuthRepository = getIt<FirebaseAuthRepository>();
  }

  Future<void> onSignIn(String username, String password) async {
    try {
      final result = await _firebaseAuthRepository.signInWithEmailAndPassword(
          username, password);
      print(result);
    } catch (error) {}
  }
}
