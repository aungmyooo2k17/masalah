import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/model/ui_prayer_time.dart';
import 'package:masalah/reusable_widget/app_text.dart';

class PrayerCardItemWidget extends StatelessWidget {
  final UiPrayerTimeItemCard uiPrayerTimeItemCard;

  PrayerCardItemWidget({required this.uiPrayerTimeItemCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4.6,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          image: DecorationImage(
              image: AssetImage(uiPrayerTimeItemCard.currentPrayerImage),
              fit: BoxFit.cover)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegularText(
              data: uiPrayerTimeItemCard.currentPrayerTimeItem.name,
              fontSize: 16,
              color: AppColors.white,
            ),
            BoldText(
              fontSize: 26,
              data:
                  uiPrayerTimeItemCard.currentPrayerTimeItem.currentPrayerTime,
              color: AppColors.white,
            ),
            RegularText(
              fontSize: 16,
              data: "Next Pray: " + uiPrayerTimeItemCard.nextPrayerName,
              color: AppColors.white,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BoldText(
                    fontSize: 16,
                    data: uiPrayerTimeItemCard.nextPrayerTime,
                    color: AppColors.white,
                  ),
                  BoldText(
                    fontSize: 16,
                    data: uiPrayerTimeItemCard.location,
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
