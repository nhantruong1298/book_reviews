import 'package:data/entity/response/sign_in_with_email_response.dart';
import 'package:data/entity/response/sign_up_with_email_response.dart';
import 'package:domain/repository/log_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseService {
  final FirebaseAuth _firebaseAuth;
  //final FirebaseFirestore _fireStore;
  final LogService _logService;
  FireBaseService(this._firebaseAuth, this._logService);

  Future<SignInWithEmailResponse> signInWithEmailAndPassword(
      String email, String password) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    return SignInWithEmailResponse(
        userName: result.user?.email ?? '', userId: result.user?.uid ?? '');
  }

  Future<SignUpWithEmailResponse> signUpWithEmailAndPassword(
      String email, String password) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    return SignUpWithEmailResponse(credential);
  }

  Future<void> sendEmailVerification(UserCredential userCredential) async {
    return userCredential.user?.sendEmailVerification();
  }
}
