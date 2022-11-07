import 'package:f_yc_pages/f_yc_pages.dart';
import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'index.dart';

class CancelAccountPage extends GetView<CancelAccountController> {
  final String nickname;
  const CancelAccountPage({Key? key, required this.nickname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CancelAccountController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("注销账号")),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15, top: 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.warning_amber_outlined,
                        size: 60,
                        color: Colors.red,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Text(
                          '注销账号：$nickname',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                          '账号注销后将无法使用，请谨慎操作！',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                Container(
                    width: Get.width * 4.0 / 5.0,
                    height: 50,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            FYcPages.commonConfig.primaryColor),
                        shape: MaterialStateProperty.all(const StadiumBorder()),
                        elevation: MaterialStateProperty.all(0),
                      ),
                      onPressed: () {
                        Get.defaultDialog(
                          radius: 10,
                          title: '温馨提示！',
                          middleText: '是否确认注销账号？',
                          confirm: MaterialButton(
                            minWidth: 120,
                            elevation: 0,
                            onPressed: () async {
                              Get.back();
                              // await ApisAuth.logout();
                              Get.back();
                              Get.back();
                            },
                            color: FYcPages.commonConfig.primaryColor,
                            child: const Text(
                              "确定",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          cancel: MaterialButton(
                              minWidth: 120,
                              elevation: 0,
                              onPressed: Get.back,
                              color: Colors.black12,
                              child: const Text("取消")),
                        );
                      },
                      child: const Text(
                        '已清楚风险，去注销',
                        style: TextStyle(fontSize: 16),
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
