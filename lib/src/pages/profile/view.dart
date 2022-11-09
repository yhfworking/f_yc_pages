import 'package:f_yc_compose/f_yc_compose.dart';
import 'package:f_yc_pages/f_yc_pages.dart';
import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';

class ProfilePage extends GetView<ProfileController> {
  final String itro;
  final HeaderType headerType;
  final String welfareReRoutesNames;
  final String signRoutesNames;
  final String userInfoRoutesNames;
  final String walletRoutesNames;
  final String settingRoutesNames;
  const ProfilePage(
      {Key? key,
      required this.itro,
      required this.headerType,
      required this.welfareReRoutesNames,
      required this.signRoutesNames,
      required this.userInfoRoutesNames,
      required this.walletRoutesNames,
      required this.settingRoutesNames})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('我的'),
            leading: IconButton(
                icon: Icon(Icons.monetization_on_outlined,
                    size: 28, color: FYcPages.commonConfig.primaryColor),
                onPressed: () {
                  Get.toNamed(welfareReRoutesNames);
                }),
            actions: [
              Obx(
                () => TextButton(
                  onPressed: () async {
                    Get.toNamed(signRoutesNames);
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: Text(
                    _.state.isSignToday ? '已签到' : '签到现金',
                    style: TextStyle(
                        fontSize: 15,
                        color: FYcPages.commonConfig.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Obx(() => ListView(
                  children: [
                    WidgetsProfileHeader(
                      itemType: headerType,
                      nickname: _.state.nickname,
                      itro: itro,
                      avatar: _.state.avatar,
                      userInfoEvent: () {
                        Get.toNamed(userInfoRoutesNames);
                      },
                    ),
                    const WidgetsListGroove(),
                    WidgetsProfileWallet(
                      balance: _.state.balance,
                      money: _.state.money,
                      walletEvent: () {
                        Get.toNamed(walletRoutesNames);
                      },
                      submitCashEvent: () {},
                    ),
                    const WidgetsProfileTools(
                      toolsTypes: [
                        ProfileToolsType.dailyTasks,
                        ProfileToolsType.ranking,
                        ProfileToolsType.square,
                        ProfileToolsType.introduction,
                      ],
                    ),
                    const WidgetsListGroove(),
                    WidgetsProfileBannerAd(),
                    const WidgetsListGroove(),
                    WidgetsProfileSectionItem(
                      itemType: ItemType.shareAppToWxSession,
                      sectionItemEvent: () {
                        if (FYcPages.commonConfig.isInR()) {
                          FYcComposeShare.sharesWithSystem();
                        } else {
                          FYcComposeWechat.shareAppToWxSession();
                        }
                      },
                    ),
                    WidgetsProfileSectionItem(
                      itemType: ItemType.appPraise,
                      sectionItemEvent: () {
                        FYcComposeLaunchReview.toStoreReview();
                      },
                    ),
                    WidgetsProfileSectionItem(
                      itemType: ItemType.setting,
                      sectionItemEvent: (() {
                        Get.toNamed(settingRoutesNames);
                      }),
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
}
