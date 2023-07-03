import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/data_source/data_storage.dart';
import 'package:data/entity/response/load_book_response.dart';
import 'package:data/entity/response/sign_in_with_email_response.dart';
import 'package:data/entity/response/sign_up_with_email_response.dart';
import 'package:data/networking/firebase_service/firebase_service.dart';
import 'package:domain/repository/log_service.dart';
import 'package:domain/model/user/update_user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ServiceManager {
  late final FireBaseService _fireBaseService;
  // ignore: unused_field
  late final DataStorage _dataStorage;
  // ignore: unused_field
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
      FirebaseFirestore.instance,
      // _instance!._logService,
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

  Future<List<LoadBookResponse>> loadTrendingBooks() {
    return _fireBaseService.loadTrendingBooks();
  }

  Future<List<LoadBookResponse>> loadPopularBooks() {
    return _fireBaseService.loadPopularBooks();
  }

  Future<LoadBookResponse?> loadBook(String id) {
    return _fireBaseService.loadBook(id);
  }

  Future<void> updateUserInfo(UpdateUserInfoParams params) {
    return _fireBaseService.updateUserInfo(params);
  }

  Future<void> sendEmailVerification(String userId) {
    return _fireBaseService.sendEmailVerification(userId);
  }
}
