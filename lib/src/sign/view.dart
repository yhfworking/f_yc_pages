import 'package:flutter/material.dart';
import 'package:flutter_wekan/components/plugin/index.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:flutter_wekan/components/pages/index.dart';

class SignPage extends GetView<SignController> {
  const SignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("签到有礼")),
          body: Obx(() => SafeArea(
                  child: Container(
                width: Get.width,
                color: Colors.white,
                child: ListView(
                  children: [
                    PluginSign(
                      signType: SignType.cashSign,
                      continuitySignTimes: _.state.continuitySignTimes ?? 0,
                      isSignToday: _.state.isSignToday ?? false,
                      isContinuity3RewardEnable:
                          _.state.isContinuity3RewardEnable ?? false,
                      isContinuity7RewardEnable:
                          _.state.isContinuity7RewardEnable ?? false,
                      isContinuity30RewardEnable:
                          _.state.isContinuity30RewardEnable ?? false,
                      isContinuity365RewardEnable:
                          _.state.isContinuity365RewardEnable ?? false,
                      signAction: () {
                        _.handelSignAction();
                      },
                      continuityDaysSignAction: (int days) {
                        _.handelContinuityDaysSignAction(days);
                      },
                    )
                  ],
                ),
              ))),
        );
      },
    );
  }
}
