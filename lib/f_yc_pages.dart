library f_yc_pages;

import 'package:f_yc_compose/f_yc_compose.dart';
import 'package:f_yc_config/f_yc_config.dart';
export 'package:f_yc_widgets/f_yc_widgets.dart';
export './src/middleware/f_yc_middleware_auth.dart';
export './src/pages/about_us/index.dart';
export './src/pages/cancel_account/index.dart';
export './src/pages/daily_task/index.dart';
export './src/pages/gold_intro/index.dart';
export './src/pages/invite_friends/index.dart';
export './src/pages/log_cash_out/index.dart';
export './src/pages/log_wallet/index.dart';
export './src/pages/login/index.dart';
export './src/pages/lucky_turntable/index.dart';
export './src/pages/mine/index.dart';
export './src/pages/open_treasure_chest/index.dart';
export './src/pages/privacy_policy/index.dart';
export './src/pages/profile/index.dart';
export './src/pages/punch_every_day/index.dart';
export './src/pages/ranking/index.dart';
export './src/pages/scan_re/index.dart';
export './src/pages/setting/index.dart';
export './src/pages/shake_re/index.dart';
export './src/pages/sign/index.dart';
export './src/pages/timer_re/index.dart';
export './src/pages/undefined/index.dart';
export './src/pages/user_agreement/index.dart';
export './src/pages/user_info/index.dart';
export './src/pages/wallet/index.dart';
export './src/pages/website/index.dart';
export './src/pages/welfare_re/index.dart';
export 'src/routes/f_yc_pages_routes_names.dart';
export 'src/routes/f_yc_pages_routes_pages.dart';

class FYcPages {
  static FYcConfigCommonConfig commonConfig = FYcConfigConfigurator.instance
      .getConfig(configId: KIT_CONFIG_ID)
      .commonConfig;
}
