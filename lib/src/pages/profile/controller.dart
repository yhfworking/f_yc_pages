import 'dart:async';
import 'package:f_yc_config/f_yc_config.dart';
import 'package:f_yc_utils/f_yc_utils.dart';

import 'index.dart';

class ProfileController extends GetxController {
  ProfileController();

  final state = ProfileState();
  late StreamSubscription userInfoUpdateStreamSubscription;
  late StreamSubscription walletUpdateStreamSubscription;
  late StreamSubscription behaviorUpdateStreamSubscription;

  void updateStates() {
    YcUser ycUser = YcConfig.userInfo();
    if (ycUser.nickname!.isNotEmpty) {
      state.nickname = ycUser.nickname;
    } else {
      state.nickname = '立即登录';
    }
    if (ycUser.avatar!.isNotEmpty) {
      state.avatar = ycUser.avatar;
    } else {
      state.avatar = YcConfig.defalutAvatarUrl();
    }
    YcWallet ycWallet = YcConfig.walletInfo();
    if (!GetUtils.isNull(ycWallet)) {
      state.balance = ycWallet.balance;
      state.money = ycWallet.money;
    }
    YcBehavior ycBehavior = YcConfig.behaviorInfo();
    if (!GetUtils.isNull(ycBehavior)) {
      if (DateUtil.isToday(ycBehavior.lastSignDate)) {
        state.isSignToday = true;
      } else {
        state.isSignToday = false;
      }
    }
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    updateStates();
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    userInfoUpdateStreamSubscription =
        YcEvents.on<EventsUserInfoUpdate>((event) {
      updateStates();
    });
    walletUpdateStreamSubscription = YcEvents.on<EventsWalletUpdate>((event) {
      updateStates();
    });
    behaviorUpdateStreamSubscription =
        YcEvents.on<EventsBehaviorUpdate>((event) {
      updateStates();
    });
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
    YcEvents.off(userInfoUpdateStreamSubscription);
    YcEvents.off(walletUpdateStreamSubscription);
    YcEvents.off(behaviorUpdateStreamSubscription);
    super.dispose();
  }
}
