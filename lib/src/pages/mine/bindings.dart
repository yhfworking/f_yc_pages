import 'package:f_yc_utils/f_yc_utils.dart';

import 'controller.dart';

class MineBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MineController>(() => MineController());
  }
}
