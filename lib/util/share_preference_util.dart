import 'dart:ffi';

import 'package:masalah/model/zakat.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../db/db_helper.dart';

class SharedPreferenceUtil {
  static const String PRAYER_MUTE_LIST = "prayer_mute_list";
  static const String ALARM_PRAYER_NAME = "alarm_prayer_name";
  static const String ALARM_PRAYER_TIME = "alarm_prayer_time";
  static const String QURAN_FAV_PAGE = "quran_fav_page";

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

  setQuranPage(int page) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(QURAN_FAV_PAGE, page);
    return page;
  }

  Future getQuranPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(QURAN_FAV_PAGE) ?? Future<int>.value(0);
  }

  Future<void> saveList(String key, List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }

  addStringToSF(String key, String value) async {
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

  clearSharePrefZakatData() {
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.zakatId, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.goldRate, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.silverRate, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.goldAkhoutKyatthar, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.goldAkhoutPae, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.goldAkhoutYwae, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.goldAhtaeKyatthar, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.goldAhtaePae, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.goldAhtaeYwae, "");
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.goldPyitceeKyatthar, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.goldPyitceePae, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.goldPyitceeYwae, "");
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.whiteSilverAkhoutKyatthar, "");
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.whiteSilverAkhoutPae, "");
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.whiteSilverAkhoutYwae, "");
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.whiteSilverAhtaeKyatthar, "");
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.whiteSilverAhtaePae, "");
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.whiteSilverAhtaeYwae, "");
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.whiteSilverPyitceeKyatthar, "");
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.whiteSilverPyitceePae, "");
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.whiteSilverPyitceeYwae, "");
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.silverAkhoutKyatthar, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.silverAkhoutPae, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.silverAkhoutYwae, "");
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.silverAhtaeKyatthar, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.silverAhtaePae, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.silverAhtaeYwae, "");
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.silverPyitceeKyatthar, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.silverPyitceePae, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.silverPyitceeYwae, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.inHandSuHtarTaw, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.inHandPyitceeSold, "");
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.inHandPyitceeBorrow, "");
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.inHandForeignCurrency, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.inHandContract, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.inHandOther, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.inBankInBank, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.inBankThuMyarHlwae, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.inBankSalary, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.inBankOther, "");
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.thuMyarDebtPyitceeSold, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.thuMyarDebtChayPay, "");
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.thuMyarDebtAttHtrTaw, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.thuMyarDebtOther, "");
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.realEstateSellHouse, "");
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.realEstateSellEscort, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.realEstateSellCar, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.realEstateOther, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.rawWearhouse, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.rawHome, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.rawShop, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.rawOther, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.finishWearhouse, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.finishHome, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.finishShop, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.finishAnimal, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.finishOther, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.sate, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.thoe, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.kalaout, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.kywae, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.nwar, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.minusDebtMahur, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.minusDebt, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.minusSukyae, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.minusMeterBill, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.minusPaybill, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.minusPaySalary, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.minusPayRent, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.minusBuyGoodPay, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.minusPreZakat, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.createdAt, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.updatedAt, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.goldRate, "");
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.silverRate, "");
  }

  saveSharePrefZakatData(Zakat zakat) {
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.zakatId, zakat.zakatId.toString());
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.goldRate, zakat.goldRate.toString());
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.silverRate, zakat.silverRate.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.goldAkhoutKyatthar, zakat.goldAkhoutKyatthar.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.goldAkhoutPae, zakat.goldAkhoutPae.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.goldAkhoutYwae, zakat.goldAkhoutYwae.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.goldAhtaeKyatthar, zakat.goldAhtaeKyatthar.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.goldAhtaePae, zakat.goldAhtaePae.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.goldAhtaeYwae, zakat.goldAhtaeYwae.toString());
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.goldPyitceeKyatthar,
        zakat.goldPyitceeKyatthar.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.goldPyitceePae, zakat.goldPyitceePae.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.goldPyitceeYwae, zakat.goldPyitceeYwae.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.whiteSilverAkhoutKyatthar,
        zakat.whiteSilverAkhoutKyatthar.toString());
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.whiteSilverAkhoutPae,
        zakat.whiteSilverAkhoutPae.toString());
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.whiteSilverAkhoutYwae,
        zakat.whiteSilverAkhoutYwae.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.whiteSilverAhtaeKyatthar,
        zakat.whiteSilverAhtaeKyatthar.toString());
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.whiteSilverAhtaePae,
        zakat.whiteSilverAhtaePae.toString());
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.whiteSilverAhtaeYwae,
        zakat.whiteSilverAhtaeYwae.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.whiteSilverPyitceeKyatthar,
        zakat.whiteSilverPyitceeKyatthar.toString());
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.whiteSilverPyitceePae,
        zakat.whiteSilverPyitceePae.toString());
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.whiteSilverPyitceeYwae,
        zakat.whiteSilverPyitceeYwae.toString());
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.silverAkhoutKyatthar,
        zakat.silverAkhoutKyatthar.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.silverAkhoutPae, zakat.silverAkhoutPae.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.silverAkhoutYwae, zakat.silverAkhoutYwae.toString());
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.silverAhtaeKyatthar,
        zakat.silverAhtaeKyatthar.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.silverAhtaePae, zakat.silverAhtaePae.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.silverAhtaeYwae, zakat.silverAhtaeYwae.toString());
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.silverPyitceeKyatthar,
        zakat.silverPyitceeKyatthar.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.silverPyitceePae, zakat.silverPyitceePae.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.silverPyitceeYwae, zakat.silverPyitceeYwae.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.inHandSuHtarTaw, zakat.inHandSuHtarTaw.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.inHandPyitceeSold, zakat.inHandPyitceeSold.toString());
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.inHandPyitceeBorrow,
        zakat.inHandPyitceeBorrow.toString());
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.inHandForeignCurrency,
        zakat.inHandForeignCurrency.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.inHandContract, zakat.inHandContract.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.inHandOther, zakat.inHandOther.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.inBankInBank, zakat.inBankInBank.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.inBankThuMyarHlwae, zakat.inBankThuMyarHlwae.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.inBankSalary, zakat.inBankSalary.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.inBankOther, zakat.inBankOther.toString());
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.thuMyarDebtPyitceeSold,
        zakat.thuMyarDebtPyitceeSold.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.thuMyarDebtChayPay, zakat.thuMyarDebtChayPay.toString());
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.thuMyarDebtAttHtrTaw,
        zakat.thuMyarDebtAttHtrTaw.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.thuMyarDebtOther, zakat.thuMyarDebtOther.toString());
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.realEstateSellHouse,
        zakat.realEstateSellHouse.toString());
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.realEstateSellEscort,
        zakat.realEstateSellEscort.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.realEstateSellCar, zakat.realEstateSellCar.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.realEstateOther, zakat.realEstateOther.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.rawWearhouse, zakat.rawWearhouse.toString());
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.rawHome, zakat.rawHome.toString());
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.rawShop, zakat.rawShop.toString());
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.rawOther, zakat.rawOther.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.finishWearhouse, zakat.finishWearhouse.toString());
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.finishHome, zakat.finishHome.toString());
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.finishShop, zakat.finishShop.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.finishAnimal, zakat.finishAnimal.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.finishOther, zakat.finishOther.toString());
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.sate, zakat.sate.toString());
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.thoe, zakat.thoe.toString());
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.kalaout, zakat.kalaout.toString());
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.kywae, zakat.kywae.toString());
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.nwar, zakat.nwar.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.minusDebtMahur, zakat.minusDebtMahur.toString());
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.minusDebt, zakat.minusDebt.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.minusSukyae, zakat.minusSukyae.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.minusMeterBill, zakat.minusMeterBill.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.minusPaybill, zakat.minusPaybill.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.minusPaySalary, zakat.minusPaySalary.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.minusPayRent, zakat.minusPayRent.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.minusBuyGoodPay, zakat.minusBuyGoodPay.toString());
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.minusPreZakat, zakat.minusPreZakat.toString());
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.createdAt, zakat.createdAt.toString());
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.updatedAt, zakat.updatedAt.toString());
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.goldRate, zakat.goldRate.toString());
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.silverRate, zakat.silverRate.toString());
  }
}
