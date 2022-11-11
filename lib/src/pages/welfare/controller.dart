import 'dart:async';
import 'package:f_yc_entity/f_yc_entity.dart';
import 'package:f_yc_storages/f_yc_storages.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'index.dart';

class WelfareController extends GetxController {
  WelfareController();

  final state = WelfareState();
  late StreamSubscription _remoteConfigUpdateStreamSubscription;

  List<Widget> toAppsWidget(List apps) {
    List<Widget> widgets = [];
    if (apps.isNotEmpty) {
      state.appsWidgetsHeight = ((Get.width - 20) / 3.0 + 15) * apps.length;
      for (var element in apps) {
        String image = element['image'] ?? '';
        String url = element['url'] ?? '';
        if (image.isNotEmpty && url.isNotEmpty) {
          widgets.add(GestureDetector(
            onTap: () {
              launchUrl(Uri.parse(url));
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              child: SizedBox(
                width: (Get.width - 20),
                height: (Get.width - 20) / 3.0,
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ));
        }
      }
    } else {
      state.appsWidgetsHeight = 5.0;
    }
    return widgets;
  }

  void updateStates() {
    FYcEntitysRemoteConfig entitysRemoteConfig = FYcStorages.remoteConfig();
    state.appsWidgets = toAppsWidget(entitysRemoteConfig.apps ?? []);
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() async {
    updateStates();
    _remoteConfigUpdateStreamSubscription = FYcEventBus.instance
        .on<FYcEntitysEventsRemoteConfigUpdate>()
        .listen((FYcEntitysEventsRemoteConfigUpdate event) {
      updateStates();
    });
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    _remoteConfigUpdateStreamSubscription.cancel();
    super.dispose();
  }
}
