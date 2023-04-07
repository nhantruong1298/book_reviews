part of 'authentication_cubit.dart';

// ignore: must_be_immutable
class AuthenticationState extends Equatable {
  UserCredential? _userCredential;

  AuthenticationState();

  void setUserCredential(UserCredential userCredential) {
    _userCredential = userCredential;
  }

  UserCredential? get userCredential => _userCredential;

  @override
  List<Object?> get props => [
        _userCredential,
      ];
}
