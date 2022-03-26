import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masalah/presentation/masalah_app.dart';
import 'package:pedantic/pedantic.dart';
import 'di/get_it.dart' as getIt;

void main() {
  //2
  WidgetsFlutterBinding.ensureInitialized();
  //3
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  //4
  unawaited(getIt.init());
  //5
  runApp(MaterialApp(home: MasalahApp()));
}
