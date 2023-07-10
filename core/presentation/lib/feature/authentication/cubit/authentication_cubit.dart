import 'package:bloc/bloc.dart';
import 'package:domain/model/user/user_info.dart';
import 'package:domain/repository/firebase_auth_repository.dart';
import 'package:domain/repository/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/injectors/all.dart';

part 'authentication_cubit.freezed.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  late final FirebaseAuthRepository _firebaseAuthRepository;
  late final UserRepository _userRepository;
  AuthenticationCubit() : super(const AuthenticationInitial(null)) {
    _firebaseAuthRepository = getIt<FirebaseAuthRepository>();
    _userRepository = getIt<UserRepository>();
  }

  Future<void> onSignOut() async {
    await _firebaseAuthRepository.signOut();
    emit(const UnauthorizedState(null));
  }

  void onSignInSuccess(LoadUserInfoResult userInfo) {
    emit(AuthorizedState(userInfo));
  }

  Future<void> onReloadUserInfo() async {
    if (state is AuthorizedState) {
      final oldUserInfo = state.userInfo!;
      final newUserInfo = await _userRepository.loadUserInfo(oldUserInfo.id!);

      emit(AuthorizedState(newUserInfo));
    }
  }
}
