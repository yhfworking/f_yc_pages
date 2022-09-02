import 'package:f_yc_utils/f_yc_utils.dart';
import 'controller.dart';

class LogCashOutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogCashOutController>(() => LogCashOutController());
  }
}
