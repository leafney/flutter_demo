import 'package:flutter/material.dart';

class DemoFour3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BottomAppBar Demo Four 3')),
      body: Container(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(Icons.add),
        label: Text('添加'),
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: AutomaticNotchedShape(
          RoundedRectangleBorder(),
          BeveledRectangleBorder(borderRadius: BorderRadius.circular(100)),
        ),
        notchMargin: 6,
        color: Colors.blue,
        child: Container(
          height: 60,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(icon: Icon(Icons.home), onPressed: () {}),
                IconButton(icon: Icon(Icons.search), onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
