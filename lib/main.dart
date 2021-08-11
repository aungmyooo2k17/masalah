import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

import 'loading_indicator.dart';
import 'qiblah_compass.dart';
import 'qiblah_maps.dart';

import 'package:adhan/adhan.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    print('Kushtia Prayer Times');
    final myCoordinates = Coordinates(
        23.9088, 89.1220); // Replace with your own location lat, lng.
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
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff0c7b93),
        primaryColorLight: Color(0xff00a8cc),
        primaryColorDark: Color(0xff27496d),
        accentColor: Color(0xffecce6d),
      ),
      darkTheme: ThemeData.dark().copyWith(accentColor: Color(0xffecce6d)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
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

/*class CenterEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: FlatButton(
            color: Colors.green,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Example();
                  },
                ),
              );
            },
            child: Text('Open Qiplah'),
          ),
        ));
  }
}*/


// class CenterEx extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Center(
//           child: RaisedButton(
//             color: Theme.of(context).accentColor,
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) {
//                     return Scaffold(
//                       appBar: AppBar(
//                         title: Text("Compass"),
//                       ),
//                       body: TestingCompassWidget(),
//                     );
//                   },
//                 ),
//               );
//             },
//             child: Text('Open Compass'),
//           ),
//         ));
//   }
// }
//
// class TestingCompassWidget extends StatefulWidget {
//   @override
//   _TestingCompassWidgetState createState() => _TestingCompassWidgetState();
// }
//
// class _TestingCompassWidgetState extends State<TestingCompassWidget> {
//   @override
//   void dispose() {
//     FlutterCompass().dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: _buildManualReader(),
//     );
//   }
//
//   Widget _buildManualReader() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: StreamBuilder<double>(
//           stream: FlutterCompass.events,
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               return Text('Error reading heading: ${snapshot.error}');
//             }
//
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//
//             double direction = snapshot.data;
//             return Text(
//               '$direction',
//               style: Theme.of(context).textTheme.button,
//             );
//           }),
//     );
//   }
// }