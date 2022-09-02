import 'package:f_yc_utils/f_yc_utils.dart';
import 'controller.dart';

class CancelAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CancelAccountController>(() => CancelAccountController());
  }
}
