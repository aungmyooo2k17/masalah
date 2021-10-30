import 'dart:async';
import 'dart:isolate';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/screens/converter_screen.dart';
import 'package:masalah/screens/masalah_category_screen.dart';
import 'package:masalah/screens/prayer_time/prayer_time_screen.dart';
import 'package:masalah/screens/qibla_screen.dart';
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:masalah/service/alarm_scheduler.dart';
import 'package:masalah/service/notification_service.dart';
import 'package:masalah/util/locale_string.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  await NotificationService().init();
  AlarmScheduler().cancelAlarm();
  await AlarmScheduler().setAlarm();
  runApp(MyApp());
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget();
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    MasalahCategoryScreen(),
    PrayerTimeScreen(),
    QiblaScreen(),
    ConverterScreen()
  ];

  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Connection..........$_connectionStatus");

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: Locale('hi', 'IN'),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/masalah.png')),
              label: 'Masalah',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/adhan.png')),
              label: 'Prayer Time',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/qibla.png')),
              label: 'Qibla',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/converter.png')),
              label: 'Calculator',
            ),
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.selectedIconColor,
          backgroundColor: AppColors.primaryText,
          unselectedItemColor: AppColors.unSelectedIconColor,
          onTap: _onItemTapped,
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
    );
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        setState(() => _connectionStatus = result.toString());
        break;
      default:
        setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }
}
