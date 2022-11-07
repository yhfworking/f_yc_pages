import 'package:f_yc_pages/f_yc_pages.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends GetView<AboutUsController> {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text('关于我们')),
          body: SafeArea(
              child: SizedBox(
                  width: Get.width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 60),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: Image.network(
                                    FYcPages.commonConfig.logoUrl,
                                    fit: BoxFit.fill,
                                  )),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: Text(
                                  FYcPages.commonConfig.appName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: FYcPages
                                          .commonConfig.primaryTextColor,
                                      fontSize: 16),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: Obx(() => Text(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      'version:' + _.state.version,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: FYcPages
                                              .commonConfig.primarySubTextColor,
                                          fontSize: 14),
                                    )),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            FYcPages.commonConfig.copyright,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color:
                                    FYcPages.commonConfig.primarySubTextColor,
                                fontSize: 12),
                          ),
                        )
                      ]))),
        );
      },
    );
  }
}
