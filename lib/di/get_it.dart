import 'package:get_it/get_it.dart';

import '../presentation/blocs/language/language_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc());
}
