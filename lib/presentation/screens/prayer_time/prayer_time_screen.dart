import 'dart:core';
import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/common/constants/translation_constants.dart';
import 'package:masalah/model/ui_prayer_time.dart';
import 'package:masalah/prayer_time/prayer_time_wrapper.dart';
import 'package:masalah/presentation/blocs/prayertime/prayertime_cubit.dart';
import 'package:masalah/presentation/reusable_widget/app_bar.dart';
import 'package:masalah/presentation/reusable_widget/app_text.dart';
import 'package:masalah/presentation/reusable_widget/shimmer.dart';
import 'package:masalah/presentation/reusable_widget/shimmer_loading.dart';
import 'package:masalah/presentation/screens/prayer_time/prayer_card_item_holder_widget.dart';
import 'package:masalah/presentation/screens/prayer_time/prayer_card_item_widget.dart';
import 'package:masalah/service/launcher_widget_service.dart';
import 'package:masalah/util/date_time_util.dart';
import 'package:masalah/common/extensions/string_extensions.dart';
import 'prayer_item_widget.dart';

class PrayerTimeScreen extends StatefulWidget {
  @override
  _PrayerTimeScreenState createState() => _PrayerTimeScreenState();
}

class _PrayerTimeScreenState extends State<PrayerTimeScreen> {
  final PrayerTimePluginUtil prayerTimePluginUtil = PrayerTimePluginUtil();
  DateTime? selectedDate = DateTime.now();
  UiPrayerTimeItemCard? prayerTimeItemCard;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate!,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
    context.read<PrayertimeCubit>().initPrayerTimeWithOffset(selectedDate!);
  }

  @override
  void initState() {
    super.initState();

    // loadPrayerTimes();
    // sendWidgetData();
  }

  Future<UiPrayerTimeItemCard?> loadPrayerTimes() async {
    return await context.read<PrayertimeCubit>().loadPrayerTimes();
  }

  Future<void> sendWidgetData() async {
    await LauncherWidgetService().sendDataToAppWidget();
  }

  final _shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppTopBar(
          title: TranslationConstants.prayerTime.t(context) ?? "",
          bgColor: AppColors.bgColor,
          textColor: AppColors.primaryText,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            // if (prayerTimeItemCard != null)
            //   PrayerCardItemWidget(uiPrayerTimeItemCard: prayerTimeItemCard!),
            FutureBuilder(
                future: loadPrayerTimes(),
                builder: (cntx, item) {
                  if (item.connectionState == ConnectionState.waiting) {
                    return Shimmer(
                      linearGradient: _shimmerGradient,
                      child: ShimmerLoading(
                          isLoading: true,
                          child: PrayerCardItemWidget(
                              uiPrayerTimeItemCard: UiPrayerTimeItemCard(
                                  currentPrayerTimeItem: UiPrayerTimeItem(
                                      name: "Isha",
                                      currentPrayerTime: "6:45 PM",
                                      isMuteForCurrentPrayer: true),
                                  nextPrayerName: "Fajr",
                                  nextPrayerTime: "4:55 AM",
                                  currentPrayerImage: "assets/images/Asir.png",
                                  location: "Yangon"))),
                    );
                  } else {
                    return PrayerCardItemWidget(
                        uiPrayerTimeItemCard:
                            item.data as UiPrayerTimeItemCard);
                  }
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
                      context
                          .read<PrayertimeCubit>()
                          .initPrayerTimeWithOffset(selectedDate!);

                      // prayerTimePluginUtil.initWithOffset(
                      //     Coordinates(16.8409, 96.1735), selectedDate!);
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
                        selectedDate = selectedDate!.add(Duration(days: 1));
                      });
                      context
                          .read<PrayertimeCubit>()
                          .initPrayerTimeWithOffset(selectedDate!);

                      // prayerTimePluginUtil.initWithOffset(
                      //     Coordinates(16.8409, 96.1735), selectedDate!);
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
                  FutureBuilder<List<UiPrayerTimeItem>>(
                    future: prayerTimePluginUtil.getCurrentDatePrayers(),
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
        ));
  }

  void nowPrayingTime() {}
}
