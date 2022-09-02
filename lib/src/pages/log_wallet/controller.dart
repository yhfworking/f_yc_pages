import 'package:f_yc_apis/f_yc_apis.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'index.dart';

class LogWalletController extends GetxController {
  LogWalletController();

  final state = LogWalletState();

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() async {
    List dataList = await YcApisDefault.queryWalletLog();
    state.walletLogs = dataList;
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
