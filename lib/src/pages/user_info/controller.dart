import 'package:f_yc_entity/f_yc_entity.dart';
import 'package:f_yc_pages/f_yc_pages.dart';
import 'package:f_yc_storages/f_yc_storages.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'index.dart';

class UserInfoController extends GetxController {
  UserInfoController();

  final state = UserInfoState();

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    FYcEntitysUser ycUser = FYcStorages.userInfo();
    if (ycUser.nickname != null) {
      state.nickname = ycUser.nickname ?? '';
    }
    if (ycUser.avatar != null) {
      state.avatar = ycUser.avatar ?? FYcPages.commonConfig.defalutAvatarUrl;
    }
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
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
    super.dispose();
  }
}
