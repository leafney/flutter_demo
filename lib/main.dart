import 'package:flutter/material.dart';
import 'package:flutter_demo/count2_page.dart';
import 'package:flutter_demo/count_page.dart';
import 'package:flutter_demo/home_page.dart';
import 'package:get/route_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(),
      // home: CountHomePage(),
      home: AppHome(),
    );
  }
}
