import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/prayer_time/prayer_time_wrapper.dart';
import 'package:masalah/presentation/blocs/prayertime/prayer_time_date_selector_cubit.dart';
import 'package:masalah/presentation/blocs/prayertime/prayertime_cubit.dart';
import 'package:masalah/presentation/reusable_widget/app_bar.dart';
import 'package:masalah/presentation/screens/prayer_time/prayer_card_item_widget.dart';
import 'package:masalah/presentation/screens/prayer_time/prayer_time_date_selector.dart';
import 'package:masalah/presentation/screens/prayer_time/prayer_time_table.dart';
import 'package:masalah/service/launcher_widget_service.dart';
import 'package:masalah/util/date_time_util.dart';


class PrayerTimeScreen extends StatefulWidget {
  @override
  _PrayerTimeScreenState createState() => _PrayerTimeScreenState();
}

class _PrayerTimeScreenState extends State<PrayerTimeScreen> {
  final PrayerTimePluginUtil prayerTimePluginUtil = PrayerTimePluginUtil();
  

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
      context.read<PrayertimeCubit>().initPrayerTimeWithOffset(DateTimeUtil.currentDay());
    });
  }

  Future<void> sendWidgetData() async {
    await LauncherWidgetService().sendDataToAppWidget();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrayerTimeDateSelectorCubit(),
        child: Scaffold(
            backgroundColor: AppColors.bgColor,
            appBar: AppTopBar(
              title: "PRAYER TIMES",
              bgColor: AppColors.bgColor,
              textColor: AppColors.primaryText,
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                PrayerCardItemWidget(),
                PrayerTimeDateSelector(),
                Builder(
                  builder: (ctx) {
                    return PrayerTimeTable(onMutePressed: (prayerName){
                      prayerTimePluginUtil.toogleMuteStatus(prayerName);
                      final currentSelectedDate = ctx.read<PrayerTimeDateSelectorCubit>().getCurrentState;
                      ctx.read<PrayertimeCubit>().initPrayerTimeWithOffset(currentSelectedDate);
                    });
                  }
                )
                ///TimeTable widget

             
              ]),
            )),
      
    );
  }


}
