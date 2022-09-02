import 'package:f_yc_config/f_yc_config.dart';
import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';

import 'controller.dart';

class UserAgreementPage extends GetView<UserAgreementController> {
  const UserAgreementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserAgreementController>(
      builder: (_) {
        return Scaffold(
            appBar: AppBar(title: const Text('用户协议')),
            body: WebView(initialUrl: YcConfig.userAgreementUrl()));
      },
    );
  }
}
