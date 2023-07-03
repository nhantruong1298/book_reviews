import 'package:domain/model/user/update_user_info.dart';

abstract class UserRepository {
  Future<void> updateUserInfo(UpdateUserInfoParams params);

  Future<void> loadUserInfo(String userId);
}
