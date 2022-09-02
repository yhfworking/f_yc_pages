import 'dart:async';
import 'package:f_yc_apis/f_yc_apis.dart';
import 'package:f_yc_config/f_yc_config.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:f_yc_widgets/f_yc_widgets.dart';

import 'index.dart';

class SignController extends GetxController {
  SignController();

  final state = SignState();
  late StreamSubscription behaviorUpdateStreamSubscription;

  void _updateBehaviorInfo() {
    YcBehavior ycBehavior = YcConfig.behaviorInfo();
    if (!GetUtils.isNull(ycBehavior)) {
      state.continuitySignTimes = ycBehavior.continuitySignTimes;
      state.isSignToday = DateUtil.isToday(ycBehavior.lastSignDate ?? 0);
      state.isContinuity3RewardEnable = ycBehavior.isContinuity3RewardEnable;
      state.isContinuity7RewardEnable = ycBehavior.isContinuity7RewardEnable;
      state.isContinuity30RewardEnable = ycBehavior.isContinuity30RewardEnable;
      state.isContinuity365RewardEnable =
          ycBehavior.isContinuity365RewardEnable;
    }
  }

  void handelSignAction() async {
    if (state.isSignToday) {
      return;
    }
    LoadingUtils.show();
    Future.delayed(const Duration(milliseconds: 1500), () {
      LoadingUtils.dismiss();
      Get.dialog(const WidgetsRewardAdGuide(
        rewardType: 'sign',
      ));
    });
  }

  void handelContinuityDaysSignAction(int days) async {
    String string = '';
    if (days == 3) {
      string = 'continuitySign3';
    } else if (days == 7) {
      string = 'continuitySign7';
    } else if (days == 30) {
      string = 'continuitySign30';
    } else if (days == 365) {
      string = 'continuitySign365';
    }
    if (string.isNotEmpty) {
      LoadingUtils.show();
      Future.delayed(const Duration(milliseconds: 1500), () {
        LoadingUtils.dismiss();
        Get.dialog(WidgetsRewardAdGuide(
          rewardType: string,
        ));
      });
    }
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    behaviorUpdateStreamSubscription =
        YcEvents.on<EventsBehaviorUpdate>((event) {
      _updateBehaviorInfo();
    });
    YcApisDefault.getBehaviorInfo();
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    YcEvents.off(behaviorUpdateStreamSubscription);
    super.dispose();
  }
}
