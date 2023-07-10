import 'package:bloc/bloc.dart';
import 'package:domain/model/user/user_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/exception/app_exception.dart';
import 'package:presentation/exception/app_exception_handler.dart';
import 'package:presentation/feature/authentication/cubit/authentication_cubit.dart';
import 'package:presentation/injectors/all.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final AuthenticationCubit _authenticationCubit;
  late final AppExceptionHandler _appExceptionHandler;
  ProfileCubit(this._authenticationCubit) : super(const ProfileInitial()) {
    _appExceptionHandler = getIt<AppExceptionHandler>();
  }

  void onScreenInit() {
    final userInfo = _authenticationCubit.state.userInfo!;
    emit(ProfileLoadedState(userInfo));
  }

  void onUserInfoChanged(LoadUserInfoResult userInfo) {
    emit(const LoadingState());
    emit(ProfileLoadedState(userInfo));
  }

  Future<void> onScreenRefresh() async {
    emit(const LoadingState());
    try {
      await _authenticationCubit.onReloadUserInfo();
      final newUserInfo = _authenticationCubit.state.userInfo!;

      emit(ProfileLoadedState(newUserInfo));
    } catch (error, stackTrace) {
      final appException =
          _appExceptionHandler.map(error, stackTrace: stackTrace);
      emit(ProfileExceptionState(appException));
    }
  }
}
