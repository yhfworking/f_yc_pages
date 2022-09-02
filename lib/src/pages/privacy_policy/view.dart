import 'package:f_yc_config/f_yc_config.dart';
import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';

import 'controller.dart';

class PrivacyPolicyPage extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrivacyPolicyController>(
      builder: (_) {
        return Scaffold(
            appBar: AppBar(title: const Text('隐私政策')),
            body: WebView(initialUrl: YcConfig.privacyPolicyUrl()));
      },
    );
  }
}
