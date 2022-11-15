import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';

class ZCHeader extends StatelessWidget {
  final int step;

  const ZCHeader({Key? key, required this.step}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(color: AppColors.primaryText),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Container(
            margin: EdgeInsets.only(left: 22.0),
            width: 22,
            height: 22,
            padding: EdgeInsets.all(2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: step > index ? Colors.greenAccent : Colors.white),
            child: step > index
                ? Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 16.0,
                  )
                : Text(
                    "${index + 1}",
                    style: TextStyle(
                        fontSize: 12.0,
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
      ),
    );
  }
}
