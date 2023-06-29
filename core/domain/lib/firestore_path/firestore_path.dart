class FirestorePath {
  final collectionPath = _CollectionPath();
  final bookPath = _BookPath();
}

class _CollectionPath {
  final books = 'books';
}

class _BookPath {
  final String id = 'id';
  final String trending = 'isTrending';
  final String popular = 'isPopular';
}
