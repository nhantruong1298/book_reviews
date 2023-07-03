part of 'authentication_cubit.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.init() = AuthenticationInitial;
  const factory AuthenticationState.unauthorized() = UnauthorizedState;
  const factory AuthenticationState.authorized(LoadUserInfoResult userInfo) =
      AuthorizedState;
}
