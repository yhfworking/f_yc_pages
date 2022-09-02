import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class UndefinedPage extends GetView<UndefinedController> {
  const UndefinedPage({Key? key}) : super(key: key);

  // 内容页
  Widget _buildView() {
    return const HelloWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UndefinedController>(
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
