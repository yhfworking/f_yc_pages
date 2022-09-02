import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class PunchEveryDayPage extends GetView<PunchEveryDayController> {
  const PunchEveryDayPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const HelloWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PunchEveryDayController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("天天打卡")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
