import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'index.dart';
import 'widgets/widgets.dart';

class OpenTreasureChestPage extends GetView<OpenTreasureChestController> {
  const OpenTreasureChestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OpenTreasureChestController>(
      builder: (_) {
        return Scaffold(
            body: Stack(
          children: [
            Container(
              width: Get.width,
              height: (Get.width * 1180 / 800 * 2.0) / 3.0,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xFFFE2216),
                    Color(0xFFFE2216),
                  ],
                ),
              ),
            ),
            ListView(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: Get.width,
                      height: Get.width * 2208 / 1242,
                      child: Image.network(
                        'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-5353f2f4-024c-4eb4-81ef-2022670f7bfe/59e0db5b-2c51-4baf-9abd-2bcaa7f44ddb.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                        left: Get.width / 4.0,
                        bottom: 100,
                        child: WidgetsTreasureChestKeyButton(
                          buttonAction: () {
                            LoggerUtils.write('----立即抢红包--');
                          },
                        ))
                  ],
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, -1.0, 0.0),
                  width: Get.width,
                  height: 500,
                  color: const Color(0xFFE71440),
                )
              ],
            ),
            const Positioned(
                left: 5,
                top: 22,
                child: BackButton(
                  color: Colors.white,
                )),
          ],
        ));
      },
    );
  }
}
