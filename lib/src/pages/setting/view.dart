import 'package:f_yc_apis/f_yc_apis.dart';
import 'package:f_yc_pages/f_yc_pages.dart';
import 'package:f_yc_storages/f_yc_storages.dart';
import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({Key? key}) : super(key: key);

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
              color: FYcPages.commonConfig.primaryColor,
              fontWeight: FontWeight.w600),
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
                await FYcApisDefault.logout();
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
                  itemEvent: () {
                    Get.toNamed(FYcPagesRoutesNames.userAgreement);
                  }),
              WidgetsListItem(
                  title: '隐私政策',
                  isArrow: true,
                  itemEvent: () {
                    Get.toNamed(FYcPagesRoutesNames.privacyPolicy);
                  }),
              WidgetsListItem(
                  title: '关于我们',
                  isArrow: true,
                  itemEvent: () {
                    Get.toNamed(FYcPagesRoutesNames.aboutUs);
                  }),
              (FYcStorages.checkLogin() && FYcPages.commonConfig.isInR())
                  ? WidgetsListItem(
                      title: '注销账号',
                      isArrow: true,
                      itemEvent: () {
                        Get.toNamed(FYcPagesRoutesNames.cancelAccount);
                      })
                  : Container(),
              const WidgetsListGroove(),
              FYcStorages.checkLogin() ? _logoutWidgt() : Container()
            ],
          )),
        );
      },
    );
  }
}
