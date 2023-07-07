import 'package:bloc/bloc.dart';
import 'package:domain/model/user/user_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/exception/app_exception.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileInitial());

  void onScreenInit(LoadUserInfoResult userInfo) {
    emit(ProfileLoadedState(userInfo));
  }

  void onEditProfilePressed() {
    
  }
}
