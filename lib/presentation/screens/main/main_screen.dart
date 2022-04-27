import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/common/constants/translation_constants.dart';
import 'package:masalah/common/extensions/string_extensions.dart';


import '../converter_screen.dart';
import '../masalah_category_screen.dart';
import '../prayer_time/prayer_time_screen.dart';
import '../qibla_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    MasalahCategoryScreen(),
    PrayerTimeScreen(),
    QiblaScreen(),
    ConverterScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/masalah.png')),
            label: TranslationConstants.gold.t(context) ?? "",
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
    );
  }
}
