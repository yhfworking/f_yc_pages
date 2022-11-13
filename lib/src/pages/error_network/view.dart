import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'index.dart';

class ErrorNetworkPage extends GetView<ErrorNetworkController> {
  const ErrorNetworkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ErrorNetworkController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("网络连接错误")),
          body: SafeArea(
            child: BrnAbnormalStateWidget(
              img: Image.asset(
                'assets/image/default/default_error_network.png',
                scale: 3.0,
              ),
              isCenterVertical: true,
              title: BrnStrings.networkConnectError,
              enablePageTap: true,
              operateTexts: const <String>[BrnStrings.clickPageRetry],
              operateAreaType: OperateAreaType.textButton,
              action: (index) {
                BrnToast.show(BrnStrings.getDateFailed, context);
              },
            ),
          ),
        );
      },
    );
  }
}
