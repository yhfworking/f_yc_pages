import 'package:f_yc_storages/f_yc_storages.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:flutter/material.dart';

import '../routes/f_yc_pages_routes_names.dart';

class FYcMiddlewareAuth extends GetMiddleware {
  @override
  FYcMiddlewareAuth();

  @override
  RouteSettings? redirect(String? route) {
    if (FYcStorages.checkLogin() || route == FYcPagesRoutesNames.login) {
      return null;
    } else {
      return const RouteSettings(name: FYcPagesRoutesNames.login);
    }
  }
}
