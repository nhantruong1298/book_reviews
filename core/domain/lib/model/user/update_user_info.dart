class UpdateUserInfoParams {
  final String id;
  final String displayName;
  final String email;
  final String photoURL;
  final String surname;
  final String name;

  UpdateUserInfoParams({
    required this.id,
    required this.displayName,
    required this.email,
    required this.photoURL,
    required this.surname,
    required this.name,
  });
}
