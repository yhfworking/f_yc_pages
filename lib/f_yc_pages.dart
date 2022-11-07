library f_yc_pages;

import 'package:f_yc_config/f_yc_config.dart';

class FYcPages {
  static FYcConfigCommonConfig commonConfig = FYcConfigConfigurator.instance
      .getConfig(configId: KIT_CONFIG_ID)
      .commonConfig;
}
