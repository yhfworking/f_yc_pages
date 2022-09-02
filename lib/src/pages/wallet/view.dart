import 'package:f_yc_config/f_yc_config.dart';
import 'package:f_yc_widgets/f_yc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import '../../routes/yc_routes_names.dart';
import 'index.dart';

class WalletPage extends GetView<WalletController> {
  const WalletPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
      builder: (_) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('我的钱包'),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.toNamed(YcRoutesNames.logWallet);
                    },
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    child: const Text(
                      '钱包明细',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ))
              ],
            ),
            body: SafeArea(
                child: Obx(() => Container(
                      width: Get.width,
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 88,
                            margin: const EdgeInsets.only(top: 50),
                            child: Image.asset(
                                'assets/icons/icon_wallet_gold.png',
                                fit: BoxFit.fill),
                          ),
                          Expanded(child: Container()),
                          Container(
                              padding: const EdgeInsets.only(top: 5),
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 4),
                                    width: 18,
                                    height: 18,
                                    child: Image.asset(
                                        'assets/icons/icon_gold.png',
                                        fit: BoxFit.fill),
                                  ),
                                  Text(
                                    '我的金币:',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: YcConfig.primaryColor(),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )),
                          Container(
                            margin: const EdgeInsets.only(bottom: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  _.state.balance.toString(),
                                  style: GoogleFonts.oswald(
                                      fontSize: 36,
                                      color: const Color(0xFFFFAA16),
                                      fontWeight: FontWeight.w500),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: Text.rich(TextSpan(
                                    text: _.state.money ?? '0.00',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: YcConfig.primaryColor(),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '元',
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color:
                                                YcConfig.primarySubTextColor(),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 46,
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.bottomSheet(WidgetsCashOutOptions(
                                    balance: _.state.balance,
                                    money: _.state.money));
                              },
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  backgroundColor: MaterialStateProperty.all(
                                      YcConfig.primaryColor())),
                              child: const Text(
                                '申请兑现',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed(YcRoutesNames.logCashOut);
                                  },
                                  child: Text(
                                    '兑现记录 >',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: YcConfig.primaryColor()),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          Text(
                            '金币余额满足1000即可申请提现',
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 12),
                          )
                        ],
                      ),
                    ))));
      },
    );
  }
}