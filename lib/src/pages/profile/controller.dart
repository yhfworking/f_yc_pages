import 'dart:async';
import 'package:f_yc_entity/f_yc_entity.dart';
import 'package:f_yc_pages/f_yc_pages.dart';
import 'package:f_yc_storages/f_yc_storages.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';

class ProfileController extends GetxController {
  ProfileController();

  final state = ProfileState();
  late StreamSubscription _userInfoUpdateStreamSubscription;
  late StreamSubscription _walletUpdateStreamSubscription;
  late StreamSubscription _behaviorUpdateStreamSubscription;

  void updateStates() {
    FYcEntitysUser entitysUser = FYcStorages.userInfo();
    if (entitysUser.nickname!.isNotEmpty) {
      state.nickname = entitysUser.nickname;
    } else {
      state.nickname = '立即登录';
    }
    if (entitysUser.avatar!.isNotEmpty) {
      state.avatar = entitysUser.avatar;
    } else {
      state.avatar = FYcPages.commonConfig.defalutAvatarUrl;
    }
    FYcEntitysWallet entitysWallet = FYcStorages.walletInfo();
    if (!GetUtils.isNull(entitysWallet)) {
      state.balance = entitysWallet.balance;
      state.money = entitysWallet.money;
    }
    FYcEntitysBehavior entitysBehavior = FYcStorages.behaviorInfo();
    if (!GetUtils.isNull(entitysBehavior)) {
      if (DateUtil.isToday(entitysBehavior.lastSignDate)) {
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
    _userInfoUpdateStreamSubscription = FYcEventBus.instance
        .on<FYcEntitysEventsUserInfoUpdate>()
        .listen((FYcEntitysEventsUserInfoUpdate event) {
      updateStates();
    });

    _walletUpdateStreamSubscription = FYcEventBus.instance
        .on<FYcEntitysEventsWalletUpdate>()
        .listen((FYcEntitysEventsWalletUpdate event) {
      updateStates();
    });

    _behaviorUpdateStreamSubscription = FYcEventBus.instance
        .on<FYcEntitysEventsBehaviorUpdate>()
        .listen((FYcEntitysEventsBehaviorUpdate event) {
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
    _userInfoUpdateStreamSubscription.cancel();
    _walletUpdateStreamSubscription.cancel();
    _behaviorUpdateStreamSubscription.cancel();
    super.dispose();
  }
}
