import 'package:f_yc_config/f_yc_config.dart';
import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'controller.dart';

class LogWalletPage extends GetView<LogWalletController> {
  const LogWalletPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogWalletController>(
      builder: (_) {
        return Obx(() => Scaffold(
            appBar: AppBar(title: const Text('钱包明细')),
            body: SafeArea(
                child: Container(
              color: Colors.white,
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      _.state.walletLogs[index]['title'],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      DateUtil.formatDate(DateTime.fromMillisecondsSinceEpoch(
                          _.state.walletLogs[index]['create_date'])),
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          (_.state.walletLogs[index]['type'] == 1
                                  ? ' + '
                                  : ' - ') +
                              _.state.walletLogs[index]['amount'].toString(),
                          style: TextStyle(
                              fontSize: 18,
                              color: YcConfig.primaryColor(),
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '余额${_.state.walletLogs[index]['balance']}',
                          style: TextStyle(
                              fontSize: 14,
                              color: YcConfig.primarySubTextColor(),
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
                itemCount: _.state.walletLogs.length,
              ),
            ))));
      },
    );
  }
}
