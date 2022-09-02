import 'package:f_yc_apis/f_yc_apis.dart';
import 'package:f_yc_config/f_yc_config.dart';

class ApisAuth {
  static Future<bool> wxLogin(String code) async {
    if (code.isEmpty) {
      return false;
    }
    Map<String, dynamic>? response =
        await YcApisAuth.wxLogin(YcConfig.apiUriWxLogin(), code);
    if (response != null) {
      return true;
    }
    return false;
  }

  static Future<bool> appleLogin() async {
    Map<String, dynamic>? response =
        await YcApisAuth.appleLogin(YcConfig.apiUriAppleLoginUri());
    if (response != null) {
      return true;
    }
    return false;
  }

  static Future<bool> logout() async {
    bool response = await YcApisAuth.logout(YcConfig.apiUriLogoutUri());
    if (response) {
      return true;
    }
    return false;
  }
}
