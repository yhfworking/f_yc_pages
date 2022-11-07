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
import 'f_yc_pages_routes_names.dart';

class FYcPagesRoutesPages {
  static final undefinedRoute = GetPage(
      name: FYcPagesRoutesNames.undefined,
      page: () => const UndefinedPage(),
      binding: UndefinedBinding());
  static final List<GetPage> routes = [
    GetPage(
      name: FYcPagesRoutesNames.website,
      page: () => const WebsitePage(),
      binding: WebsiteBinding(),
    ),
    GetPage(
      name: FYcPagesRoutesNames.userAgreement,
      page: () => const UserAgreementPage(),
      binding: UserAgreementBinding(),
    ),
    GetPage(
      name: FYcPagesRoutesNames.privacyPolicy,
      page: () => const PrivacyPolicyPage(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: FYcPagesRoutesNames.userInfo,
      page: () => const UserInfoPage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: UserInfoBinding(),
    ),
    GetPage(
      name: FYcPagesRoutesNames.login,
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
      name: FYcPagesRoutesNames.setting,
      page: () => SettingPage(
        logoutCallback: () async {
          // await ApisAuth.logout();
          Get.back();
        },
      ),
      binding: SettingBinding(),
    ),
    GetPage(
      name: FYcPagesRoutesNames.cancelAccount,
      page: () => CancelAccountPage(
        nickname: FYcStorages.userInfo().nickname ?? '',
      ),
      binding: CancelAccountBinding(),
    ),
    GetPage(
      name: FYcPagesRoutesNames.aboutUs,
      page: () => const AboutUsPage(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: FYcPagesRoutesNames.wallet,
      page: () => const WalletPage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: WalletBinding(),
    ),
    GetPage(
      name: FYcPagesRoutesNames.logWallet,
      page: () => const LogWalletPage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: LogWalletBinding(),
    ),
    GetPage(
      name: FYcPagesRoutesNames.logCashOut,
      page: () => const LogCashOutPage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: LogCashOutBinding(),
    ),
    GetPage(
      name: FYcPagesRoutesNames.luckyTurntable,
      page: () => const LuckyTurntablePage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: LuckyTurntableBinding(),
    ),
    GetPage(
      name: FYcPagesRoutesNames.dailyTask,
      page: () => const DailyTaskPage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: DailyTaskBinding(),
    ),
    GetPage(
      name: FYcPagesRoutesNames.ranking,
      page: () => const RankingPage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: RankingBinding(),
    ),
    GetPage(
      name: FYcPagesRoutesNames.inviteFriends,
      page: () => const InviteFriendsPage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: InviteFriendsBinding(),
    ),
    GetPage(
      name: FYcPagesRoutesNames.openTreasureChest,
      page: () => const OpenTreasureChestPage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: OpenTreasureChestBinding(),
    ),
    GetPage(
      name: FYcPagesRoutesNames.scanRe,
      page: () => const ScanRePage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: ScanReBinding(),
    ),
    GetPage(
      name: FYcPagesRoutesNames.timerRe,
      page: () => const TimerRePage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: TimerReBinding(),
    ),
    GetPage(
      name: FYcPagesRoutesNames.goldIntroRe,
      page: () => const GoldIntroPage(),
      middlewares: [FYcMiddlewareAuth()],
      binding: GoldIntroBinding(),
    ),
  ];
}
