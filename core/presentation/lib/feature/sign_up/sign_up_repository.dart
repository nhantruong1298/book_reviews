import 'package:domain/model/authentication/sign_up_with_email.dart';
import 'package:domain/repository/firebase_auth_repository.dart';
import 'package:presentation/injectors/all.dart';

class SignUpRepository {
  late final FirebaseAuthRepository _firebaseAuthRepository;
  SignUpRepository() {
    _firebaseAuthRepository = getIt<FirebaseAuthRepository>();
  }

  Future<SignUpWithEmailResult> signUpWithEmail(
      String userName, String password) async {
    final result = await _firebaseAuthRepository.signUpWithEmailAndPassword(
        userName, password);

    return result;
  }
}
