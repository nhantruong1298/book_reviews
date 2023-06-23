import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/entity/response/load_book_response.dart';
import 'package:data/entity/response/sign_in_with_email_response.dart';
import 'package:data/entity/response/sign_up_with_email_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseService {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  //final LogService _logService;
  FireBaseService(this._firebaseAuth,this._firestore);

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

  Future<void> loadBooks({
    required List<String> bookIDs,
  }) async {}

  Future<List<String>> _loadTrendingBookIds() async {
    final ids = <String>[];

    final snapshot = await _firestore.collection("trending-books").get();
    for (final doc in snapshot.docs) {
      ids.add(doc.id);
    }
    return ids;
  }

  Future<List<LoadBookResponse>> loadTrendingBooks() async {
    final result = <LoadBookResponse>[];
    final ids = await _loadTrendingBookIds();

    for (final id in ids) {
      final snapshot =
          await _firestore.collection("books").where('id', isEqualTo: id).get();

      if(snapshot.docs.isNotEmpty){
        result.add(LoadBookResponse.fromJson(snapshot.docs.first.data()));
      }
    }
    return result;
  }
}
