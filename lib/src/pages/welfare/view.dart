import 'package:f_yc_apis/f_yc_apis.dart';
import 'package:f_yc_pages/src/routes/f_yc_pages_routes_names.dart';
import 'package:f_yc_storages/f_yc_storages.dart';
import 'package:f_yc_widgets/f_yc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'index.dart';
import 'widgets/widgets.dart';

class WelfarePage extends GetView<WelfareController> {
  const WelfarePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelfareController>(
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
                    Color(0xFFFF7046),
                    Color(0xFFFF4D35),
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
                      height: Get.width * 1180 / 800,
                      child: Image.asset('assets/images/find_bg.jpg'),
                    ),
                    Positioned(
                        left: Get.width / 4.0,
                        bottom: 50,
                        child: WidgetsLotterReButton(
                          buttonAction: () async {
                            if (!FYcStorages.checkLogin()) {
                              Get.toNamed(FYcPagesRoutesNames.login);
                              return;
                            }
                            EasyLoading.show(status: '正在疯狂抢红包...');
                            Map<String, dynamic> response =
                                await FYcApisDefault.submitLotteryRe();
                            int amount = response['amount'];
                            if (amount == 0) {
                              EasyLoading.showError('很遗憾，没有抢到红包！继续加油！');
                            } else {
                              String logId = response['logId'] ?? '';
                              if (logId.isNotEmpty) {
                                EasyLoading.dismiss();
                                if (FYcStorages.isRewardAdEnableShow()) {
                                  Get.dialog(WidgetsRewardAdGuide(
                                    rewardType: 'lotteryRe',
                                    showRewardVideoAdEvent: () {},
                                  ));
                                } else {
                                  Get.dialog(
                                      WidgetsGoldReceive(
                                        amount: amount,
                                        moreGoodsEvent: () {},
                                      ),
                                      barrierDismissible: false);
                                }
                              }
                            }
                          },
                        ))
                  ],
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const WidgetsListGroove(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              height: 8,
                            ),
                            // Container(
                            //   width: Get.width - 10,
                            //   padding: EdgeInsets.all(5),
                            //   height: Get.width / 2.0 + 5,
                            //   child: GridView(
                            //     physics: const NeverScrollableScrollPhysics(),
                            //     gridDelegate:
                            //         SliverGridDelegateWithFixedCrossAxisCount(
                            //             crossAxisCount: 2,
                            //             crossAxisSpacing: 4,
                            //             childAspectRatio: 2.0,
                            //             mainAxisSpacing: 4),
                            //     children: [
                            //       ClipRRect(
                            //         borderRadius:
                            //             BorderRadius.all(Radius.circular(6)),
                            //         child: GestureDetector(
                            //           onTap: () {
                            //             Get.toNamed(ComponentsRoutesNames
                            //                 .luckyTurntable);
                            //           },
                            //           child: SizedBox(
                            //             width: Get.width / 2.0,
                            //             height: 50,
                            //             child: Image.asset(
                            //               'assets/images/find_tools_lucky_turntable.jpg',
                            //               fit: BoxFit.cover,
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //       ClipRRect(
                            //           borderRadius:
                            //               BorderRadius.all(Radius.circular(6)),
                            //           child: GestureDetector(
                            //             onTap: () {
                            //               Get.toNamed(ComponentsRoutesNames
                            //                   .openTreasureChest);
                            //             },
                            //             child: SizedBox(
                            //               width: Get.width / 2.0,
                            //               height: 50,
                            //               child: Image.asset(
                            //                 'assets/images/find_tools_treasure_chest.jpg',
                            //                 fit: BoxFit.cover,
                            //               ),
                            //             ),
                            //           )),
                            //       ClipRRect(
                            //         borderRadius:
                            //             BorderRadius.all(Radius.circular(6)),
                            //         child: GestureDetector(
                            //           onTap: () {
                            //             Get.toNamed(
                            //                 ComponentsRoutesNames.scanRe);
                            //           },
                            //           child: SizedBox(
                            //             width: Get.width / 2.0,
                            //             height: 50,
                            //             child: Image.asset(
                            //               'assets/images/find_tools_scan_re.jpg',
                            //               fit: BoxFit.cover,
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //       ClipRRect(
                            //           borderRadius:
                            //               BorderRadius.all(Radius.circular(6)),
                            //           child: GestureDetector(
                            //             onTap: () {
                            //               Get.toNamed(
                            //                   ComponentsRoutesNames.timerRe);
                            //             },
                            //             child: SizedBox(
                            //               width: Get.width / 2.0,
                            //               height: 50,
                            //               child: Image.asset(
                            //                 'assets/images/find_tools_timer_re.jpg',
                            //                 fit: BoxFit.cover,
                            //               ),
                            //             ),
                            //           )),
                            //     ],
                            //   ),
                            // ),
                            Obx(() => Container(
                                  color: Colors.white,
                                  margin: const EdgeInsets.only(top: 5),
                                  padding: const EdgeInsets.only(bottom: 5),
                                  width: Get.width - 20,
                                  height: _.state.appsWidgetsHeight,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: _.state.appsWidgets,
                                  ),
                                ))
                          ],
                        ),
                      )),
                )
              ],
            ),
          ],
        ));
      },
    );
  }
}
