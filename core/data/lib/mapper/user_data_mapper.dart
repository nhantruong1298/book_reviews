import 'package:data/entity/response/load_user_info_response.dart';
import 'package:domain/model/user/user_info.dart';

class UserDataMapper {
  LoadUserInfoResult? mapUserInfoResponse(LoadUserInfoResponse? response) {
    if (response != null) {
      return LoadUserInfoResult(
        displayName: "${response.surname} ${response.name}",
        email: response.email,
        id: response.id,
        name: response.name,
        surname: response.surname,
        photoURL: response.photoURL,
        bio: response.bio,
      );
    }
    return null;
  }
}
