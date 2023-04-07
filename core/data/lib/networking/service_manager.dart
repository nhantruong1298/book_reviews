import 'package:data/entity/response/sign_up_with_email_response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:data/data_source/data_storage.dart';
import 'package:data/entity/response/sign_in_with_email_response.dart';
import 'package:data/networking/firebase_service/firebase_service.dart';
import 'package:domain/repository/log_service.dart';

class ServiceManager {
  late final FireBaseService _fireBaseService;
  late final DataStorage _dataStorage;
  late final LogService _logService;

  static ServiceManager? _instance;
  ServiceManager._internal();

  factory ServiceManager(DataStorage dataStorage, LogService logService) {
    if (_instance != null) {
      return _instance!;
    }

    _instance = ServiceManager._internal();
    _instance!._dataStorage = dataStorage;
    _instance!._logService = logService;
    _instance!._fireBaseService = FireBaseService(
      FirebaseAuth.instance,
      _instance!._logService,
    );

    return _instance!;
  }

  Future<SignInWithEmailResponse> signInWithEmailAndPassword(
      String email, String password) async {
    final response =
        await _fireBaseService.signInWithEmailAndPassword(email, password);

    return response;
  }

  Future<SignUpWithEmailResponse> signUpWithEmailAndPassword(
      String userName, String password) async {
    final response =
        await _fireBaseService.signUpWithEmailAndPassword(userName, password);
    return response;
  }

  Future<void> sendEmailVerification(UserCredential userCredential) async {
    return _fireBaseService.sendEmailVerification(userCredential);
  }

  //Future<SignUpWithEmailResult>
}
