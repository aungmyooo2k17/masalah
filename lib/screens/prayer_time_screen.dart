import 'dart:core';
import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/model/ui_prayer_time.dart';
import 'package:masalah/prayer_time/prayer_time_wrapper.dart';
import 'package:masalah/reusable_widget/app_bar.dart';
import 'package:masalah/reusable_widget/app_text.dart';
import 'package:masalah/screens/prayer_card_item_widget.dart';
import 'package:masalah/util/date_time_util.dart';

import 'prayer_item_widget.dart';

class PrayerTimeScreen extends StatefulWidget {
  @override
  _PrayerTimeScreenState createState() => _PrayerTimeScreenState();
}

class _PrayerTimeScreenState extends State<PrayerTimeScreen> {
  final PrayerTimePluginUtil prayerTimePluginUtil = PrayerTimePluginUtil();
  DateTime? selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate!,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        prayerTimePluginUtil.initWithOffset(
            Coordinates(16.8409, 96.1735), selectedDate!);
        // // PrayerTimes.utcOffset(coordinates, dateComponents, calculationParameters, utcOffset)
        // prayerTimes = PrayerTimes.utcOffset(
        //     myCoordinates!,
        //     DateComponents(
        //         selectedDate!.year, selectedDate!.month, selectedDate!.day),
        //     params!,
        //     Duration(hours: 6, minutes: 30));
        // print("*#*#*#*#**#*#**#*#*");
        // print(prayerTimes!.asr);
      });
  }

  @override
  void initState() {
    super.initState();
    final myCoordinates = Coordinates(
        16.8409, 96.1735); // Replace with your own location lat, lng.

    prayerTimePluginUtil.init(myCoordinates);
    // prayerTimePluginUtil.getCurrentDatePrayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppTopBar(
          title: "PRAYER TIMES",
          bgColor: AppColors.bgColor,
          textColor: AppColors.primaryText,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            StreamBuilder<UiPrayerTimeItemCard>(
                stream: prayerTimePluginUtil.getUiPrayerItemCard(),
                builder: (context, snapshot) {
                  if (snapshot.hasError ||
                      snapshot.error != null ||
                      snapshot.data == null) {
                    return CircularProgressIndicator();
                  }
                  return PrayerCardItemWidget(
                      uiPrayerTimeItemCard: snapshot.data!);
                }),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              margin:
                  EdgeInsets.only(left: 16.0, top: 8, right: 16.0, bottom: 8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDate =
                            selectedDate!.subtract(Duration(days: 1));
                      });
                      prayerTimePluginUtil.initWithOffset(
                          Coordinates(16.8409, 96.1735), selectedDate!);
                    },
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: AppColors.bgBtn,
                        borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      ),
                      child: Icon(
                        Icons.arrow_back_outlined,
                        size: 18.0,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: BoldText(
                      data:
                          DateTimeUtil().prayerTimeHumanReadable(selectedDate),
                      fontSize: 16,
                      color: AppColors.primaryText,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        print(selectedDate.toString());
                        selectedDate = selectedDate!.add(Duration(days: 1));
                      });
                      prayerTimePluginUtil.initWithOffset(
                          Coordinates(16.8409, 96.1735), selectedDate!);
                    },
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: AppColors.bgBtn,
                        borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      ),
                      child: Icon(
                        Icons.arrow_forward_outlined,
                        size: 18.0,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

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
                  StreamBuilder<List<UiPrayerTimeItem>>(
                    stream: prayerTimePluginUtil.getCurrentDatePrayers(),
                    initialData: [],
                    builder: (context, snapshot) {
                      if (snapshot.hasError ||
                          snapshot.error != null ||
                          snapshot.data == null) {
                        return CircularProgressIndicator();
                      }
                      return ListView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: snapshot.data!
                              .map((e) => PrayerItemWidget(uiPrayerItem: e))
                              .toList());
                    },
                  )
                ],
              ),
            )
          ]),
        ));
  }

  void nowPrayingTime() {
    print("Heyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
  }
}
