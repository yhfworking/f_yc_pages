import 'package:f_yc_config/f_yc_config.dart';
import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';

import 'controller.dart';

class SettingPage extends GetView<SettingController> {
  final VoidCallback logoutCallback;
  const SettingPage({Key? key, required this.logoutCallback}) : super(key: key);

  Widget _cancellationWidgt() {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xffe5e5e5))),
          color: Colors.white),
      child: ListTile(
        title: const Text(
          "注销账号",
          textAlign: TextAlign.center,
          style:
              TextStyle(color: Color(0xFFFF5252), fontWeight: FontWeight.w600),
        ),
        onTap: () {},
      ),
    );
  }

  Widget _logoutWidgt() {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xffe5e5e5))),
          color: Colors.white),
      child: ListTile(
        title: Text(
          "退出登录",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: YcConfig.primaryColor(), fontWeight: FontWeight.w600),
        ),
        onTap: () {
          Get.defaultDialog(
            radius: 10,
            title: '温馨提示！',
            middleText: '是否确认退出登录？',
            confirm: MaterialButton(
              minWidth: 120,
              elevation: 0,
              onPressed: () async {
                Get.back();
                logoutCallback();
              },
              color: YcConfig.primaryColor(),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text('更多设置')),
          body: SafeArea(
              child: ListView(
            children: [
              WidgetsListItem(
                  title: '用户协议',
                  isArrow: true,
                  onTap: () {
                    Get.toNamed(YcRoutesNames.userAgreement);
                  }),
              WidgetsListItem(
                  title: '隐私政策',
                  isArrow: true,
                  onTap: () {
                    Get.toNamed(YcRoutesNames.privacyPolicy);
                  }),
              WidgetsListItem(
                  title: '关于我们',
                  isArrow: true,
                  onTap: () {
                    Get.toNamed(YcRoutesNames.aboutUs);
                  }),
              (YcConfig.isLogin() && YcConfig.isInR())
                  ? WidgetsListItem(
                      title: '注销账号',
                      isArrow: true,
                      onTap: () {
                        Get.toNamed(YcRoutesNames.cancelAccount);
                      })
                  : Container(),
              const WidgetsListGroove(),
              YcConfig.isLogin() ? _logoutWidgt() : Container()
            ],
          )),
        );
      },
    );
  }
}
