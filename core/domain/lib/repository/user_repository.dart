import 'dart:io';

import 'package:domain/model/user/update_user_info.dart';
import 'package:domain/model/user/user_info.dart';

abstract class UserRepository {
  Future<void> updateUserInfo(UpdateUserInfoParams params);

  Future<LoadUserInfoResult?> loadUserInfo(String userId);

  Future<void> launchURL(String? link);

  Future<String> uploadUserImage(String userId, File file);
}
