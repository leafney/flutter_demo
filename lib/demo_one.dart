import 'package:flutter/material.dart';

class DemoOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BottomAppBar Demo One')),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        // elevation: 10, // 阴影值
        // notchMargin:
        //     10, // notchMargin：FloatingActionButton 和 BottomAppBar 缺口的间距
        shape:
            CircularNotchedRectangle(), // 将FloatingActionButton嵌入BottomAppBar中
        child: Container(
          height: 40, // 控制导航栏的高度
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: Icon(Icons.subject), onPressed: () {}),
                IconButton(icon: Icon(Icons.search), onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
