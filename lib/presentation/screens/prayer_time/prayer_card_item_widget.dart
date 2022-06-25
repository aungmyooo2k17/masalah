import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/model/ui_prayer_time.dart';
import 'package:masalah/presentation/reusable_widget/app_text.dart';

import '../../blocs/prayertime/prayertime_cubit.dart';

class PrayerCardItemWidget extends StatelessWidget {

  PrayerCardItemWidget();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UiPrayerTimeItemCard?>(
      future: context.read<PrayertimeCubit>().loadPrayerTimes(),
      builder: (context,snapshot) {
        if(snapshot.data == null) 
        return SizedBox.shrink();
        return Container(
          margin: EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 4.6,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              image: DecorationImage(
                  image: AssetImage(snapshot.data!.currentPrayerImage),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegularText(
                  data: snapshot.data!.currentPrayerTimeItem.name,
                  fontSize: 16,
                  color: AppColors.white,
                ),
                BoldText(
                  fontSize: 26,
                  data:
                      snapshot.data!.currentPrayerTimeItem.currentPrayerTime,
                  color: AppColors.white,
                ),
                RegularText(
                  fontSize: 16,
                  data: "Next Pray: " + snapshot.data!.nextPrayerName,
                  color: AppColors.white,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BoldText(
                        fontSize: 16,
                        data: snapshot.data!.nextPrayerTime,
                        color: AppColors.white,
                      ),
                      BoldText(
                        fontSize: 16,
                        data: snapshot.data!.location,
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
    );
  }
}
