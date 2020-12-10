import 'package:flutter/material.dart';
import 'package:flutter_demo/counter/counter.dart';
import 'package:get/get.dart';

class CountHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CountController c = Get.put(CountController());
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('Clicks:${c.count.value}')),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => Get.to(Other()),
          child: Text('Go to Other'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: c.increment,
      ),
    );
  }
}

class Other extends StatelessWidget {
  final CountController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('${c.count}'),
      ),
    );
  }
}
