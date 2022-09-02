import 'dart:async';
import 'package:flutter_wekan/components/apis/components_apis_default.dart';
import 'package:flutter_wekan/components/entitys/index.dart';
import 'package:flutter_wekan/components/events/index.dart';
import 'package:flutter_wekan/components/utils/index.dart';
import 'package:flutter_wekan/components/widgets/widgets_reward_ad_guide.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter_wekan/components/index.dart';
import 'package:flutter_wekan/components/pages/index.dart';

class SignController extends GetxController {
  SignController();

  final state = SignState();
  late StreamSubscription behaviorUpdateStreamSubscription;

  void _updateBehaviorInfo() {
    EntitysBehavior entitysBehavior = ComponentsStorages.behaviorInfo();
    if (!GetUtils.isNull(entitysBehavior)) {
      state.continuitySignTimes = entitysBehavior.continuitySignTimes;
      state.isSignToday = DateUtil.isToday(entitysBehavior.lastSignDate ?? 0);
      state.isContinuity3RewardEnable =
          entitysBehavior.isContinuity3RewardEnable;
      state.isContinuity7RewardEnable =
          entitysBehavior.isContinuity7RewardEnable;
      state.isContinuity30RewardEnable =
          entitysBehavior.isContinuity30RewardEnable;
      state.isContinuity365RewardEnable =
          entitysBehavior.isContinuity365RewardEnable;
    }
  }

  void handelSignAction() async {
    if (state.isSignToday) {
      return;
    }
    UtilsLoading.show();
    Future.delayed(Duration(milliseconds: 1500), () {
      UtilsLoading.dismiss();
      Get.dialog(WidgetsRewardAdGuide(
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
      UtilsLoading.show();
      Future.delayed(Duration(milliseconds: 1500), () {
        UtilsLoading.dismiss();
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
        ComponentsEvent.on<EventsBehaviorUpdate>((event) {
      _updateBehaviorInfo();
    });
    ComponentsApisDefault.getBehaviorInfo();
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
    ComponentsEvent.off(behaviorUpdateStreamSubscription);
    super.dispose();
  }
}
