import 'package:flutter/material.dart';
import 'widget_with_code.dart';

class Column4 extends WidgetWithCode {
  @override
  Widget getWidget() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("1"),
        Text("2"),
        Text("3"),
      ],
    );
  }

  @override
  String getCode() {
    return """const Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("1"),
        Text("2"),
        Text("3"),
      ],
    )
""";
  }
}
