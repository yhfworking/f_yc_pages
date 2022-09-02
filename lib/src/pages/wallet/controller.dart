import 'dart:async';
import 'package:f_yc_apis/f_yc_apis.dart';
import 'package:f_yc_config/f_yc_config.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:f_yc_widgets/f_yc_widgets.dart';

import 'index.dart';

class WalletController extends GetxController {
  WalletController();

  final state = WalletState();
  late StreamSubscription walletUpdateStreamSubscription;

  void _updateWallet() {
    YcWallet ycWallet = YcConfig.walletInfo();
    if (!GetUtils.isNull(ycWallet)) {
      state.balance = ycWallet.balance;
      state.money = ycWallet.money;
    }
  }

  void handleCashOut(int amount) async {
    if (amount < 1000) {
      SnackbarUtils.showError('请先选择您要兑换的金额');
      return;
    }
    if (await YcApisDefault.submitCashOut(amount)) {
      Get.back();
      SnackbarUtils.showSuccess('提现申请成功，请耐心等待审核！');
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
  void onReady() {
    walletUpdateStreamSubscription = YcEvents.on<EventsWalletUpdate>((event) {
      _updateWallet();
    });
    YcApisDefault.getWalletInfo();
    YcBehavior ycBehavior = YcConfig.behaviorInfo();
    if (!GetUtils.isNull(ycBehavior)) {
      if (ycBehavior.lastAppPraiseDate == 0) {
        Get.dialog(const WidgetsAppPraise(), barrierDismissible: false);
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
    YcEvents.off(walletUpdateStreamSubscription);
    super.dispose();
  }
}
