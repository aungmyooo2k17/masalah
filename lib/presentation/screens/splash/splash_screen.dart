import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masalah/presentation/blocs/location/location_cubit.dart';
import 'package:masalah/presentation/blocs/prayertime/prayertime_cubit.dart';
import 'package:masalah/presentation/screens/al_quran/data/surah.dart';
import 'package:masalah/presentation/screens/al_quran/surah_screen.dart';
import 'package:masalah/presentation/screens/main/main_screen.dart';
import 'package:masalah/presentation/screens/tool_list/tool_list_screen.dart';
import 'package:masalah/service/launcher_widget_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PrayertimeCubit>().initPrayerTime();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) {
      return ToolListPage();
    }), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PrayertimeCubit, PrayertimeState>(
      listenWhen: (previous, current) =>
          current is PrayerTimeInitError || current is PrayertimeInitCompleted,
      listener: (context, state) {
        if (state is PrayertimeInitCompleted) {
          unawaited(LauncherWidgetService().sendDataToAppWidget());
        }
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) {
          return MainScreen();
        }), (route) => false);
      },
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
