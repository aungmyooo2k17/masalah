import 'package:flutter/material.dart';

class RegularText extends StatelessWidget {
  const RegularText(
      {Key? key, this.data = "", this.fontSize = 18, this.color = Colors.grey})
      : super(key: key);

  final String data;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(data,
        style: TextStyle(
          fontFamily: 'Unicode',
          fontSize: fontSize,
          color: color,
        ));
  }
}

class BoldText extends StatelessWidget {
  const BoldText(
      {Key? key, this.data = "", this.fontSize = 18, this.color = Colors.grey})
      : super(key: key);

  final String data;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(data,
        style: TextStyle(
            fontFamily: 'Unicode',
            fontSize: fontSize,
            color: color,
            fontWeight: FontWeight.w900));
  }
}
