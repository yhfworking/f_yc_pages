import 'package:package_info_plus/package_info_plus.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'index.dart';

class AboutUsController extends GetxController {
  AboutUsController();

  final state = AboutUsState();

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() async {
    PackageInfo platform = await PackageInfo.fromPlatform();
    state.version = platform.version;
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
