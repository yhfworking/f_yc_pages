import 'package:f_yc_pages/src/middleware/f_yc_middleware_auth.dart';
import 'package:f_yc_pages/src/pages/about_us/index.dart';
import 'package:f_yc_pages/src/pages/cancel_account/index.dart';
import 'package:f_yc_pages/src/pages/daily_task/index.dart';
import 'package:f_yc_pages/src/pages/gold_intro/index.dart';
import 'package:f_yc_pages/src/pages/invite_friends/index.dart';
import 'package:f_yc_pages/src/pages/log_cash_out/index.dart';
import 'package:f_yc_pages/src/pages/log_wallet/index.dart';
import 'package:f_yc_pages/src/pages/login/index.dart';
import 'package:f_yc_pages/src/pages/lucky_turntable/index.dart';
import 'package:f_yc_pages/src/pages/open_treasure_chest/index.dart';
import 'package:f_yc_pages/src/pages/privacy_policy/index.dart';
import 'package:f_yc_pages/src/pages/ranking/index.dart';
import 'package:f_yc_pages/src/pages/scan_re/index.dart';
import 'package:f_yc_pages/src/pages/setting/index.dart';
import 'package:f_yc_pages/src/pages/timer_re/index.dart';
import 'package:f_yc_pages/src/pages/undefined/index.dart';
import 'package:f_yc_pages/src/pages/user_agreement/index.dart';
import 'package:f_yc_pages/src/pages/user_info/index.dart';
import 'package:f_yc_pages/src/pages/wallet/index.dart';
import 'package:f_yc_pages/src/pages/website/index.dart';
import 'package:f_yc_storages/f_yc_storages.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'f_yc_routes_names.dart';

class FYcRoutesPages {
  static final undefinedRoute = GetPage(
      name: FYcRoutesNames.undefined,
      page: () => const UndefinedPage(),
      binding: UndefinedBinding());
  static final List<GetPage> routes = [
    GetPage(
      name: FYcRoutesNames.website,
      page: () => const WebsitePage(),
      binding: WebsiteBinding(),
    ),
    GetPage(
      name: FYcRoutesNames.userAgreement,
      page: () => const UserAgreementPage(),
      binding: UserAgreementBinding(),
    ),
    GetPage(
      name: FYcRoutesNames.privacyPolicy,
      page: () => const PrivacyPolicyPage(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: FYcRoutesNames.userInfo,
      page: () => const UserInfoPage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: UserInfoBinding(),
    ),
    GetPage(
      name: FYcRoutesNames.login,
      binding: LoginBinding(),
      page: () => LoginPage(wxLoginCallback: (String code) async {
        if (code.isNotEmpty) {
          // await ApisAuth.wxLogin(code);
        }
      }, appleLoginCallback: () async {
        // await ApisAuth.appleLogin();
      }),
    ),
    GetPage(
      name: FYcRoutesNames.setting,
      page: () => SettingPage(
        logoutCallback: () async {
          // await ApisAuth.logout();
          Get.back();
        },
      ),
      binding: SettingBinding(),
    ),
    GetPage(
      name: FYcRoutesNames.cancelAccount,
      page: () => CancelAccountPage(
        nickname: FYcStorages.userInfo().nickname ?? '',
      ),
      binding: CancelAccountBinding(),
    ),
    GetPage(
      name: FYcRoutesNames.aboutUs,
      page: () => const AboutUsPage(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: FYcRoutesNames.wallet,
      page: () => const WalletPage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: WalletBinding(),
    ),
    GetPage(
      name: FYcRoutesNames.logWallet,
      page: () => const LogWalletPage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: LogWalletBinding(),
    ),
    GetPage(
      name: FYcRoutesNames.logCashOut,
      page: () => const LogCashOutPage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: LogCashOutBinding(),
    ),
    GetPage(
      name: FYcRoutesNames.luckyTurntable,
      page: () => const LuckyTurntablePage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: LuckyTurntableBinding(),
    ),
    GetPage(
      name: FYcRoutesNames.dailyTask,
      page: () => const DailyTaskPage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: DailyTaskBinding(),
    ),
    GetPage(
      name: FYcRoutesNames.ranking,
      page: () => const RankingPage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: RankingBinding(),
    ),
    GetPage(
      name: FYcRoutesNames.inviteFriends,
      page: () => const InviteFriendsPage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: InviteFriendsBinding(),
    ),
    GetPage(
      name: FYcRoutesNames.openTreasureChest,
      page: () => const OpenTreasureChestPage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: OpenTreasureChestBinding(),
    ),
    GetPage(
      name: FYcRoutesNames.scanRe,
      page: () => const ScanRePage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: ScanReBinding(),
    ),
    GetPage(
      name: FYcRoutesNames.timerRe,
      page: () => const TimerRePage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: TimerReBinding(),
    ),
    GetPage(
      name: FYcRoutesNames.goldIntroRe,
      page: () => const GoldIntroPage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: GoldIntroBinding(),
    ),
  ];
}
