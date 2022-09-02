import 'package:f_yc_compose/f_yc_compose.dart';
import 'package:f_yc_config/f_yc_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../routes/yc_routes_names.dart';
import 'controller.dart';

typedef WxLoginCallback = void Function(String code);

class LoginPage extends GetView<LoginController> {
  final WxLoginCallback? wxLoginCallback;
  final VoidCallback? appleLoginCallback;
  const LoginPage({Key? key, this.wxLoginCallback, this.appleLoginCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('登录'),
              leading: Container(),
              actions: const [CloseButton()],
            ),
            body: SafeArea(
                child: SizedBox(
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 100),
                    child: SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.network(
                          YcConfig.logoUrl(),
                          fit: BoxFit.fill,
                        )),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      (wxLoginCallback != null && !YcConfig.isInR())
                          ? Container(
                              width: Get.width - 80,
                              height: 48,
                              margin: const EdgeInsets.only(bottom: 30),
                              child: ElevatedButton(
                                onPressed: () {
                                  sendWeChatAuth(
                                          scope: "snsapi_userinfo",
                                          state: "flutter_wx_auth")
                                      .then((data) {});
                                  weChatResponseEventHandler
                                      .distinct((a, b) => a == b)
                                      .listen((res) async {
                                    if (res is WeChatAuthResponse) {
                                      if (res.code != null &&
                                          wxLoginCallback != null) {
                                        wxLoginCallback!(res.code!);
                                        Get.back();
                                      }
                                    }
                                  });
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        YcConfig.primaryColor()),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    elevation: MaterialStateProperty.all(0)),
                                child: const Text(
                                  '微信登录',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                ),
                              ),
                            )
                          : Container(),
                      (appleLoginCallback != null && YcConfig.isInR())
                          ? Container(
                              width: Get.width - 80,
                              height: 48,
                              margin:
                                  const EdgeInsets.only(top: 20, bottom: 30),
                              child: SignInWithAppleButton(
                                style: SignInWithAppleButtonStyle.whiteOutlined,
                                onPressed: () async {
                                  appleLoginCallback!();
                                  Get.back();
                                },
                              ),
                            )
                          : Container(),
                      SizedBox(
                          height: 30,
                          child: Text.rich(TextSpan(
                            text: '登录即表示您已经阅读并同意',
                            style: TextStyle(
                                fontSize: 12.0,
                                color: YcConfig.primarySubTextColor()),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(YcRoutesNames.userAgreement);
                                  },
                                text: '“用户协议”',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    color: YcConfig.primaryColor()),
                              ),
                              TextSpan(
                                text: '和',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: YcConfig.primarySubTextColor()),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(YcRoutesNames.privacyPolicy);
                                  },
                                text: '“隐私政策”',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    color: YcConfig.primaryColor()),
                              ),
                            ],
                          )))
                    ],
                  )
                ],
              ),
            )));
      },
    );
  }
}