import 'package:flutter/material.dart';
import 'package:flutter_demo/bottom_sheet/sheet_one.dart';
import 'package:flutter_demo/bottom_sheet/sheet_two.dart';
import 'package:flutter_demo/home_page.dart';
import 'package:flutter_demo/slide_panel/panel_one.dart';
import 'package:flutter_demo/slide_panel/panel_two.dart';

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
      // home: PanelOne(),
      // home: PanelTwo(),
      // home: SheetOne(),
      home: SheetTwo(),
    );
  }
}
