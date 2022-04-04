import 'package:flutter/material.dart';
import 'package:masalah/common/screenutil/screenutil.dart';
import 'package:masalah/presentation/journeys/home_screen.dart';
import 'package:masalah/presentation/themes/app_color.dart';
import 'package:masalah/presentation/themes/theme_text.dart';

class MasalahApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //1
    ScreenUtil.init(context);
    //2
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        //3
        primaryColor: AppColor.primary,
        scaffoldBackgroundColor: AppColor.secondaryWhite,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeText.getTextTheme(),
      ),
      //4
      home: HomeScreen(),
    );
  }
}
