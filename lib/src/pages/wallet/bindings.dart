import 'package:f_yc_utils/f_yc_utils.dart';

import 'controller.dart';

class WalletBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletController>(() => WalletController());
  }
}
