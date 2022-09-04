import 'package:f_yc_config/f_yc_config.dart';
import 'package:f_yc_widgets/f_yc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import '../../routes/index.dart';
import 'index.dart';

class ProfilePage extends GetView<ProfileController> {
  final String itro;
  final HeaderType headerType;
  const ProfilePage({
    Key? key,
    required this.itro,
    required this.headerType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('我的'),
            leading: IconButton(
                icon: Icon(Icons.monetization_on_outlined,
                    size: 28, color: YcConfig.primaryColor()),
                onPressed: () {
                  Get.toNamed(YcRoutesNames.welfareRe);
                }),
            actions: [
              Obx(
                () => TextButton(
                  onPressed: () async {
                    Get.toNamed(YcRoutesNames.sign);
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: Text(
                    _.state.isSignToday ? '已签到' : '签到现金',
                    style: TextStyle(
                        fontSize: 15,
                        color: YcConfig.primaryColor(),
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
                    ),
                    const WidgetsListGroove(),
                    WidgetsProfileWallet(
                      balance: _.state.balance,
                      money: _.state.money,
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
                    const WidgetsProfileSectionItem(
                      itemType: ItemType.shareAppToWxSession,
                    ),
                    const WidgetsProfileSectionItem(
                      itemType: ItemType.appPraise,
                    ),
                    const WidgetsProfileSectionItem(
                      itemType: ItemType.setting,
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
}
