import 'package:f_yc_utils/f_yc_utils.dart';
import 'controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
