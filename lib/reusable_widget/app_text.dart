import 'package:flutter/material.dart';

class RegularText extends StatelessWidget {
  const RegularText(
      {Key? key,
      this.data = "",
      this.fontSize = 18,
      this.color = Colors.grey,
      this.maxLine = 1000,
      this.textAlign = TextAlign.start})
      : super(key: key);

  final String data;
  final double fontSize;
  final Color color;
  final int maxLine;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: 'Unicode',
        fontSize: fontSize,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}

class BoldText extends StatelessWidget {
  const BoldText(
      {Key? key,
      this.data = "",
      this.fontSize = 18,
      this.color = Colors.grey,
      this.maxLine = 1000})
      : super(key: key);

  final String data;
  final double fontSize;
  final Color color;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return Text(data,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontFamily: 'Unicode',
            fontSize: fontSize,
            color: color,
            fontWeight: FontWeight.w900));
  }
}
