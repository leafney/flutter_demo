import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class SheetTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sheet Two'),
      ),
      body: SnappingSheet(
        child: Container(
          color: Colors.yellow,
        ),
        sheetBelow: SnappingSheetContent(
          child: Container(
            color: Colors.red,
          ),
          heightBehavior: SnappingSheetHeight.fit(),
        ),
        grabbing: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}
