import 'package:f_yc_pages/f_yc_pages.dart';
import 'package:f_yc_pangle/f_yc_pangle.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WidgetsBannerAd extends StatelessWidget {
  double? width = Get.width;
  WidgetsBannerAd({Key? key, this.width}) : super(key: key);

  Widget _widget() {
    if (GetUtils.isNull(FYcPages.pangleConfig.profileBannerAdId)) {
      return Container(
        width: width ?? Get.width,
        height: width! / 4.0,
        color: Colors.white,
      );
    }
    return Container(
        width: width ?? Get.width,
        height: width != null ? width! / 4.0 : Get.width / 4.0,
        color: Colors.white,
        child: AspectRatio(
            aspectRatio: 4.0,
            child: Center(
              child: AdBannerWidget(
                posId: FYcPages.pangleConfig.profileBannerAdId,
                width: width != null ? width!.toInt() : Get.width.toInt(),
                height: (width != null ? width! / 4.0 : Get.width / 4.0)
                    .toDouble()
                    .toInt(),
                interval: 30,
                show: true,
                autoClose: false,
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return _widget();
  }
}
