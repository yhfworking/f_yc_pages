import 'dart:async';
import 'package:f_yc_apis/f_yc_apis.dart';
import 'package:f_yc_compose/f_yc_compose.dart';
import 'package:f_yc_entity/f_yc_entity.dart';
import 'package:f_yc_storages/f_yc_storages.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:f_yc_widgets/f_yc_widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'index.dart';

class WalletController extends GetxController {
  WalletController();

  final state = WalletState();
  late StreamSubscription _walletUpdateStreamSubscription;

  void _updateWallet() {
    FYcEntitysWallet entitysWallet = FYcStorages.walletInfo();
    if (!GetUtils.isNull(entitysWallet)) {
      state.balance = entitysWallet.balance;
      state.money = entitysWallet.money;
    }
  }

  void handleCashOut(int amount) async {
    if (amount < 1000) {
      EasyLoading.showError('请先选择您要兑换的金额');
      return;
    }
    if (await FYcApisDefault.submitCashOut(amount)) {
      Get.back();
      EasyLoading.showSuccess('提现申请成功，请耐心等待审核！');
    }
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    _updateWallet();
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() async {
    _walletUpdateStreamSubscription = FYcEventBus.instance
        .on<FYcEntitysEventsWalletUpdate>()
        .listen((FYcEntitysEventsWalletUpdate event) {
      _updateWallet();
    });
    await FYcApisDefault.getWalletInfo();
    FYcEntitysBehavior entitysBehavior = FYcStorages.behaviorInfo();
    if (!GetUtils.isNull(entitysBehavior)) {
      if (entitysBehavior.lastAppPraiseDate == 0) {
        Get.dialog(WidgetsAppPraise(appPraiseEvent: () async {
          if (FYcStorages.checkLogin()) {
            await FYcApisDefault.reportAppPraise();
          }
          FYcComposeLaunchReview.toStoreReview();
          Get.back();
        }), barrierDismissible: false);
      }
    }
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
    _walletUpdateStreamSubscription.cancel();
    super.dispose();
  }
}
