import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:data/networking/service_manager.dart';
import 'package:domain/model/user/update_user_info.dart';
import 'package:domain/model/user/user_info.dart';
import 'package:domain/repository/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:presentation/exception/app_exception.dart';
import 'package:presentation/exception/app_exception_handler.dart';
import 'package:presentation/feature/authentication/cubit/authentication_cubit.dart';
import 'package:presentation/injectors/all.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final AuthenticationCubit _authenticationCubit;
  late final UserRepository _userRepository;
  late final AppExceptionHandler _appExceptionHandler;
  late final ServiceManager _serviceManager;
  ProfileCubit(this._authenticationCubit) : super(const ProfileInitial()) {
    _userRepository = getIt<UserRepository>();
    _appExceptionHandler = getIt<AppExceptionHandler>();
    _serviceManager = getIt<ServiceManager>();
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

  Future<void> onSocialLinkTap(String? link) async {
    try {
      await _userRepository.launchURL(link);
    } catch (error) {
      final appException = _appExceptionHandler.map(error);
      emit(ProfileExceptionState(appException));
    }
  }

  Future<void> onUploadImage(ImageSource source) async {
    try {
      final userInfo = _authenticationCubit.state.userInfo!;

      final XFile? xFile = await ImagePicker().pickImage(source: source);

      if (xFile == null) return;

      final file = File(xFile.path);

      final photoURL =
          await _userRepository.uploadUserImage(userInfo.id!, file);

      await _userRepository.updateUserInfo(UpdateUserInfoParams(
        email: userInfo.email,
        bio: userInfo.bio,
        displayName: userInfo.displayName,
        id: userInfo.id,
        name: userInfo.name,
        photoURL: photoURL,
        surname: userInfo.surname,
        website: userInfo.website,
        facebookURL: userInfo.facebookURL,
        twitterURL: userInfo.twitterURL,
      ));

      await onScreenRefresh();
    } catch (error, stackTrace) {
      final appException =
          _appExceptionHandler.map(error, stackTrace: stackTrace);
      emit(ProfileExceptionState(appException));
    }
  }
}
