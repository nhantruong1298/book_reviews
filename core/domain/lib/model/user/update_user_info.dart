class UpdateUserInfoParams {
  final String id;
  final String displayName;
  final String email;
  final String photoURL;

  UpdateUserInfoParams({
    required this.id,
    required this.displayName,
    required this.email,
    required this.photoURL,
  });
}
