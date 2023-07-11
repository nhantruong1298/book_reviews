class LoadUserInfoResult {
  final String? id;
  final String? email;
  final String? displayName;
  final String? surname;
  final String? name;
  final String? photoURL;
  final String? bio;
  final String? website;
  final String? facebookURL;
  final String? twitterURL;

  LoadUserInfoResult({
    this.id,
    this.email,
    this.displayName,
    this.surname,
    this.name,
    this.photoURL,
    this.bio,
    this.website,
    this.facebookURL,
    this.twitterURL,
  });

  LoadUserInfoResult copyWith({
    String? id,
    String? email,
    String? displayName,
    String? surname,
    String? name,
    String? photoURL,
    String? bio,
    String? website,
    String? facebookURL,
    String? twitterURL,
  }) {
    return LoadUserInfoResult(
      id: id ?? this.id,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      displayName: displayName ?? this.displayName,
      facebookURL: facebookURL ?? this.facebookURL,
      name: name ?? this.name,
      photoURL: photoURL ?? this.photoURL,
      surname: surname ?? this.surname,
      twitterURL: twitterURL ?? this.twitterURL,
      website: website ?? this.website,
    );
  }
}
