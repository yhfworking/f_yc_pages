import 'dart:async';
import 'package:f_yc_apis/f_yc_apis.dart';
import 'package:f_yc_entity/f_yc_entity.dart';
import 'package:f_yc_pangle/f_yc_pangle.dart';
import 'package:f_yc_storages/f_yc_storages.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:f_yc_widgets/f_yc_widgets.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'index.dart';

class SignController extends GetxController {
  SignController();

  final state = SignState();
  late StreamSubscription _behaviorUpdateStreamSubscription;

  void _updateBehaviorInfo() {
    FYcEntitysBehavior entitysBehavior = FYcStorages.behaviorInfo();
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
    EasyLoading.show();
    Future.delayed(const Duration(milliseconds: 1500), () {
      EasyLoading.dismiss();
      Get.dialog(WidgetsRewardAdGuide(
        showRewardVideoAdEvent: () {
          FYcPangle.showRewardVideoAd(
              key: 'sign', userId: FYcStorages.userInfo().userId);
        },
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
      EasyLoading.show();
      Future.delayed(const Duration(milliseconds: 1500), () {
        EasyLoading.dismiss();
        Get.dialog(WidgetsRewardAdGuide(
          showRewardVideoAdEvent: () {
            FYcPangle.showRewardVideoAd(
                key: string, userId: FYcStorages.userInfo().userId);
          },
        ));
      });
    }
  }

  /// ??? widget ?????????????????????????????????
  @override
  void onInit() {
    super.onInit();
  }

  /// ??? onInit() ???????????? 1 ?????????????????????????????????
  @override
  void onReady() async {
    _behaviorUpdateStreamSubscription = FYcEventBus.instance
        .on<FYcEntitysEventsBehaviorUpdate>()
        .listen((FYcEntitysEventsBehaviorUpdate event) {
      _updateBehaviorInfo();
    });
    await FYcApisDefault.getBehaviorInfo();
    super.onReady();
  }

  /// ??? [onDelete] ?????????????????????
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose ????????????
  @override
  void dispose() {
    _behaviorUpdateStreamSubscription.cancel();
    super.dispose();
  }
}
