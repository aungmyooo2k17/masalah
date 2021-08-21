import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/reusable_widget/app_bar.dart';
import 'package:masalah/reusable_widget/app_text.dart';
import 'package:masalah/util/date_time_util.dart';

class PrayerTimeScreen extends StatelessWidget {
  const PrayerTimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Kushtia Prayer Times');
    final myCoordinates = Coordinates(
        16.8409, 96.1735); // Replace with your own location lat, lng.
    final params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.hanafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);

    print(
        "---Today's Prayer Times in Your Local Timezone(${prayerTimes.fajr.timeZoneName})---");
    print(prayerTimes.fajr);
    print(prayerTimes.sunrise);
    print(prayerTimes.dhuhr);
    print(prayerTimes.asr);
    print(prayerTimes.maghrib);
    print(prayerTimes.isha);

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
                  image: AssetImage("assets/images/Asir.png"),
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
                      data: "Duhur",
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    BoldText(
                      fontSize: 26,
                      data: "11:45 PM",
                      color: AppColors.white,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    RegularText(
                      fontSize: 16,
                      data: "Next Pray: Asr",
                      color: AppColors.white,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    BoldText(
                      fontSize: 16,
                      data: "4:30 PM",
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
                  Align(
                      alignment: Alignment.centerLeft,
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
                      )),
                  Align(
                      alignment: Alignment.center,
                      child: BoldText(
                        data: "Sat, Aug 14 2021",
                        fontSize: 16,
                        color: AppColors.primaryText,
                      )),
                  Align(
                      alignment: Alignment.centerRight,
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
                      )),
                ],
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
              child: Column(
                children: [
                  Row(
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
                  SizedBox(
                    height: 16,
                  ),
                  Row(
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
                        data: DateTimeUtil().prayerTimeFormat(prayerTimes.fajr),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
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
                            .prayerTimeFormat(prayerTimes.sunrise),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
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
                        data:
                            DateTimeUtil().prayerTimeFormat(prayerTimes.dhuhr),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
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
                        data: DateTimeUtil().prayerTimeFormat(prayerTimes.asr),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
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
                            .prayerTimeFormat(prayerTimes.maghrib),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
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
                        data: DateTimeUtil().prayerTimeFormat(prayerTimes.isha),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
