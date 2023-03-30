import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/presentation/reusable_widget/app_text.dart';
import 'package:masalah/presentation/screens/al_quran/para_screen.dart';
import 'package:masalah/presentation/screens/al_quran/surah_screen.dart';

class AlQuranHome extends StatefulWidget {
  const AlQuranHome({Key? key}) : super(key: key);

  @override
  State<AlQuranHome> createState() => _AlQuranHomeState();
}

class _AlQuranHomeState extends State<AlQuranHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.primaryText, //change your color here
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: const TabBar(
            labelColor: AppColors.primaryText,
            indicatorColor: AppColors.primaryText,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                text: "Surah",
              ),
              Tab(
                text: "Para",
              )
            ],
          ),
          title: RegularText(
            color: AppColors.primaryText,
            data: "Al-Quran",
          ),
        ),
        body: TabBarView(
          children: [
            SurahList(),
            ParaScreen(),
          ],
        ),
      ),
    );
  }
}
