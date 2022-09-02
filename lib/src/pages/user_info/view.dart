import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'index.dart';

class UserInfoPage extends GetView<UserInfoController> {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserInfoController>(
      builder: (_) {
        return Scaffold(
            appBar: AppBar(title: const Text('个人资料')),
            body: SafeArea(
                child: Container(
              color: Colors.white,
              child: Obx(() => ListView(
                    children: ListTile.divideTiles(
                        context: context,
                        color: Colors.white,
                        tiles: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            height: 100,
                            child: ListTile(
                              title: const Text(
                                "头像",
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                              trailing: SizedBox(
                                width: 66,
                                height: 66,
                                child: CircleAvatar(
                                  radius: 33,
                                  backgroundColor: Colors.white70,
                                  backgroundImage: NetworkImage(_.state.avatar),
                                ),
                              ),
                              onTap: () {},
                            ),
                          ),
                          ListTile(
                            title: const Text(
                              "昵称",
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            trailing: Text(
                              _.state.nickname,
                              style: const TextStyle(fontSize: 16),
                            ),
                            onTap: () {},
                          )
                        ]).toList(),
                  )),
            )));
      },
    );
  }
}
