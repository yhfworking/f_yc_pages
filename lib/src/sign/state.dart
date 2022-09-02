import 'package:f_yc_utils/f_yc_utils.dart';

class SignState {
  final _isSignToday = false.obs;
  set isSignToday(value) => _isSignToday.value = value;
  get isSignToday => _isSignToday.value;

  final _continuitySignTimes = 0.obs;
  set continuitySignTimes(value) => _continuitySignTimes.value = value;
  get continuitySignTimes => _continuitySignTimes.value;

  final _isContinuity3RewardEnable = false.obs;
  set isContinuity3RewardEnable(value) =>
      _isContinuity3RewardEnable.value = value;
  get isContinuity3RewardEnable => _isContinuity3RewardEnable.value;

  final _isContinuity7RewardEnable = false.obs;
  set isContinuity7RewardEnable(value) =>
      _isContinuity7RewardEnable.value = value;
  get isContinuity7RewardEnable => _isContinuity7RewardEnable.value;

  final _isContinuity30RewardEnable = false.obs;
  set isContinuity30RewardEnable(value) =>
      _isContinuity30RewardEnable.value = value;
  get isContinuity30RewardEnable => _isContinuity30RewardEnable.value;

  final _isContinuity365RewardEnable = false.obs;
  set isContinuity365RewardEnable(value) =>
      _isContinuity365RewardEnable.value = value;
  get isContinuity365RewardEnable => _isContinuity365RewardEnable.value;
}
