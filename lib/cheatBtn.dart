import 'package:flutter/material.dart';

class CheatBtn extends StatelessWidget {
  final Function onPress;
  final String text;

  const CheatBtn({Key key, this.text, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(12),
      ),
      child: FlatButton(onPressed: onPress, child: Text(text)),
    );
  }
}
