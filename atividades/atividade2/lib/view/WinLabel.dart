import 'package:flutter/material.dart';

class WinLabel extends StatefulWidget {
  _WinLabelState state = _WinLabelState();

  @override
  _WinLabelState createState() {
    return state;
  }
}

class _WinLabelState extends State<WinLabel> {
  String text = '';

  void changeText(String s) {
    setState(() {
      text = s;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(1.0),
        ),
        Text(text, style: TextStyle(fontSize: 24))
      ]
      );
  }
}