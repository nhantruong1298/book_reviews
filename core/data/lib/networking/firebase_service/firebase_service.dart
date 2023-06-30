import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/entity/response/load_book_response.dart';
import 'package:data/entity/response/sign_in_with_email_response.dart';
import 'package:data/entity/response/sign_up_with_email_response.dart';
import 'package:domain/firestore_path/firestore_path.dart';
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
    final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    return SignInWithEmailResponse(
      userName: result.user?.email ?? '',
      userId: result.user?.uid ?? '',
    );
  }

  Future<SignUpWithEmailResponse> signUpWithEmailAndPassword(
      String email, String password) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    return SignUpWithEmailResponse(credential);
  }

  Future<List<LoadBookResponse>> loadBooks({required List<String> ids}) async {
    final result = <LoadBookResponse>[];
    for (final id in ids) {
      final snapshot = await _firestore
          .collection(_firestorePath.collectionPath.books)
          .where(_firestorePath.bookPath.id, isEqualTo: id)
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
        .collection(_firestorePath.collectionPath.books)
        .where(_firestorePath.bookPath.trending, isEqualTo: true)
        .get();

    for (final doc in snapshot.docs) {
      result.add(LoadBookResponse.fromJson(doc.data()));
    }

    return result;
  }

  Future<List<LoadBookResponse>> loadPopularBooks() async {
    final result = <LoadBookResponse>[];
    final snapshot = await _firestore
        .collection(_firestorePath.collectionPath.books)
        .where(_firestorePath.bookPath.popular, isEqualTo: true)
        .get();

    for (final doc in snapshot.docs) {
      result.add(LoadBookResponse.fromJson(doc.data()));
    }

    return result;
  }

  Future<LoadBookResponse?> loadBook(String id) async {
    final snapshot = await _firestore
        .collection(_firestorePath.collectionPath.books)
        .where(_firestorePath.bookPath.id, isEqualTo: id)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return LoadBookResponse.fromJson(snapshot.docs.first.data());
    }
    return null;
  }
}
