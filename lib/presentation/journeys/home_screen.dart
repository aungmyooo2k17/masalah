import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masalah/di/get_it.dart';
import 'package:masalah/presentation/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:masalah/presentation/blocs/masalahlist/masalahlist_bloc.dart';
import 'package:masalah/presentation/journeys/masalah/category/masalah_category_list_page.dart';
import 'package:masalah/presentation/journeys/masalah/masalah_item_widget.dart';
import 'package:masalah/presentation/journeys/masalah/masalah_list_page.dart';
import 'package:masalah/presentation/themes/app_color.dart';
import 'package:masalah/reusable_widget/app_bar.dart';
import 'package:masalah/screens/converter_screen.dart';
import 'package:masalah/screens/prayer_time/prayer_time_screen.dart';
import 'package:masalah/screens/qibla_screen.dart';

import '../../common/constants/color_constant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late MasalahlistBloc masalahlistBloc;
  late BottomNavigationBloc bottomNavigationBloc;

  @override
  void initState() {
    super.initState();
    // masalahlistBloc = getItInstance<MasalahlistBloc>();
    // masalahlistBloc.add(MasalahListLoadEvent());
    bottomNavigationBloc = getItInstance<BottomNavigationBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    // masalahlistBloc.close();
    bottomNavigationBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bottomNavigationBloc,
      child: Scaffold(
        body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
            bloc: bottomNavigationBloc,
            builder: (context, state) {
              print(state.toString());
              if (state is PageLoading) {
                print(state.toString());
                return Center(child: CircularProgressIndicator());
              }
              if (state is FirstPageLoaded) {
                print("this one");
                return MasalahCategoryListPage();
              }
              if (state is SecondPageLoaded) {
                return PrayerTimeScreen();
              }
              if (state is ThirdPageLoaded) {
                return QiblaScreen();
              }
              if (state is FourthPageLoaded) {
                return ConverterScreen();
              }
              return MasalahCategoryListPage();
            }),
        bottomNavigationBar: BlocBuilder<BottomNavigationBloc,
                BottomNavigationState>(
            bloc: bottomNavigationBloc,
            builder: (BuildContext context, BottomNavigationState state) {
              return BottomNavigationBar(
                currentIndex: bottomNavigationBloc.currentIndex,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColor.accent,
                backgroundColor: AppColor.primary,
                unselectedItemColor: AppColor.secondry,
                items: const <BottomNavigationBarItem>[
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
                onTap: (index) =>
                    bottomNavigationBloc.add(PageTapped(index: index)),
              );
            }),
      ),
    );
  }
  //1
}
