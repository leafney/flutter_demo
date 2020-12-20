import 'package:flutter/material.dart';
import 'package:flutter_demo/home_page.dart';
import 'package:flutter_demo/pages/navs/unknow_page.dart';
import 'package:flutter_demo/routes/app_pages.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      getPages: AppPages.pages, // 页面
      unknownRoute: GetPage(name: '/unknow', page: () => UnknowPage()), // 404页面
      // defaultTransition: Transition.upToDown, // 默认页面切换方式
      // themeMode: ThemeMode.system,
    );
  }
}
