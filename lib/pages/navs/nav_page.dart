import 'package:flutter/material.dart';
import 'package:flutter_demo/cheatBtn.dart';
import 'package:flutter_demo/pages/navs/other_page.dart';
import 'package:flutter_demo/routes/app_routes.dart';
import 'package:get/get.dart';

class NavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CheatBtn(
                text: '直接路由',
                onPress: () => Get.to(
                      OtherPage(),
                      // transition: Transition.zoom,
                      arguments: '直接路由',
                    )),
            CheatBtn(
                text: '简单命名路由', onPress: () => Get.toNamed(AppRoutes.USER)),
            CheatBtn(
                text: 'arguments命名路由',
                onPress: () async {
                  var result =
                      await Get.toNamed(AppRoutes.OTHER, arguments: 'nihao');
                  print('带参数命名路由返回:$result');
                }),
            CheatBtn(
                text: '提示框',
                onPress: () => Get.snackbar(
                      'Hi',
                      '这是一条消息',
                      snackPosition: SnackPosition.BOTTOM,
                    )),
          ],
        ),
      ),
    );
  }
}
