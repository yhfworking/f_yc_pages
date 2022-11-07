import 'package:f_yc_config/f_yc_config.dart';
import 'package:f_yc_pages/f_yc_pages.dart';
import 'package:f_yc_utils/f_yc_utils.dart';

class ProfileState {
  final _nickname = '立即登录'.obs;
  set nickname(value) => _nickname.value = value;
  get nickname => _nickname.value;

  final _avatar = FYcPages.commonConfig.defalutAvatarUrl.obs;
  set avatar(value) => _avatar.value = value;
  get avatar => _avatar.value;

  final _balance = 0.obs;
  set balance(value) => _balance.value = value;
  get balance => _balance.value;

  final _money = "0.00".obs;
  set money(value) => _money.value = value;
  get money => _money.value;

  final _isSignToday = false.obs;
  set isSignToday(value) => _isSignToday.value = value;
  get isSignToday => _isSignToday.value;
}
