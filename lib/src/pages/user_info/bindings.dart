import 'package:f_yc_utils/f_yc_utils.dart';

import 'controller.dart';

class UserInfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserInfoController>(() => UserInfoController());
  }
}
