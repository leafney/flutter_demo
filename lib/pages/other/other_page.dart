import 'package:flutter/material.dart';
import 'package:flutter_demo/cheatBtn.dart';
import 'package:get/get.dart';

class OtherPage extends StatelessWidget {
  // 获取参数
  final String argParams = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Page'),
      ),
      body: Center(
        child: CheatBtn(
            text: '这是得到的参数：${argParams}',
            onPress: () => Get.back(result: 'ok ok')),
      ),
    );
  }
}
