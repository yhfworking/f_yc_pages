import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'controller.dart';
import 'widgets/widgets.dart';

class WelfareRePage extends GetView<WelfareReController> {
  const WelfareRePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelfareReController>(
      builder: (_) {
        return Scaffold(
            appBar: AppBar(
                title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.monetization_on_outlined, size: 24),
                Text('福利红包')
              ],
            )),
            body: SafeArea(
              child: Obx(() => SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  header: const WaterDropHeader(),
                  controller: _.refreshController,
                  onRefresh: _.onRefresh,
                  onLoading: _.onLoading,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return const WidgetsWBannerAd();
                      }
                      return GestureDetector(
                          onTap: () {
                            _.handleReceiveWelfare(_.state.dataList[index - 1]);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(15),
                            height: 130,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 10,
                                  spreadRadius: 10),
                            ]),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 100,
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    decoration: const BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(6),
                                            topRight: Radius.circular(6))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.cloud_done,
                                          size: 50,
                                          color: Colors.white,
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                '恭喜发财，大吉大利',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                '领取福利',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    margin: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          _.state.dataList[index - 1]['title'],
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          DateUtil.formatDate(DateTime
                                              .fromMillisecondsSinceEpoch(
                                                  _.state.dataList[index - 1]
                                                      ['create_date'])),
                                          style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ));
                    },
                    itemCount: _.state.dataList.length + 1,
                  ))),
            ));
      },
    );
  }
}
