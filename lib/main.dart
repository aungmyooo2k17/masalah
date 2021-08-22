import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/screens/masalah_category_screen.dart';
import 'package:masalah/screens/prayer_time_screen.dart';
import 'package:masalah/screens/qibla_screen.dart';

void main() => runApp(MyApp());

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
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
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
    );
  }
}
