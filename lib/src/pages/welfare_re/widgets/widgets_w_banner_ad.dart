import 'package:f_yc_pages/f_yc_pages.dart';
import 'package:f_yc_pangle/f_yc_pangle.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:flutter/material.dart';

class WidgetsWBannerAd extends StatelessWidget {
  const WidgetsWBannerAd({Key? key}) : super(key: key);

  Widget _widget() {
    if (GetUtils.isNull(FYcPages.pangleConfig.welfareReBannerAdId)) {
      return Container(
        width: Get.width,
        height: Get.width / 4.0,
        color: Colors.white,
      );
    }
    return Container(
        width: Get.width,
        height: Get.width / 4.0,
        color: Colors.white,
        child: AspectRatio(
            aspectRatio: 600.0 / 150.0,
            child: Center(
              child: AdBannerWidget(
                  posId: FYcPages.pangleConfig.welfareReBannerAdId,
                  width: Get.width.toInt(),
                  height: (Get.width / 4.0).toDouble().toInt(),
                  interval: 30,
                  show: true),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return _widget();
  }
}
