import 'package:data/mapper/user_data_mapper.dart';
import 'package:data/networking/service_manager.dart';
import 'package:domain/model/user/update_user_info.dart';
import 'package:domain/model/user/user_info.dart';
import 'package:domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final ServiceManager _serviceManager;
  final UserDataMapper _userDataMapper;
  UserRepositoryImpl(this._serviceManager, this._userDataMapper);

  @override
  Future<void> updateUserInfo(UpdateUserInfoParams params) {
    return _serviceManager.updateUserInfo(params);
  }

  @override
  Future<LoadUserInfoResult?> loadUserInfo(String userId) async {
    final response = await _serviceManager.loadUserInfo(userId);
    return _userDataMapper.mapUserInfoResponse(response);
  }
}
