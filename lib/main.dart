import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_widget/home_widget.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/screens/converter_screen.dart';
import 'package:masalah/screens/masalah_category_screen.dart';
import 'package:masalah/screens/prayer_time_screen.dart';
import 'package:masalah/screens/qibla_screen.dart';
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:masalah/util/date_time_util.dart';
import 'package:masalah/util/local_notification.dart';
import 'package:masalah/util/locale_string.dart';
import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    //show the notification
    LocalNotification.Initializer();
    LocalNotification.ShowOneTimeNotification(DateTime.now());

    return Future.value(true);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HomeWidget.registerBackgroundCallback(backgroundCallback);
  await Workmanager().initialize(callbackDispatcher);
  await Workmanager().registerPeriodicTask("test_workertask", "test_workertask",
      inputData: {"data1": "value1", "data2": "value2"},
      frequency: Duration(minutes: 1),
      initialDelay: Duration(minutes: 1));

  runApp(MyApp());
}

dynamic backgroundCallback(Uri? uri) async {
  DateTime? selectedDate = DateTime.now();
  PrayerTimes? prayerTimes;
  PrayerTimes? prayerTimeNow;
  Coordinates? myCoordinates;
  CalculationParameters? params;
  myCoordinates =
      Coordinates(16.8409, 96.1735); // Replace with your own location lat, lng.
  params = CalculationMethod.karachi.getParameters();
  params.madhab = Madhab.hanafi;
  prayerTimes = PrayerTimes.today(myCoordinates, params);
  prayerTimeNow = PrayerTimes.today(myCoordinates, params);
  print("*******************updateingggggggggggggggg");
  if (uri!.host == 'updatecounter') {
    print("*******************################");
    String _counter = "0";
    await HomeWidget.getWidgetData<String>('_counter', defaultValue: "0")
        .then((value) {
      _counter = value!;
    });
    await HomeWidget.saveWidgetData<String>('_counter',
        DateTimeUtil().prayerTimeFormat(prayerTimeNow.fajr).toString());
    await HomeWidget.updateWidget(
        name: 'AppWidgetProvider', iOSName: 'AppWidgetProvider');
  }
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
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
