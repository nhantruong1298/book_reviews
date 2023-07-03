part of 'authentication_cubit.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.init(LoadUserInfoResult? userInfo) =
      AuthenticationInitial;
  const factory AuthenticationState.unauthorized(LoadUserInfoResult? userInfo) =
      UnauthorizedState;
  const factory AuthenticationState.authorized(LoadUserInfoResult? userInfo) =
      AuthorizedState;
}
