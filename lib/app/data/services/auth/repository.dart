import 'package:app_hortifruit_pratico/app/data/models/user_login_request.dart';
import 'package:app_hortifruit_pratico/app/data/models/user_login_response.dart';
import 'package:app_hortifruit_pratico/app/data/providers/api.dart';

class AuthRepository {
  final Api _api;

  AuthRepository(this._api);

  Future<UserLoginResponseModel> login(UserLoginRequestModel userLoginRequest) => _api.login(userLoginRequest);
}
