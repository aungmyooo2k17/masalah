import 'dart:core';
import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/model/ui_prayer_time.dart';
import 'package:masalah/prayer_time/prayer_time_wrapper.dart';
import 'package:masalah/presentation/blocs/prayertime/cubit/prayer_time_date_selector_cubit.dart';
import 'package:masalah/presentation/blocs/prayertime/prayertime_cubit.dart';
import 'package:masalah/presentation/reusable_widget/app_bar.dart';
import 'package:masalah/presentation/reusable_widget/app_text.dart';
import 'package:masalah/presentation/screens/prayer_time/prayer_card_item_widget.dart';
import 'package:masalah/presentation/screens/prayer_time/prayer_time_date_selector.dart';
import 'package:masalah/service/launcher_widget_service.dart';
import 'package:masalah/util/date_time_util.dart';

import 'prayer_item_widget.dart';

class PrayerTimeScreen extends StatefulWidget {
  @override
  _PrayerTimeScreenState createState() => _PrayerTimeScreenState();
}

class _PrayerTimeScreenState extends State<PrayerTimeScreen> {
  final PrayerTimePluginUtil prayerTimePluginUtil = PrayerTimePluginUtil();
  //DateTime? selectedDate = DateTime.now();
  UiPrayerTimeItemCard? prayerTimeItemCard;

  Future<void> _selectDate(BuildContext context) async {
    // final DateTime? picked = await showDatePicker(
    //     context: context,
    //     initialDate: selectedDate!,
    //     firstDate: DateTime(2015, 8),
    //     lastDate: DateTime(2101));
    // if (picked != null && picked != selectedDate)
    //   setState(() {
    //     selectedDate = picked;
    //   });
    // context.read<PrayertimeCubit>().initPrayerTimeWithOffset(selectedDate!);
  }

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((_){
    //   context.read<PrayertimeCubit>().loadPrayerTimes();
    // });

    // loadPrayerTimes();
    // sendWidgetData();
  }

  Future<void> sendWidgetData() async {
    await LauncherWidgetService().sendDataToAppWidget();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrayerTimeDateSelectorCubit(
        context.read<PrayertimeCubit>()
      ),
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
                ///TimeTable widget

                Container(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  margin:
                      EdgeInsets.only(left: 16.0, top: 8, right: 16.0, bottom: 8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, top: 8, right: 16.0, bottom: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: RegularText(
                                textAlign: TextAlign.left,
                                color: AppColors.primaryText,
                                fontSize: 14.0,
                                data: "Prayer",
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: RegularText(
                                color: AppColors.primaryText,
                                fontSize: 14.0,
                                data: "Adhan",
                              ),
                            ),
                          ],
                        ),
                      ),
                      FutureBuilder<List<UiPrayerTimeItem>>(
                        future: prayerTimePluginUtil.getCurrentDatePrayers(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError ||
                              snapshot.error != null ||
                              snapshot.data == null) {
                            return CircularProgressIndicator();
                          }
                          return ListView(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: snapshot.data!.map((e) {
                                return PrayerItemWidget(
                                  key: UniqueKey(),
                                  uiPrayerItem: e,
                                  onMutePressed: (prayerName) {
                                    prayerTimePluginUtil
                                        .toogleMuteStatus(prayerName);

                                    setState(() {});
                                  },
                                );
                              }).toList());
                        },
                      )
                    ],
                  ),
                )
              ]),
            )),
      
    );
  }


}
