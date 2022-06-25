import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:masalah/prayer_time/prayer_time_wrapper.dart';
import 'package:masalah/presentation/app_localizations.dart';
import 'package:masalah/presentation/blocs/location/location_cubit.dart';
import 'package:masalah/presentation/blocs/prayertime/prayer_time_date_selector_cubit.dart';
import 'package:masalah/presentation/blocs/prayertime/prayertime_cubit.dart';
import 'package:masalah/presentation/screens/main/main_screen.dart';
import 'package:masalah/presentation/screens/splash/splash_screen.dart';
import 'package:masalah/service/location_service.dart';

import 'common/constants/languages.dart';
import 'di/get_it.dart';
import 'presentation/blocs/language/language_bloc.dart';

/// This is the main application widget.
class MasalahApp extends StatelessWidget {
  const MasalahApp({Key? key}) : super(key: key);

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
  late LanguageBloc _languageBloc;
  late PrayertimeCubit _prayerTimeCubit;
  late LocationCubit _locationCubit;

  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _languageBloc = getItInstance<LanguageBloc>();
    _locationCubit = getItInstance<LocationCubit>();
    _prayerTimeCubit = getItInstance<PrayertimeCubit>();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    _languageBloc.close();
    _locationCubit.close();
    _prayerTimeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: _locationCubit,
          ),
          
          BlocProvider(
            create: (context) => PrayertimeCubit(
                prayerTimePluginUtil: PrayerTimePluginUtil(),
                locationService: LocationServiceImpl()),
          ),
          BlocProvider.value(
            value: _languageBloc,
          ),
        ],
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            if (state is LanguageLoaded) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Masalah',
                  supportedLocales:
                      Languages.languages.map((e) => Locale(e.code)).toList(),
                  locale: state.locale,
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  home: SplashScreen());
            }
            return const SizedBox.shrink();
          },
        ));
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
