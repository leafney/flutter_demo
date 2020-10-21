import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/bottom_sheet/sheet_one_page2.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SheetOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: CupertinoPageScaffold(
        backgroundColor: Colors.white,
        navigationBar: CupertinoNavigationBar(
          transitionBetweenRoutes: false,
          trailing: GestureDetector(),
        ),
        child: Center(
          child: RaisedButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     CupertinoPageRoute(
                //       builder: (context) => SheetOnePage2(),
                //       fullscreenDialog: true,
                //     ));

                // Navigator.of(context).push(CupertinoPageRoute(
                //     fullscreenDialog: true,
                //     builder: (context) => SheetOnePage2()));

                showSheet(context);
              },
              child: Text('跳转')),
        ),
      ),
    );
  }

  void showSheet(BuildContext context) {
    showCupertinoModalBottomSheet(
      expand: true,
      context: context,
      // isDismissible: false,
      // enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context, controller) => SheetOnePage2(),
    );
  }
}
