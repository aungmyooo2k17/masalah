import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/presentation/reusable_widget/app_text.dart';

class PrayerCardItemHolderWidget extends StatelessWidget {
  PrayerCardItemHolderWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4.6,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0), color: Colors.grey),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegularText(
              data: "----",
              fontSize: 16,
              color: AppColors.white,
            ),
            BoldText(
              fontSize: 26,
              data: "--:--",
              color: AppColors.white,
            ),
            RegularText(
              fontSize: 16,
              data: "Next Pray: " + "----",
              color: AppColors.white,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BoldText(
                    fontSize: 16,
                    data: "--:--",
                    color: AppColors.white,
                  ),
                  BoldText(
                    fontSize: 16,
                    data: "----",
                    color: AppColors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
