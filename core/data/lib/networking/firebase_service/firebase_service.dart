import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/entity/request/update_user_info_request.dart';
import 'package:data/entity/response/load_book_response.dart';
import 'package:data/entity/response/sign_in_with_email_response.dart';
import 'package:data/entity/response/sign_up_with_email_response.dart';
import 'package:domain/exception/business_exception.dart';
import 'package:domain/exception/business_exception_code.dart';
import 'package:domain/firestore_path/firestore_path.dart';
import 'package:domain/model/user/update_user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseService {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  late final FirestorePath _firestorePath;
  //final LogService _logService;
  FireBaseService(this._firebaseAuth, this._firestore) {
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
      final snapshot = await _firestore
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
    final snapshot = await _firestore
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
    final snapshot = await _firestore
        .collection(_firestorePath.collection.books)
        .where(_firestorePath.book.popular, isEqualTo: true)
        .get();

    for (final doc in snapshot.docs) {
      result.add(LoadBookResponse.fromJson(doc.data()));
    }

    return result;
  }

  Future<LoadBookResponse?> loadBook(String id) async {
    final snapshot = await _firestore
        .collection(_firestorePath.collection.books)
        .where(_firestorePath.book.id, isEqualTo: id)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return LoadBookResponse.fromJson(snapshot.docs.first.data());
    }
    return null;
  }

  Future<void> updateUserInfo(UpdateUserInfoParams params) async {
    await _firestore
        .collection(_firestorePath.collection.userInfo)
        .doc(params.id)
        .set(UpdateUserInfoRequest(
          id: params.id,
          surname: params.surname,
          name: params.name,
          displayName: '${params.name} ${params.surname}',
          email: params.email,
          photoURL: params.photoURL,
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

  Future<void> loadUserInfo(String userId) async {
    final currentUserId = _firebaseAuth.currentUser?.uid;
    if (currentUserId != null && currentUserId == userId) {
      _firebaseAuth.currentUser!.sendEmailVerification();
    } else {
      throw BusinessException(
          businessExceptionCode: BusinessExceptionCode.USER_NOT_FOUND);
    }
  }

  Future<List<LoadBookResponse>> searchBooks(String bookName) async {
    final response = <LoadBookResponse>[];

    final snapshot = await _firestore
        .collection(_firestorePath.collection.books)
        .where(_firestorePath.book.name, whereIn: [bookName]).get();

    if (snapshot.docs.isNotEmpty) {
      for (final doc in snapshot.docs) {
        response.add(LoadBookResponse.fromJson(doc.data()));
      }
    }

    return response;
  }
}
