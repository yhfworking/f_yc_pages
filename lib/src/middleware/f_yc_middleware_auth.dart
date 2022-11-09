import 'package:f_yc_storages/f_yc_storages.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:flutter/material.dart';

class FYcMiddlewareAuth extends GetMiddleware {
  @override
  FYcMiddlewareAuth();

  @override
  RouteSettings? redirect(String? route) {
    if (FYcStorages.checkLogin() || route == '/f_yc_login') {
      return null;
    } else {
      return const RouteSettings(name: '/f_yc_login');
    }
  }
}
