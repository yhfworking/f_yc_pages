import 'package:f_yc_utils/f_yc_utils.dart';

import 'controller.dart';

class UserAgreementBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAgreementController>(() => UserAgreementController());
  }
}
