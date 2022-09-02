import 'package:f_yc_config/f_yc_config.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:flutter/material.dart';
import '../routes/yc_routes_names.dart';

class YcMiddlewareAuth extends GetMiddleware {
  @override
  YcMiddlewareAuth();

  @override
  RouteSettings? redirect(String? route) {
    if (YcConfig.isLogin() || route == YcRoutesNames.login) {
      return null;
    } else {
      return const RouteSettings(name: YcRoutesNames.login);
    }
  }
}
