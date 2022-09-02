import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'index.dart';

class ScanRePage extends GetView<ScanReController> {
  const ScanRePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScanReController>(
      builder: (_) {
        return Scaffold(
            body: Container(
          color: Color(0xFFE33D47),
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
                          'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-5353f2f4-024c-4eb4-81ef-2022670f7bfe/7adc8fc7-d881-4500-a8e3-4c705fe31180.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Positioned(
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
