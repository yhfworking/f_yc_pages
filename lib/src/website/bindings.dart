import 'package:f_yc_utils/f_yc_utils.dart';

import 'controller.dart';

class WebsiteBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WebsiteController());
  }
}
