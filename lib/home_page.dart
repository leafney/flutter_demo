import 'package:flutter/material.dart';
import 'package:flutter_demo/cheatBtn.dart';
import 'package:flutter_demo/routes/app_routes.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Getx Router Demo'),
      ),
      body: Column(
        children: [
          CheatBtn(text: '路由示例', onPress: () => Get.toNamed(AppRoutes.NAV)),
          SizedBox(height: 20),
          CheatBtn(text: '状态管理', onPress: () => Get.toNamed(AppRoutes.State)),
          SizedBox(height: 20),
          CheatBtn(text: '主题切换', onPress: () => Get.toNamed(AppRoutes.THEME)),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
