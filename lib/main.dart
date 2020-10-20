import 'package:flutter/material.dart';
import 'package:flutter_demo/demo_four.dart';
import 'package:flutter_demo/demo_four_2.dart';
import 'package:flutter_demo/demo_four_3.dart';
import 'package:flutter_demo/demo_one.dart';
import 'package:flutter_demo/demo_three.dart';
import 'package:flutter_demo/demo_two.dart';
import 'package:flutter_demo/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(),
      // home: DemoOne(),
      // home: DemoTwo(),
      // home: DemoThree(),
      // home: DemoFour(),
      // home: DemoFour2(),
      home: DemoFour3(),
    );
  }
}
