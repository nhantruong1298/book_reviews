import 'dart:io';

import 'package:data/mapper/user_data_mapper.dart';
import 'package:data/networking/service_manager.dart';
import 'package:domain/exception/business_exception.dart';
import 'package:domain/exception/business_exception_code.dart';
import 'package:domain/model/user/update_user_info.dart';
import 'package:domain/model/user/user_info.dart';
import 'package:domain/repository/user_repository.dart';
import 'package:url_launcher/url_launcher.dart';

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

  @override
  Future<void> launchURL(String? link) async {
    final Uri url = Uri.parse(link ?? '');
    final canLaunch = await canLaunchUrl(url);
    if (canLaunch) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw BusinessException(
          businessExceptionCode: BusinessExceptionCode.COULD_NOT_LAUNCH_URL);
    }
  }

  @override
  Future<String> uploadUserImage(String userId, File file) {
    return _serviceManager.uploadUserImage(userId, file);
  }
}
