import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:flutter/material.dart';

class WelfareState {
  final _scaffold = const Scaffold().obs;
  set scaffold(value) => _scaffold.value = value;
  get scaffold => _scaffold.value;

  final _appsWidgets = [].obs;
  set appsWidgets(value) => _appsWidgets.value = value;
  get appsWidgets => _appsWidgets.value;

  final _appsWidgetsHeight = 5.0.obs;
  set appsWidgetsHeight(value) => _appsWidgetsHeight.value = value;
  get appsWidgetsHeight => _appsWidgetsHeight.value;
}
