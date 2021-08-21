import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/reusable_widget/app_bar.dart';

import '../loading_indicator.dart';
import '../qiblah_compass.dart';
import '../qiblah_maps.dart';

class QiblaScreen extends StatelessWidget {
  const QiblaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff0c7b93),
        primaryColorLight: Color(0xff00a8cc),
        primaryColorDark: Color(0xff27496d),
        accentColor: Color(0xffecce6d),
      ),
      darkTheme: ThemeData.light().copyWith(accentColor: Color(0xffecce6d)),
      home: Scaffold(
        appBar: AppTopBar(
          title: "QIBLA DIRECTION",
          bgColor: AppColors.white,
          textColor: AppColors.primaryText,
        ),
        body: FutureBuilder(
          future: _deviceSupport,
          builder: (_, AsyncSnapshot<bool?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return LoadingIndicator();
            if (snapshot.hasError)
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );

            if (snapshot.data!)
              return QiblahCompass();
            else
              return QiblahMaps();
          },
        ),
      ),
    );
  }
}
