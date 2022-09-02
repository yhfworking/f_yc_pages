import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'index.dart';

class InviteFriendsPage extends GetView<InviteFriendsController> {
  const InviteFriendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InviteFriendsController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("invite_friends")),
          body: SafeArea(
            child: Container(),
          ),
        );
      },
    );
  }
}
