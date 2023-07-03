class FirestorePath {
  final collection = _CollectionPath();
  final book = _BookPath();
}

class _CollectionPath {
  final books = 'books';
  final userInfo = 'user-info';
}

class _BookPath {
  final String id = 'id';
  final String trending = 'isTrending';
  final String popular = 'isPopular';
  final String name = 'name';
}
