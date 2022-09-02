import 'package:f_yc_utils/f_yc_utils.dart';

import 'controller.dart';

class TimerReBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TimerReController>(() => TimerReController());
  }
}
