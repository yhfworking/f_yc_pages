import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'index.dart';

class DailyTaskPage extends GetView<DailyTaskController> {
  const DailyTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DailyTaskController>(
      builder: (_) {
        return Scaffold(
            body: Container(
          color: const Color(0xFFE33D47),
          child: Stack(
            children: [
              ListView(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: Get.width,
                        height: Get.width * 2208 / 1242,
                        child: Image.network(
                          'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-5353f2f4-024c-4eb4-81ef-2022670f7bfe/5aa3fd7a-e577-4fa4-8628-b9e52060339c.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
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
          ),
        ));
      },
    );
  }
}
