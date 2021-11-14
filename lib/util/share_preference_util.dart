import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtil {
  static const String PRAYER_MUTE_LIST = "prayer_mute_list";
  static const String ALARM_PRAYER_NAME = "alarm_prayer_name";
  static const String ALARM_PRAYER_TIME = "alarm_prayer_time";

  static final SharedPreferenceUtil _sharedPreferenceUtil =
      SharedPreferenceUtil._();

  SharedPreferenceUtil._();

  factory SharedPreferenceUtil() {
    return _sharedPreferenceUtil;
  }

  Future<List<String>?> loadList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

  Future<void> saveList(String key, List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }

  addStringToSF(String key,String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  addIntToSF(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  addDoubleToSF(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  addBoolToSF(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  getStringValuesSF(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString(key) ?? "";
    return stringValue;
  }

  getBoolValuesSF(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool? boolValue = prefs.getBool(key) ?? false;
    return boolValue;
  }

  getIntValuesSF(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int? intValue = prefs.getInt(key) ?? 0;
    return intValue;
  }

  getDoubleValuesSF(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return double
    double? doubleValue = prefs.getDouble(key) ?? 0.0;
    return doubleValue;
  }

  removeValue(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Remove String
    prefs.remove(key);
  }
}
