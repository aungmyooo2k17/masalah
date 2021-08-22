import 'dart:core';
import 'dart:core';

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
            myCoordinates,
            DateComponents(
                selectedDate!.year, selectedDate!.month, selectedDate!.day),
            params,
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
    prayerTimes = PrayerTimes.today(myCoordinates, params);
  }

  @override
  Widget build(BuildContext context) {
    print('Kushtia Prayer Times');

    // prayerTimes =
    //     PrayerTimes.utc(myCoordinates, DateComponents(2021, 1, 1), params);
    print(
        "---Today's Prayer Times in Your Local Timezone(${prayerTimes!.fajr.timeZoneName})---");
    print(prayerTimes!.fajr);
    print(prayerTimes!.sunrise);
    print(prayerTimes!.dhuhr);
    print(prayerTimes!.asr);
    print(prayerTimes!.maghrib);
    print(prayerTimes!.isha);

    print('---');

    // Custom Timezone Usage. (Most of you won't need this).
    print('NewYork Prayer Times');
    final newYork = Coordinates(35.7750, -78.6336);
    final nyUtcOffset = Duration(hours: -4);
    final nyDate = DateComponents(2015, 7, 12);
    final nyParams = CalculationMethod.north_america.getParameters();
    nyParams.madhab = Madhab.hanafi;
    final nyPrayerTimes =
        PrayerTimes(newYork, nyDate, nyParams, utcOffset: nyUtcOffset);

    print(nyPrayerTimes.fajr.timeZoneName);
    print(nyPrayerTimes.fajr);
    print(nyPrayerTimes.sunrise);
    print(nyPrayerTimes.dhuhr);
    print(nyPrayerTimes.asr);
    print(nyPrayerTimes.maghrib);
    print(nyPrayerTimes.isha);
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppTopBar(
          title: "PRAYER TIMES",
          bgColor: AppColors.bgColor,
          textColor: AppColors.primaryText,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                image: DecorationImage(
                  image: prayerTimeImage(),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RegularText(
                      data: calculatingCurrentPrayerTime()["name"],
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    BoldText(
                      fontSize: 26,
                      data: DateTimeUtil().prayerTimeFormat(
                          calculatingCurrentPrayerTime()["time"]),
                      color: AppColors.white,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    RegularText(
                      fontSize: 16,
                      data: "Next Pray: " + calculatingNextPrayerTime()["name"],
                      color: AppColors.white,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    BoldText(
                      fontSize: 16,
                      data: DateTimeUtil().prayerTimeFormat(
                          calculatingNextPrayerTime()["time"]),
                      color: AppColors.white,
                    ),
                  ],
                ),
              ) /* add child content here */,
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              margin:
                  EdgeInsets.only(left: 16.0, top: 8, right: 16.0, bottom: 8.0),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDate =
                            selectedDate!.subtract(Duration(days: 1));

                        prayerTimes = PrayerTimes.utcOffset(
                            myCoordinates,
                            DateComponents(selectedDate!.year,
                                selectedDate!.month, selectedDate!.day),
                            params,
                            Duration(hours: 6, minutes: 30));
                      });
                    },
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: AppColors.bgBtn,
                            borderRadius:
                                BorderRadius.all(Radius.circular(18.0)),
                          ),
                          child: Icon(
                            Icons.arrow_back_outlined,
                            size: 18.0,
                            color: AppColors.white,
                          ),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Align(
                        alignment: Alignment.center,
                        child: BoldText(
                          data: DateTimeUtil()
                              .prayerTimeHumanReadable(selectedDate),
                          fontSize: 16,
                          color: AppColors.primaryText,
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        print(selectedDate.toString());
                        selectedDate = selectedDate!.add(Duration(days: 1));
                        prayerTimes = PrayerTimes.utcOffset(
                            myCoordinates,
                            DateComponents(selectedDate!.year,
                                selectedDate!.month, selectedDate!.day),
                            params,
                            Duration(hours: 6, minutes: 30));
                        print("#############");
                        print(selectedDate.toString());
                      });
                    },
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: AppColors.bgBtn,
                            borderRadius:
                                BorderRadius.all(Radius.circular(18.0)),
                          ),
                          child: Icon(
                            Icons.arrow_forward_outlined,
                            size: 18.0,
                            color: AppColors.white,
                          ),
                        )),
                  ),
                ],
              ),
            ),
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
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RegularText(
                          color: AppColors.primaryText,
                          fontSize: 14.0,
                          data: "Prayer",
                        ),
                        RegularText(
                          color: AppColors.primaryText,
                          fontSize: 14.0,
                          data: "Adhan",
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 16.0, top: 8, right: 16.0, bottom: 8.0),
                    decoration: BoxDecoration(
                        color: prayerTimes!.fajr.millisecond <=
                                    DateTime.now().millisecond &&
                                prayerTimes!.sunrise.millisecond >=
                                    DateTime.now().millisecond
                            ? AppColors.bgColor
                            : Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BoldText(
                          color: AppColors.primaryText,
                          fontSize: 18.0,
                          data: "Fajr",
                        ),
                        BoldText(
                          color: AppColors.primaryText,
                          fontSize: 18.0,
                          data: DateTimeUtil()
                              .prayerTimeFormat(prayerTimes!.fajr),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BoldText(
                          color: AppColors.primaryText,
                          fontSize: 18.0,
                          data: "Sunrise",
                        ),
                        BoldText(
                          color: AppColors.primaryText,
                          fontSize: 18.0,
                          data: DateTimeUtil()
                              .prayerTimeFormat(prayerTimes!.sunrise),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BoldText(
                          color: AppColors.primaryText,
                          fontSize: 18.0,
                          data: "Dhuhr",
                        ),
                        BoldText(
                          color: AppColors.primaryText,
                          fontSize: 18.0,
                          data: DateTimeUtil()
                              .prayerTimeFormat(prayerTimes!.dhuhr),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BoldText(
                          color: AppColors.primaryText,
                          fontSize: 18.0,
                          data: "Asr",
                        ),
                        BoldText(
                          color: AppColors.primaryText,
                          fontSize: 18.0,
                          data:
                              DateTimeUtil().prayerTimeFormat(prayerTimes!.asr),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BoldText(
                          color: AppColors.primaryText,
                          fontSize: 18.0,
                          data: "Magrib",
                        ),
                        BoldText(
                          color: AppColors.primaryText,
                          fontSize: 18.0,
                          data: DateTimeUtil()
                              .prayerTimeFormat(prayerTimes!.maghrib),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 16.0, top: 8, right: 16.0, bottom: 8.0),
                    decoration: BoxDecoration(
                      color: prayerTimes!.isha.millisecond <
                                  DateTime.now().millisecond &&
                              prayerTimes!.fajr.millisecond + 86400000 >
                                  DateTime.now().millisecond
                          ? AppColors.bgBtn
                          : Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BoldText(
                          color: AppColors.primaryText,
                          fontSize: 18.0,
                          data: "Isha",
                        ),
                        BoldText(
                          color: AppColors.primaryText,
                          fontSize: 18.0,
                          data: DateTimeUtil()
                              .prayerTimeFormat(prayerTimes!.isha),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  AssetImage prayerTimeImage() {
    AssetImage? assetImage;
    if (prayerTimes!.isha.millisecond < DateTime.now().millisecond &&
        prayerTimes!.fajr.millisecond + 86400000 > DateTime.now().millisecond) {
      return assetImage = AssetImage("assets/images/Isha.png");
    } else if (prayerTimes!.maghrib.millisecond > DateTime.now().millisecond) {
      return assetImage = AssetImage("assets/images/magrib.png");
    } else if (prayerTimes!.asr.millisecond > DateTime.now().millisecond) {
      return assetImage = AssetImage("assets/images/Asir.png");
    } else if (prayerTimes!.dhuhr.millisecond > DateTime.now().millisecond) {
      return assetImage = AssetImage("assets/images/Duhr.png");
    } else if (prayerTimes!.sunrise.millisecond > DateTime.now().millisecond) {
      return assetImage = AssetImage("assets/images/Duhr.png");
    } else if (prayerTimes!.fajr.millisecond <= DateTime.now().millisecond &&
        prayerTimes!.sunrise.millisecond >= DateTime.now().millisecond) {
      return assetImage = AssetImage("assets/images/Fajr.png");
    }

    return assetImage!;
  }

  Map<String, dynamic> calculatingCurrentPrayerTime() {
    Map<String, dynamic> myObject = {'name': null, 'time': null};
    if (prayerTimes!.isha.millisecond < DateTime.now().millisecond &&
        prayerTimes!.fajr.millisecond + 86400000 > DateTime.now().millisecond) {
      myObject = {'name': "Isha", 'time': prayerTimes!.isha};
    } else if (prayerTimes!.maghrib.millisecond > DateTime.now().millisecond) {
      myObject = {'name': "Magrib", 'time': prayerTimes!.maghrib};
    } else if (prayerTimes!.asr.millisecond > DateTime.now().millisecond) {
      myObject = {'name': "Asr", 'time': prayerTimes!.asr};
    } else if (prayerTimes!.dhuhr.millisecond > DateTime.now().millisecond) {
      myObject = {'name': "Dhuhr", 'time': prayerTimes!.dhuhr};
    } else if (prayerTimes!.sunrise.millisecond > DateTime.now().millisecond) {
      myObject = {'name': "Sunrise", 'time': prayerTimes!.sunrise};
    } else if (prayerTimes!.fajr.millisecond <= DateTime.now().millisecond &&
        prayerTimes!.sunrise.millisecond >= DateTime.now().millisecond) {
      myObject = {'name': "Fajr", 'time': prayerTimes!.fajr};
    }

    return myObject;
  }

  Map<String, dynamic> calculatingNextPrayerTime() {
    Map<String, dynamic> myObject = {'name': null, 'time': null};
    if (prayerTimes!.isha.millisecond < DateTime.now().millisecond &&
        prayerTimes!.fajr.millisecond + 86400000 > DateTime.now().millisecond) {
      myObject = {'name': "Fajr", 'time': prayerTimes!.fajr};
    } else if (prayerTimes!.maghrib.millisecond > DateTime.now().millisecond) {
      myObject = {'name': "Isha", 'time': prayerTimes!.isha};
    } else if (prayerTimes!.asr.millisecond > DateTime.now().millisecond) {
      myObject = {'name': "Magrib", 'time': prayerTimes!.maghrib};
    } else if (prayerTimes!.dhuhr.millisecond > DateTime.now().millisecond) {
      myObject = {'name': "Asr", 'time': prayerTimes!.asr};
    } else if (prayerTimes!.sunrise.millisecond > DateTime.now().millisecond) {
      myObject = {'name': "Dhuhr", 'time': prayerTimes!.dhuhr};
    } else if (prayerTimes!.fajr.millisecond <= DateTime.now().millisecond &&
        prayerTimes!.sunrise.millisecond >= DateTime.now().millisecond) {
      myObject = {'name': "Sunrise", 'time': prayerTimes!.sunrise};
    }

    return myObject;
  }
}
