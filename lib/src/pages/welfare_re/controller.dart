import 'dart:async';
import 'package:f_yc_apis/f_yc_apis.dart';
import 'package:f_yc_config/f_yc_config.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:f_yc_widgets/f_yc_widgets.dart';

import 'index.dart';

class WelfareReController extends GetxController {
  WelfareReController();

  final state = WelfareReState();
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  late StreamSubscription welfareReUpdateStreamSubscription;

  void onRefresh() async {
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    refreshController.loadComplete();
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> loadDataFromService() async {
    state.dataList = await YcApisDefault.queryUserWelfareRe();
  }

  void handleReceiveWelfare(Map<String, dynamic> map) async {
    if (map.isNotEmpty) {
      int amount = map['amount'];
      String code = map['_id'];
      if (amount <= 0 || code.isEmpty) {
        return;
      }
      bool isSuccess = await YcApisDefault.receiveUserWelfareRe(amount, code);
      if (isSuccess) {
        await loadDataFromService();
        Get.dialog(WidgetsGoldReceive(amount: amount),
            barrierDismissible: false);
      }
    }
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() async {
    await loadDataFromService();
    welfareReUpdateStreamSubscription =
        YcEvents.on<EventsWelfareReUpdate>((event) async {
      await loadDataFromService();
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
    YcEvents.off(welfareReUpdateStreamSubscription);
    super.dispose();
  }
}
