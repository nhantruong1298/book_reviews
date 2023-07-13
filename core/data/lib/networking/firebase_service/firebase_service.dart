import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/entity/request/update_user_info_request.dart';
import 'package:data/entity/response/load_book_response.dart';
import 'package:data/entity/response/load_user_info_response.dart';
import 'package:data/entity/response/sign_in_with_email_response.dart';
import 'package:data/entity/response/sign_up_with_email_response.dart';
import 'package:domain/exception/business_exception.dart';
import 'package:domain/exception/business_exception_code.dart';
import 'package:domain/firestore_path/firestore_path.dart';
import 'package:domain/model/user/update_user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireBaseService {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage _firebaseStorage;

  late final FirestorePath _firestorePath;
  //final LogService _logService;
  FireBaseService(
      this._firebaseAuth, this._firebaseFirestore, this._firebaseStorage) {
    _firestorePath = FirestorePath();
  }

  Future<SignInWithEmailResponse> signInWithEmailAndPassword(
      String email, String password) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    return SignInWithEmailResponse(
      userName: credential.user?.email ?? '',
      userId: credential.user?.uid ?? '',
    );
  }

  Future<SignUpWithEmailResponse> signUpWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    return SignUpWithEmailResponse(
        email: userCredential.user?.email ?? '',
        userId: userCredential.user?.uid ?? '');
  }

  Future<List<LoadBookResponse>> loadBooks({required List<String> ids}) async {
    final result = <LoadBookResponse>[];
    for (final id in ids) {
      final snapshot = await _firebaseFirestore
          .collection(_firestorePath.collection.books)
          .where(_firestorePath.book.id, isEqualTo: id)
          .get();

      if (snapshot.docs.isNotEmpty) {
        result.add(LoadBookResponse.fromJson(snapshot.docs.first.data()));
      }
    }
    return result;
  }

  Future<List<LoadBookResponse>> loadTrendingBooks() async {
    final result = <LoadBookResponse>[];
    final snapshot = await _firebaseFirestore
        .collection(_firestorePath.collection.books)
        .where(_firestorePath.book.trending, isEqualTo: true)
        .get();

    for (final doc in snapshot.docs) {
      result.add(LoadBookResponse.fromJson(doc.data()));
    }

    return result;
  }

  Future<List<LoadBookResponse>> loadPopularBooks() async {
    final result = <LoadBookResponse>[];
    final snapshot = await _firebaseFirestore
        .collection(_firestorePath.collection.books)
        .where(_firestorePath.book.popular, isEqualTo: true)
        .get();

    for (final doc in snapshot.docs) {
      result.add(LoadBookResponse.fromJson(doc.data()));
    }

    return result;
  }

  Future<LoadBookResponse?> loadBook(String id) async {
    final snapshot = await _firebaseFirestore
        .collection(_firestorePath.collection.books)
        .where(_firestorePath.book.id, isEqualTo: id)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return LoadBookResponse.fromJson(snapshot.docs.first.data());
    }
    return null;
  }

  Future<void> updateUserInfo(UpdateUserInfoParams params) async {
    await _firebaseFirestore
        .collection(_firestorePath.collection.userInfo)
        .doc(params.id)
        .set(UpdateUserInfoRequest(
          id: params.id,
          surname: params.surname,
          name: params.name,
          displayName: params.displayName,
          email: params.email,
          photoURL: params.photoURL,
          bio: params.bio,
          website: params.website,
          facebookURL: params.facebookURL,
          twitterURL: params.twitterURL,
        ).toJson());
  }

  Future<void> sendEmailVerification(String userId) async {
    final currentUserId = _firebaseAuth.currentUser?.uid;
    if (currentUserId != null && currentUserId == userId) {
      _firebaseAuth.currentUser!.sendEmailVerification();
    } else {
      throw BusinessException(
          businessExceptionCode: BusinessExceptionCode.USER_NOT_FOUND);
    }
  }

  Future<LoadUserInfoResponse?> loadUserInfo(String userId) async {
    final snapshot = await _firebaseFirestore
        .collection(_firestorePath.collection.userInfo)
        .doc(userId)
        .get();
    if (snapshot.data() != null) {
      return LoadUserInfoResponse.fromJson(snapshot.data()!);
    }
    throw BusinessException(
        businessExceptionCode: BusinessExceptionCode.USER_NOT_FOUND);
  }

  Future<List<LoadBookResponse>> searchBooks(String bookName) async {
    final response = <LoadBookResponse>[];

    final snapshot = await _firebaseFirestore
        .collection(_firestorePath.collection.books)
        .where(_firestorePath.book.name, whereIn: [bookName]).get();

    if (snapshot.docs.isNotEmpty) {
      for (final doc in snapshot.docs) {
        response.add(LoadBookResponse.fromJson(doc.data()));
      }
    }

    return response;
  }

  Future<void> signOut() async {
    if (_firebaseAuth.currentUser != null) {
      await _firebaseAuth.signOut();
    }
  }

  Future<String> uploadUserImage(String userId, File file) async {
    final currentUser = _firebaseAuth.currentUser;

    if (currentUser != null && userId == currentUser.uid) {
      final snapshot = await _firebaseStorage
          .ref('user-image/')
          .child('${_firebaseAuth.currentUser!.uid}/photo.jpg')
          .putFile(file);

      if (snapshot.state == TaskState.success) {
        final downloadURL = await snapshot.ref.getDownloadURL();
        return downloadURL;
      }
      throw BusinessException(
          businessExceptionCode: BusinessExceptionCode.UNEXPECTED_ERROR);
    }

    throw BusinessException(
        businessExceptionCode: BusinessExceptionCode.USER_NOT_FOUND);
  }

  // File changeFileNameOnlySync(File file, String newFileName) {
  //   var path = file.path;
  //   var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
  //   var newPath = path.substring(0, lastSeparator + 1) + newFileName;
  //   return file.renameSync(newPath);
  // }
}
