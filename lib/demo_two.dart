import 'package:flutter/material.dart';

class DemoTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BottomAppBar Demo Two')),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: Icon(Icons.camera_alt, size: 20),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(70),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ColoredBox(
        color: Colors.transparent,
        child: BottomAppBar(
          color: Colors.lightBlue,
          shape: AutomaticNotchedShape(
            RoundedRectangleBorder(),
            BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(70)),
            ),
          ),
          child: Container(
            height: 60,
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
      ),
    );
  }
}
