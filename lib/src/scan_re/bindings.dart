import 'package:f_yc_utils/f_yc_utils.dart';

import 'controller.dart';

class ScanReBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanReController>(() => ScanReController());
  }
}
