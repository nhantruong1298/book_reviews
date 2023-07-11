import 'package:bloc/bloc.dart';
import 'package:domain/model/user/update_user_info.dart';
import 'package:domain/model/user/user_info.dart';
import 'package:domain/repository/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/exception/app_exception.dart';
import 'package:presentation/exception/app_exception_handler.dart';
import 'package:presentation/injectors/all.dart';

part 'edit_profile_state.dart';
part 'edit_profile_cubit.freezed.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  late final UserRepository _userRepository;
  late final AppExceptionHandler _appExceptionHandler;

  EditProfileCubit() : super(const EditProfileInitial()) {
    _userRepository = getIt<UserRepository>();
    _appExceptionHandler = getIt<AppExceptionHandler>();
  }

  Future<void> onSaveButtonPressed(LoadUserInfoResult userInfo, String newBio,
      String newWebsite, String newFacebookURL, String newTwitterURL) async {
    emit(const EditProfileLoadingState());
    try {
      await _userRepository.updateUserInfo(UpdateUserInfoParams(
        email: userInfo.email,
        bio: newBio,
        displayName: userInfo.displayName,
        id: userInfo.id,
        name: userInfo.name,
        photoURL: userInfo.photoURL,
        surname: userInfo.surname,
        website: newWebsite.isEmpty ? null : newWebsite,
        facebookURL: newFacebookURL.isEmpty ? null : newFacebookURL,
        twitterURL: newTwitterURL.isEmpty ? null : newTwitterURL,
      ));

      final newUserInfo = await _userRepository.loadUserInfo(userInfo.id ?? '');

      if (newUserInfo != null) {
        emit(EditProfileSuccessState(newUserInfo));
      }
    } catch (error) {
      final appException = _appExceptionHandler.mapFirebaseException(error);
      emit(EditProfileExceptionState(appException));
    }
  }
}
