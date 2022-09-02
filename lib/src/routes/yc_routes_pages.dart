import 'package:f_yc_config/f_yc_config.dart';
import 'package:f_yc_pages/f_yc_pages.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import '../apis/apis_auth.dart';
import '../middleware/yc_middleware_auth.dart';
import 'yc_routes_names.dart';

class YcRoutesPages {
  static final undefinedRoute = GetPage(
      name: YcRoutesNames.undefined,
      page: () => const UndefinedPage(),
      binding: UndefinedBinding());
  static final List<GetPage> routes = [
    GetPage(
      name: YcRoutesNames.website,
      page: () => const WebsitePage(),
      binding: WebsiteBinding(),
    ),
    GetPage(
      name: YcRoutesNames.userAgreement,
      page: () => const UserAgreementPage(),
      binding: UserAgreementBinding(),
    ),
    GetPage(
      name: YcRoutesNames.privacyPolicy,
      page: () => const PrivacyPolicyPage(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: YcRoutesNames.userInfo,
      page: () => const UserInfoPage(),
      middlewares: [YcMiddlewareAuth()],
      binding: UserInfoBinding(),
    ),
    GetPage(
      name: YcRoutesNames.login,
      binding: LoginBinding(),
      page: () => LoginPage(wxLoginCallback: (String code) async {
        if (code.isNotEmpty) {
          await ApisAuth.wxLogin(code);
        }
      }, appleLoginCallback: () async {
        await ApisAuth.appleLogin();
      }),
    ),
    GetPage(
      name: YcRoutesNames.setting,
      page: () => SettingPage(
        logoutCallback: () async {
          await ApisAuth.logout();
          Get.back();
        },
      ),
      binding: SettingBinding(),
    ),
    GetPage(
      name: YcRoutesNames.cancelAccount,
      page: () => CancelAccountPage(
        nickname: YcConfig.userInfo().nickname ?? '',
      ),
      binding: CancelAccountBinding(),
    ),
    GetPage(
      name: YcRoutesNames.aboutUs,
      page: () => const AboutUsPage(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: YcRoutesNames.wallet,
      page: () => const WalletPage(),
      middlewares: [YcMiddlewareAuth()],
      binding: WalletBinding(),
    ),
    GetPage(
      name: YcRoutesNames.logWallet,
      page: () => const LogWalletPage(),
      middlewares: [YcMiddlewareAuth()],
      binding: LogWalletBinding(),
    ),
    GetPage(
      name: YcRoutesNames.logCashOut,
      page: () => const LogCashOutPage(),
      middlewares: [YcMiddlewareAuth()],
      binding: LogCashOutBinding(),
    ),
    GetPage(
      name: YcRoutesNames.luckyTurntable,
      page: () => const LuckyTurntablePage(),
      middlewares: [YcMiddlewareAuth()],
      binding: LuckyTurntableBinding(),
    ),
    GetPage(
      name: YcRoutesNames.dailyTask,
      page: () => const DailyTaskPage(),
      middlewares: [YcMiddlewareAuth()],
      binding: DailyTaskBinding(),
    ),
    GetPage(
      name: YcRoutesNames.ranking,
      page: () => const RankingPage(),
      middlewares: [YcMiddlewareAuth()],
      binding: RankingBinding(),
    ),
    GetPage(
      name: YcRoutesNames.inviteFriends,
      page: () => const InviteFriendsPage(),
      middlewares: [YcMiddlewareAuth()],
      binding: InviteFriendsBinding(),
    ),
    GetPage(
      name: YcRoutesNames.openTreasureChest,
      page: () => const OpenTreasureChestPage(),
      middlewares: [YcMiddlewareAuth()],
      binding: OpenTreasureChestBinding(),
    ),
    GetPage(
      name: YcRoutesNames.scanRe,
      page: () => const ScanRePage(),
      middlewares: [YcMiddlewareAuth()],
      binding: ScanReBinding(),
    ),
    GetPage(
      name: YcRoutesNames.timerRe,
      page: () => const TimerRePage(),
      middlewares: [YcMiddlewareAuth()],
      binding: TimerReBinding(),
    ),
    GetPage(
      name: YcRoutesNames.goldIntroRe,
      page: () => const GoldIntroPage(),
      middlewares: [YcMiddlewareAuth()],
      binding: GoldIntroBinding(),
    ),
  ];
}
