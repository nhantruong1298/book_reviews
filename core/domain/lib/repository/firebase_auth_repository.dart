import 'package:domain/model/authentication/sign_in_with_email.dart';
import 'package:domain/model/authentication/sign_up_with_email.dart';

abstract class FirebaseAuthRepository {
  Future<SignInWithEmailResult> signInWithEmailAndPassword(
      String email, String password);

  Future<SignUpWithEmailResult> signUpWithEmailAndPassword(
    String email,
    String password,
  );

}
