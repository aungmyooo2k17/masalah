import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/presentation/reusable_widget/app_text.dart';

class AlQuranListItem extends StatelessWidget {
  final int no;
  final String title;
  final String subTitle;
  final String arbTitle;
  const AlQuranListItem({
    Key? key,
    required this.no,
    required this.title,
    required this.subTitle,
    required this.arbTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      AppColors.primaryText,
                      BlendMode.srcATop,
                    ),
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/aryat.png"),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: BoldText(
                    data: "$no",
                    fontSize: 12.0,
                    color: AppColors.primaryText,
                  )),
                ),
              ),
              // Image.asset(
              //   "assets/images/aryat.png",
              //   width: 38,
              //   height: 38,
              //   color: AppColors.primaryText,
              // ),
              SizedBox(
                width: 18.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoldText(
                    color: Colors.black87,
                    data: title,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  RegularText(
                    fontSize: 14,
                    color: Colors.black45,
                    data: subTitle,
                  )
                ],
              ),
            ],
          ),
          ClipRect(
            child: Container(
              width: 90,
              child: BoldText(
                color: AppColors.primaryText,
                data: arbTitle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
