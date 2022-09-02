import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class ShakeRePage extends GetView<ShakeReController> {
  const ShakeRePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const HelloWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShakeReController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("摇红包")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
