import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'index.dart';

class RankingPage extends GetView<RankingController> {
  const RankingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RankingController>(
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
                    Color(0xFFEE0F10),
                    Color(0xFFFA5420),
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
                        'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-5353f2f4-024c-4eb4-81ef-2022670f7bfe/ca7384e0-1a15-4413-b152-d6e4d0149d1b.jpg',
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
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
