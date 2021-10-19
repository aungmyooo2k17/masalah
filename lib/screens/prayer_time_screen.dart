import 'dart:core';
import 'dart:math';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/reusable_widget/app_bar.dart';
import 'package:masalah/reusable_widget/app_text.dart';
import 'package:masalah/util/date_time_util.dart';

class PrayerTimeScreen extends StatefulWidget {
  @override
  _PrayerTimeScreenState createState() => _PrayerTimeScreenState();
}

class _PrayerTimeScreenState extends State<PrayerTimeScreen> {
  DateTime? selectedDate = DateTime.now();
  PrayerTimes? prayerTimes;
  PrayerTimes? prayerTimeNow;
  Coordinates? myCoordinates;
  CalculationParameters? params;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate!,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        // PrayerTimes.utcOffset(coordinates, dateComponents, calculationParameters, utcOffset)
        prayerTimes = PrayerTimes.utcOffset(
            myCoordinates!,
            DateComponents(
                selectedDate!.year, selectedDate!.month, selectedDate!.day),
            params!,
            Duration(hours: 6, minutes: 30));
        print("*#*#*#*#**#*#**#*#*");
        print(prayerTimes!.asr);
      });
  }

  @override
  void initState() {
    super.initState();
    myCoordinates = Coordinates(
        16.8409, 96.1735); // Replace with your own location lat, lng.
    params = CalculationMethod.karachi.getParameters();
    params!.madhab = Madhab.hanafi;
    prayerTimes = PrayerTimes.today(myCoordinates!, params!);
    prayerTimeNow = PrayerTimes.today(myCoordinates!, params!);
  }

  @override
  Widget build(BuildContext context) {
    // print('Kushtia Prayer Times');

    // prayerTimes =
    //     PrayerTimes.utc(myCoordinates, DateComponents(2021, 1, 1), params);
    // print(
    //     "---Today's Prayer Times in Your Local Timezone(${prayerTimes!.fajr.timeZoneName})---");
    // print(prayerTimes!.fajr);
    // print(prayerTimes!.sunrise);
    // print(prayerTimes!.dhuhr);
    // print(prayerTimes!.asr);
    // print(prayerTimes!.maghrib);
    // print(prayerTimes!.isha);

    // print('---');

    // // Custom Timezone Usage. (Most of you won't need this).
    // print('NewYork Prayer Times');
    // final newYork = Coordinates(35.7750, -78.6336);
    // final nyUtcOffset = Duration(hours: -4);
    // final nyDate = DateComponents(2015, 7, 12);
    // final nyParams = CalculationMethod.north_america.getParameters();
    // nyParams.madhab = Madhab.hanafi;
    // final nyPrayerTimes =
    //     PrayerTimes(newYork, nyDate, nyParams, utcOffset: nyUtcOffset);

    // print(nyPrayerTimes.fajr.timeZoneName);
    // print(nyPrayerTimes.fajr);
    // print(nyPrayerTimes.sunrise);
    // print(nyPrayerTimes.dhuhr);
    // print(nyPrayerTimes.asr);
    // print(nyPrayerTimes.maghrib);
    // print(nyPrayerTimes.isha);
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppTopBar(
          title: "PRAYER TIMES",
          bgColor: AppColors.bgColor,
          textColor: AppColors.primaryText,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  image: DecorationImage(
                      image: calculatingCurrentPrayerTime()["image"],
                      fit: BoxFit.cover)),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegularText(
                      data: calculatingCurrentPrayerTime()["name"],
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                    BoldText(
                      fontSize: 26,
                      data: DateTimeUtil().prayerTimeFormat(
                          calculatingCurrentPrayerTime()["time"]),
                      color: AppColors.white,
                    ),
                    RegularText(
                      fontSize: 16,
                      data: "Next Pray: " +
                          calculatingCurrentPrayerTime()["nName"],
                      color: AppColors.white,
                    ),
                    Expanded(
                      child: BoldText(
                        fontSize: 16,
                        data: DateTimeUtil().prayerTimeFormat(
                            calculatingCurrentPrayerTime()["nTime"]),
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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

                        prayerTimes = PrayerTimes.utcOffset(
                            myCoordinates!,
                            DateComponents(selectedDate!.year,
                                selectedDate!.month, selectedDate!.day),
                            params!,
                            Duration(hours: 6, minutes: 30));
                      });
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
                        prayerTimes = PrayerTimes.utcOffset(
                            myCoordinates!,
                            DateComponents(selectedDate!.year,
                                selectedDate!.month, selectedDate!.day),
                            params!,
                            Duration(hours: 6, minutes: 30));
                        print("#############");
                        print(selectedDate.toString());
                      });
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
                // shrinkWrap: true,
                // scrollDirection: Axis.vertical,
                // mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.max,
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
                  Container(
                    padding: EdgeInsets.only(
                        left: 16.0, top: 8, right: 16.0, bottom: 8.0),
                    decoration: BoxDecoration(
                        color: prayerTimes!.fajr.millisecond <=
                                    DateTime.now().millisecond &&
                                prayerTimes!.sunrise.millisecond >=
                                    DateTime.now().millisecond
                            ? AppColors.linkColor
                            : Colors.white),
                    child: Row(
                      children: [
                        Expanded(
                          child: BoldText(
                            color: AppColors.primaryText,
                            fontSize: 18.0,
                            data: "Fajr",
                          ),
                        ),
                        Expanded(
                          child: BoldText(
                            color: AppColors.primaryText,
                            fontSize: 18.0,
                            data: DateTimeUtil()
                                .prayerTimeFormat(prayerTimes!.fajr),
                          ),
                        ),
                        ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.unSelectedIconColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
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
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 16.0, top: 8, right: 16.0, bottom: 8.0),
                    decoration: BoxDecoration(
                      color: prayerTimes!.sunrise.millisecond >
                              DateTime.now().millisecond
                          ? AppColors.bgBtn
                          : Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: BoldText(
                            color: AppColors.primaryText,
                            fontSize: 18.0,
                            data: "Sunrise",
                          ),
                        ),
                        Expanded(
                          child: BoldText(
                            color: AppColors.primaryText,
                            fontSize: 18.0,
                            data: DateTimeUtil()
                                .prayerTimeFormat(prayerTimes!.sunrise),
                          ),
                        ),
                        ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.unSelectedIconColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ))),
                          onPressed: null,
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
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 16.0, top: 8, right: 16.0, bottom: 8.0),
                    decoration: BoxDecoration(
                      color: prayerTimes!.dhuhr.millisecond >
                              DateTime.now().millisecond
                          ? AppColors.bgBtn
                          : Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: BoldText(
                            color: AppColors.primaryText,
                            fontSize: 18.0,
                            data: "Dhuhr",
                          ),
                        ),
                        Expanded(
                          child: BoldText(
                            color: AppColors.primaryText,
                            fontSize: 18.0,
                            data: DateTimeUtil()
                                .prayerTimeFormat(prayerTimes!.dhuhr),
                          ),
                        ),
                        ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.unSelectedIconColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ))),
                          onPressed: null,
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
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 16.0, top: 8, right: 16.0, bottom: 8.0),
                    decoration: BoxDecoration(
                      color: prayerTimes!.asr.millisecond >
                              DateTime.now().millisecond
                          ? AppColors.bgBtn
                          : Colors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: BoldText(
                            color: AppColors.primaryText,
                            fontSize: 18.0,
                            data: "Asr",
                          ),
                        ),
                        Expanded(
                          child: BoldText(
                            color: AppColors.primaryText,
                            fontSize: 18.0,
                            data: DateTimeUtil()
                                .prayerTimeFormat(prayerTimes!.asr),
                          ),
                        ),
                        ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.unSelectedIconColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ))),
                          onPressed: null,
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
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 16.0, top: 8, right: 16.0, bottom: 8.0),
                    decoration: BoxDecoration(
                      color: prayerTimes!.maghrib.millisecond >
                              DateTime.now().millisecond
                          ? AppColors.bgBtn
                          : Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: BoldText(
                            color: AppColors.primaryText,
                            fontSize: 18.0,
                            data: "Magrib",
                          ),
                        ),
                        Expanded(
                          child: BoldText(
                            color: AppColors.primaryText,
                            fontSize: 18.0,
                            data: DateTimeUtil()
                                .prayerTimeFormat(prayerTimes!.maghrib),
                          ),
                        ),
                        ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.unSelectedIconColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ))),
                          onPressed: null,
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
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 16.0, top: 8, right: 16.0, bottom: 8.0),
                    decoration: BoxDecoration(
                      color: prayerTimes!.isha.millisecond <
                                  DateTime.now().millisecond &&
                              prayerTimes!.fajr.millisecond >
                                  DateTime.now().millisecond
                          ? AppColors.bgBtn
                          : Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: BoldText(
                            color: AppColors.primaryText,
                            fontSize: 18.0,
                            data: "Isha",
                          ),
                        ),
                        Expanded(
                          child: BoldText(
                            color: AppColors.primaryText,
                            fontSize: 18.0,
                            data: DateTimeUtil()
                                .prayerTimeFormat(prayerTimes!.isha),
                          ),
                        ),
                        ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.unSelectedIconColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ))),
                          onPressed: null,
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
                  ),
                ],
              ),
            )
          ]),
        ));
  }

  AssetImage prayerTimeImage() {
    AssetImage? assetImage;

    assetImage = AssetImage("assets/images/magrib.png");

    if (prayerTimeNow!.fajr.isAfter(DateTime.now())) {
      return assetImage = AssetImage("assets/images/Isha.png");
    }

    if (prayerTimeNow!.sunrise.isAfter(DateTime.now())) {
      return assetImage = AssetImage("assets/images/Fajr.png");
    }

    if (prayerTimeNow!.dhuhr.isAfter(DateTime.now())) {
      return assetImage = AssetImage("assets/images/sunrise.png");
    }

    if (prayerTimeNow!.asr.isAfter(DateTime.now())) {
      return assetImage = AssetImage("assets/images/Duhr.png");
    }

    if (prayerTimeNow!.maghrib.isAfter(DateTime.now())) {
      return assetImage = AssetImage("assets/images/Asir.png");
    }

    if (prayerTimeNow!.isha.isAfter(DateTime.now())) {
      return assetImage = AssetImage("assets/images/magrib.png");
    }

    if (!prayerTimeNow!.isha.isAfter(DateTime.now())) {
      return assetImage = AssetImage("assets/images/Isha.png");
    }

    return assetImage;
  }

  Map<String, dynamic> calculatingCurrentPrayerTime() {
    print("fajir - ${prayerTimeNow!.fajr}");
    print("s - ${prayerTimeNow!.sunrise}");
    print("d - ${prayerTimeNow!.dhuhr}");
    print("a - ${prayerTimeNow!.asr}");
    print("m - ${prayerTimeNow!.maghrib}");
    print("i - ${prayerTimeNow!.isha}");
    print(DateTime.now());
    print(prayerTimeNow!.maghrib.isAfter(DateTime.now()));
    print(prayerTimeNow!.maghrib.isAfter(DateTime.now()) &&
        prayerTimeNow!.asr.isBefore(DateTime.now()));

    Map<String, dynamic> myObject = {
      'name': null,
      'time': null,
      'nName': null,
      'nTime': null,
      'image': null
    };
    if (prayerTimeNow!.fajr.isAfter(DateTime.now())) {
      myObject = {
        'name': "Isha",
        'time': prayerTimeNow!.isha,
        'nName': "Fajr",
        'nTime': prayerTimeNow!.fajr,
        'image': AssetImage("assets/images/Isha.png")
      };
    }

    if (prayerTimeNow!.sunrise.isAfter(DateTime.now()) &&
        prayerTimeNow!.fajr.isBefore(DateTime.now())) {
      myObject = {
        'name': "Fajr",
        'time': prayerTimeNow!.fajr,
        'nName': "Sunrise",
        'nTime': prayerTimeNow!.sunrise,
        'image': AssetImage("assets/images/Fajr.png")
      };
    }

    if (prayerTimeNow!.dhuhr.isAfter(DateTime.now()) &&
        prayerTimeNow!.sunrise.isBefore(DateTime.now())) {
      myObject = {
        'name': "Sunrise",
        'time': prayerTimeNow!.sunrise,
        'nName': "Duhur",
        'nTime': prayerTimeNow!.dhuhr,
        'image': AssetImage("assets/images/sunrise.png")
      };
    }

    if (prayerTimeNow!.asr.isAfter(DateTime.now()) &&
        prayerTimeNow!.dhuhr.isBefore(DateTime.now())) {
      myObject = {
        'name': "Duhur",
        'time': prayerTimeNow!.dhuhr,
        'nName': "Asr",
        'nTime': prayerTimeNow!.asr,
        'image': AssetImage("assets/images/Duhr.png")
      };
    }

    if (prayerTimeNow!.maghrib.isAfter(DateTime.now()) &&
        prayerTimeNow!.asr.isBefore(DateTime.now())) {
      myObject = {
        'name': "Asr",
        'time': prayerTimeNow!.asr,
        'nName': "Magrib",
        'nTime': prayerTimeNow!.maghrib,
        'image': AssetImage("assets/images/Asir.png")
      };
    }

    if (prayerTimeNow!.isha.isAfter(DateTime.now()) &&
        prayerTimeNow!.maghrib.isBefore(DateTime.now())) {
      myObject = {
        'name': "Magrib",
        'time': prayerTimeNow!.maghrib,
        'nName': "Isha",
        'nTime': prayerTimeNow!.isha,
        'image': AssetImage("assets/images/magrib.png")
      };
    }

    if (!prayerTimeNow!.isha.isAfter(DateTime.now())) {
      myObject = {
        'name': "Isha",
        'time': prayerTimeNow!.isha,
        'nName': "Fajr",
        'nTime': prayerTimeNow!.fajr,
        'image': AssetImage("assets/images/Isha.png")
      };
    }

    return myObject;
  }

  void nowPrayingTime() {
    print("Heyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
  }
}
