import 'package:data/entity/response/sign_in_with_email_response.dart';
import 'package:data/entity/response/sign_up_with_email_response.dart';
import 'package:domain/model/authentication/sign_in_with_email.dart';
import 'package:domain/model/authentication/sign_up_with_email.dart';

class FirebaseAuthDataMapper {
  SignInWithEmailResult mapSignInWithEmailResponse(
      SignInWithEmailResponse response) {
    return SignInWithEmailResult(userId: response.userId);
  }

  SignUpWithEmailResult mapSignUpWithEmailResponse(SignUpWithEmailResponse response) {
    return SignUpWithEmailResult(response.userCredential);
  }
}
