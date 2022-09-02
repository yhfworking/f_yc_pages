import 'dart:io';
import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'index.dart';

class WebsitePage extends GetView<WebsiteController> {
  const WebsitePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    return GetBuilder<WebsiteController>(
      builder: (_) {
        return Obx(() => Scaffold(
            appBar: AppBar(title: Text(_.state.title)),
            body: _.state.url == ''
                ? Container()
                : WebView(initialUrl: _.state.url)));
      },
    );
  }
}
