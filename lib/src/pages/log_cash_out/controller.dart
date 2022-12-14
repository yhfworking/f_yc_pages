import 'package:f_yc_apis/f_yc_apis.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'index.dart';

class LogCashOutController extends GetxController {
  LogCashOutController();

  final state = LogCashOutState();

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    List dataList = await FYcApisDefault.queryCashOuts();
    state.cashOutLogs = dataList;
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
