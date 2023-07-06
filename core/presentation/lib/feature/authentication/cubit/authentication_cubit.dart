import 'package:bloc/bloc.dart';
import 'package:domain/model/user/user_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_cubit.freezed.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(const AuthenticationInitial(null));

  void onSignOut() {
    emit(const UnauthorizedState(null));
  }

  void onSignIn(LoadUserInfoResult userInfo) {
    emit(AuthorizedState(userInfo));
  }
}
