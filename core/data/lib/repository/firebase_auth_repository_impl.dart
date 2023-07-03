import 'package:data/mapper/firebase_auth_data_mapper.dart';
import 'package:data/networking/service_manager.dart';
import 'package:domain/model/authentication/sign_in_with_email.dart';
import 'package:domain/model/authentication/sign_up_with_email.dart';
import 'package:domain/repository/firebase_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepositoryImpl extends FirebaseAuthRepository {
  final ServiceManager _serviceManager;
  final FirebaseAuthDataMapper _dataMapper;
  FirebaseAuthRepositoryImpl(this._serviceManager, this._dataMapper);
  @override
  Future<SignInWithEmailResult> signInWithEmailAndPassword(
      String email, String password) async {
    final response =
        await _serviceManager.signInWithEmailAndPassword(email, password);

    return SignInWithEmailResult(
        userName: response.userName, userId: response.userId);
  }

  @override
  Future<SignUpWithEmailResult> signUpWithEmailAndPassword(
      String email, String password) async {
    final response =
        await _serviceManager.signUpWithEmailAndPassword(email, password);

    return _dataMapper.mapSignUpWithEmailResponse(response);
  }

  @override
  Future<void> sendEmailVerification(String userId) {
    return _serviceManager.sendEmailVerification(userId);
  }
}
