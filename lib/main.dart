import 'package:flutter/material.dart';
import 'package:flutter_demo/home_page.dart';
import 'package:flutter_demo/utils/sp_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SpUtils.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
