import 'dart:async';
import 'package:f_yc_entity/f_yc_entity.dart';
import 'package:f_yc_pages/f_yc_pages.dart';
import 'package:f_yc_storages/f_yc_storages.dart';
import 'package:f_yc_utils/f_yc_utils.dart';

class MineController extends GetxController {
  MineController();

  final state = MineState();
  late StreamSubscription _userInfoUpdateStreamSubscription;

  void resetUserInfo() {
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
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    resetUserInfo();
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    _userInfoUpdateStreamSubscription = FYcEventBus.instance
        .on<FYcEntitysEventsUserInfoUpdate>()
        .listen((FYcEntitysEventsUserInfoUpdate event) {
      resetUserInfo();
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
    super.dispose();
  }
}
