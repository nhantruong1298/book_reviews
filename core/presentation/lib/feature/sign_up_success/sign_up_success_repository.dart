import 'package:domain/repository/firebase_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:presentation/injectors/all.dart';

class SignUpSuccessRepository{
  late final FirebaseAuthRepository _firebaseAuthRepository;
  SignUpSuccessRepository() {
    _firebaseAuthRepository = getIt<FirebaseAuthRepository>();
  }

  Future<void> sendEmailVerification(UserCredential userCredential) {
    return _firebaseAuthRepository.sendEmailVerification(userCredential);
  }
}