import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppCounter extends GetxController {
  var counttt = 0.obs;
  void add() => counttt++;
  void subtract() => counttt.value--;
}

class AppHome extends StatelessWidget {
  final AppCounter appC = Get.put(AppCounter());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('The counter value is:', style: TextStyle(fontSize: 15)),
            Obx(() =>
                Text('${appC.counttt.value}', style: TextStyle(fontSize: 30))),
            SizedBox(height: 16),
            RaisedButton(
              onPressed: () {
                Get.to(AppSecondPage());
              },
              child: Text('Go to Second page'),
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            child: Icon(Icons.add),
            onPressed: appC.add,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: null,
            child: Icon(Icons.remove),
            onPressed: appC.subtract,
          ),
        ],
      ),
    );
  }
}

class AppSecondPage extends StatelessWidget {
  final AppCounter cccc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'The value in app controller is:',
              style: TextStyle(fontSize: 23),
            ),
            Obx(() => Text(
                  '${cccc.counttt.value}',
                  style: TextStyle(fontSize: 40),
                )),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: null,
            child: Icon(Icons.add),
            onPressed: cccc.add,
          ),
          SizedBox(
            height: 10.0,
          ),
          FloatingActionButton(
            heroTag: null,
            child: Icon(Icons.remove),
            onPressed: cccc.subtract,
          ),
        ],
      ),
    );
  }
}
