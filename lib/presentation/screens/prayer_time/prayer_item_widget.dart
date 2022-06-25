import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/model/ui_prayer_time.dart';
import 'package:masalah/presentation/reusable_widget/app_text.dart';

class PrayerItemWidget extends StatelessWidget {
  final UiPrayerTimeItem uiPrayerItem;
  final Function(String) onMutePressed;
  PrayerItemWidget(
      {Key? key, required this.uiPrayerItem, required this.onMutePressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.0, top: 8, right: 16.0, bottom: 8.0),
      decoration: BoxDecoration(
          color: uiPrayerItem.isCurrentPrayerTime
              ? AppColors.bgBtn
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
          IconButton(
            onPressed: () {
              onMutePressed(uiPrayerItem.name);
              
            },
            icon: Icon(
              uiPrayerItem.isMuteForCurrentPrayer
                  ? Icons.alarm_off_rounded
                  : Icons.alarm_on_rounded,
              size: 18,
              color: AppColors.linkColor,
            ),
          ),
        ],
      ),
    );
  }
}
