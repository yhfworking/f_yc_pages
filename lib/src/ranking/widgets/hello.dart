import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';

import '../index.dart';

/// hello
class HelloWidget extends GetView<RankingController> {
  const HelloWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() => Text(controller.state.title)),
    );
  }
}
