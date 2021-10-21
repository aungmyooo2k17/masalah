import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/model/ui_prayer_time.dart';
import 'package:masalah/reusable_widget/app_text.dart';

class PrayerItemWidget extends StatelessWidget {
  final UiPrayerTimeItem uiPrayerItem;
  PrayerItemWidget({required this.uiPrayerItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.0, top: 8, right: 16.0, bottom: 8.0),
      decoration: BoxDecoration(
          color: uiPrayerItem.isCurrentPrayerTime
              ? AppColors.linkColor
              : Colors.white),
      child: Row(
        children: [
          Expanded(
            child: BoldText(
              color: AppColors.primaryText,
              fontSize: 18.0,
              data: uiPrayerItem.name,
            ),
          ),
          Expanded(
            child: BoldText(
                color: AppColors.primaryText,
                fontSize: 18.0,
                data: uiPrayerItem.currentPrayerTime),
          ),
          ElevatedButton.icon(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColors.unSelectedIconColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ))),
            onPressed: () async {
              print("hello");
            },
            icon: Icon(
              Icons.ac_unit_outlined,
              size: 12,
              color: AppColors.white,
            ),
            label: BoldText(
              data: "MUTE",
              fontSize: 12,
              color: AppColors.white,
            ),
          )
        ],
      ),
    );
  }
}
