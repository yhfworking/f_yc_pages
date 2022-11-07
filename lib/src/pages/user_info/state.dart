import 'package:f_yc_pages/f_yc_pages.dart';
import 'package:f_yc_utils/f_yc_utils.dart';

class UserInfoState {
  // nickname
  final _nickname = '立即登录'.obs;
  set nickname(value) => _nickname.value = value;
  get nickname => _nickname.value;
  // avatar
  final _avatar = FYcPages.commonConfig.defalutAvatarUrl.obs;
  set avatar(value) => _avatar.value = value;
  get avatar => _avatar.value;
}
