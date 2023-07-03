import 'package:data/networking/service_manager.dart';
import 'package:domain/model/user/update_user_info.dart';
import 'package:domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final ServiceManager _serviceManager;
  UserRepositoryImpl(this._serviceManager);

  @override
  Future<void> updateUserInfo(UpdateUserInfoParams params) {
    return _serviceManager.updateUserInfo(params);
  }

  @override
  Future<void> loadUserInfo(String userId) {
    return _serviceManager.loadUserInfo(userId);
  }
}
