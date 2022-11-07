import 'package:f_yc_pages/f_yc_pages.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';

class LogCashOutPage extends GetView<LogCashOutController> {
  const LogCashOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogCashOutController>(
      builder: (_) {
        return Obx(() => Scaffold(
              appBar: AppBar(title: const Text('兑现记录')),
              body: SafeArea(
                  child: Container(
                color: Colors.white,
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        _.state.cashOutLogs[index]['channel'] == 2
                            ? '支付宝'
                            : '微信零钱',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        DateUtil.formatDate(DateTime.fromMillisecondsSinceEpoch(
                            _.state.cashOutLogs[index]['create_date'])),
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.normal),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '￥${NumUtil.getNumByValueDouble(_.state.cashOutLogs[index]['money'] / 100.0, 2)!.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 18,
                                color: FYcPages.commonConfig.primaryColor,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            _.state.cashOutLogs[index]['status'] == 1
                                ? '兑现成功'
                                : (_.state.cashOutLogs[index]['status'] == 2
                                    ? '待审核'
                                    : (_.state.cashOutLogs[index]['status'] == 4
                                        ? '打款中'
                                        : '审核不通过')),
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                  itemCount: _.state.cashOutLogs.length,
                ),
              )),
            ));
      },
    );
  }
}
