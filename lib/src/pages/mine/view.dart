import 'package:f_yc_pages/f_yc_pages.dart';
import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';

class MinePage extends GetView<MineController> {
  final HeaderType headerType;
  final String itro;
  final List<Widget> sections;
  const MinePage(
      {Key? key,
      required this.itro,
      required this.headerType,
      required this.sections})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text('我的')),
          body: SafeArea(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Obx(() => WidgetsProfileHeader(
                        itemType: headerType,
                        nickname: _.state.nickname,
                        itro: itro,
                        avatar: _.state.avatar,
                        userInfoEvent: () {
                          Get.toNamed(FYcPagesRoutesNames.userInfo);
                        },
                      ));
                } else {
                  return sections[index - 1];
                }
              },
              itemCount: sections.length + 1,
            ),
          ),
        );
      },
    );
  }
}
