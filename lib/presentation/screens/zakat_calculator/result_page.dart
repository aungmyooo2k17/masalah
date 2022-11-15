import 'package:flutter/material.dart';
import 'package:masalah/presentation/screens/main/main_screen.dart';
import 'package:masalah/util/zakat_calculator_util.dart';

import '../../../common/constants/color_constant.dart';
import '../../../db/db_helper.dart';
import '../../../util/share_preference_util.dart';
import '../../reusable_widget/app_text.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late Map<String, String> _result = {
    DatabaseHelper.yourZakat: "",
    DatabaseHelper.yourZakatAnimal: ""
  };
  late Map<String, dynamic> saveData;
  final dbHelper = DatabaseHelper.instance;
  @override
  void initState() {
    super.initState();
    getResult().then((value) => {
          setState(() {
            _result = value;
            saveData.addAll(value);
          })
        });
  }

  @override
  void dispose() {
    saveDB();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      // key: _globalKey,
      child: Container(
        margin: EdgeInsets.only(bottom: 28),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Column(
          children: [
            RegularText(
              data: "ထိုက်သောဇကားသ်",
            ),
            _result[DatabaseHelper.yourZakat] != null
                ? BoldText(
                    color: AppColors.primaryText,
                    data: _result[DatabaseHelper.yourZakat] ?? "")
                : SizedBox(),
            SizedBox(
              height: 12.0,
            ),
            _result[DatabaseHelper.yourZakatAnimal] != null
                ? BoldText(
                    fontSize: 14.0,
                    data: _result[DatabaseHelper.yourZakatAnimal] ?? "")
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  Future<Map<String, String>> getResult() async {
    Map<String, dynamic> zakatDataMap = await zakatCalculationMap();
    saveData = zakatDataMap;
    double totalGoldPlatinum = ZakatCalculatorUtil().getTotalGoldPlatinum(
        double.parse(zakatDataMap[DatabaseHelper.goldRate]),
        double.parse(zakatDataMap[DatabaseHelper.goldAkhoutKyatthar]),
        double.parse(zakatDataMap[DatabaseHelper.goldAkhoutPae]),
        double.parse(zakatDataMap[DatabaseHelper.goldAkhoutYwae]),
        double.parse(zakatDataMap[DatabaseHelper.goldAhtaeKyatthar]),
        double.parse(zakatDataMap[DatabaseHelper.goldAhtaePae]),
        double.parse(zakatDataMap[DatabaseHelper.goldAhtaeYwae]),
        double.parse(zakatDataMap[DatabaseHelper.goldPyitceeKyatthar]),
        double.parse(zakatDataMap[DatabaseHelper.goldPyitceePae]),
        double.parse(zakatDataMap[DatabaseHelper.goldPyitceeYwae]),
        double.parse(zakatDataMap[DatabaseHelper.whiteSilverAkhoutKyatthar]),
        double.parse(zakatDataMap[DatabaseHelper.whiteSilverAkhoutPae]),
        double.parse(zakatDataMap[DatabaseHelper.whiteSilverAkhoutYwae]),
        double.parse(zakatDataMap[DatabaseHelper.whiteSilverAhtaeKyatthar]),
        double.parse(zakatDataMap[DatabaseHelper.whiteSilverAhtaePae]),
        double.parse(zakatDataMap[DatabaseHelper.whiteSilverAhtaeYwae]),
        double.parse(zakatDataMap[DatabaseHelper.whiteSilverPyitceeKyatthar]),
        double.parse(zakatDataMap[DatabaseHelper.whiteSilverPyitceePae]),
        double.parse(zakatDataMap[DatabaseHelper.whiteSilverPyitceeYwae]));

    double totalSilverOther = ZakatCalculatorUtil().getTotalSilverMoneyOther(
        double.parse(zakatDataMap[DatabaseHelper.silverRate]),
        double.parse(zakatDataMap[DatabaseHelper.silverAkhoutKyatthar]),
        double.parse(zakatDataMap[DatabaseHelper.silverAkhoutPae]),
        double.parse(zakatDataMap[DatabaseHelper.silverAkhoutYwae]),
        double.parse(zakatDataMap[DatabaseHelper.silverAhtaeKyatthar]),
        double.parse(zakatDataMap[DatabaseHelper.silverAhtaePae]),
        double.parse(zakatDataMap[DatabaseHelper.silverAhtaeYwae]),
        double.parse(zakatDataMap[DatabaseHelper.silverPyitceeKyatthar]),
        double.parse(zakatDataMap[DatabaseHelper.silverPyitceePae]),
        double.parse(zakatDataMap[DatabaseHelper.silverPyitceeYwae]),
        double.parse(zakatDataMap[DatabaseHelper.inHandSuHtarTaw]),
        double.parse(zakatDataMap[DatabaseHelper.inHandPyitceeSold]),
        double.parse(zakatDataMap[DatabaseHelper.inHandPyitceeBorrow]),
        double.parse(zakatDataMap[DatabaseHelper.inHandForeignCurrency]),
        double.parse(zakatDataMap[DatabaseHelper.inHandContract]),
        double.parse(zakatDataMap[DatabaseHelper.inHandOther]),
        double.parse(zakatDataMap[DatabaseHelper.inBankInBank]),
        double.parse(zakatDataMap[DatabaseHelper.inBankThuMyarHlwae]),
        double.parse(zakatDataMap[DatabaseHelper.inBankSalary]),
        double.parse(zakatDataMap[DatabaseHelper.inBankOther]),
        double.parse(zakatDataMap[DatabaseHelper.thuMyarDebtPyitceeSold]),
        double.parse(zakatDataMap[DatabaseHelper.thuMyarDebtChayPay]),
        double.parse(zakatDataMap[DatabaseHelper.thuMyarDebtAttHtrTaw]),
        double.parse(zakatDataMap[DatabaseHelper.thuMyarDebtOther]),
        double.parse(zakatDataMap[DatabaseHelper.realEstateSellHouse]),
        double.parse(zakatDataMap[DatabaseHelper.realEstateSellEscort]),
        double.parse(zakatDataMap[DatabaseHelper.realEstateSellCar]),
        double.parse(zakatDataMap[DatabaseHelper.realEstateOther]),
        double.parse(zakatDataMap[DatabaseHelper.rawWearhouse]),
        double.parse(zakatDataMap[DatabaseHelper.rawHome]),
        double.parse(zakatDataMap[DatabaseHelper.rawShop]),
        double.parse(zakatDataMap[DatabaseHelper.rawOther]),
        double.parse(zakatDataMap[DatabaseHelper.finishWearhouse]),
        double.parse(zakatDataMap[DatabaseHelper.finishHome]),
        double.parse(zakatDataMap[DatabaseHelper.finishShop]),
        double.parse(zakatDataMap[DatabaseHelper.finishAnimal]),
        double.parse(zakatDataMap[DatabaseHelper.finishOther]));

    double totalMinus = ZakatCalculatorUtil().getTotalMinus(
        double.parse(zakatDataMap[DatabaseHelper.minusDebtMahur]),
        double.parse(zakatDataMap[DatabaseHelper.minusDebt]),
        double.parse(zakatDataMap[DatabaseHelper.minusSukyae]),
        double.parse(zakatDataMap[DatabaseHelper.minusMeterBill]),
        double.parse(zakatDataMap[DatabaseHelper.minusPaybill]),
        double.parse(zakatDataMap[DatabaseHelper.minusPaySalary]),
        double.parse(zakatDataMap[DatabaseHelper.minusPayRent]),
        double.parse(zakatDataMap[DatabaseHelper.minusBuyGoodPay]),
        double.parse(zakatDataMap[DatabaseHelper.minusPreZakat]));

    int cow = zakatDataMap[DatabaseHelper.nwar] == ''
        ? 0
        : int.parse(zakatDataMap[DatabaseHelper.nwar]);
    int buf = zakatDataMap[DatabaseHelper.kywae] == ''
        ? 0
        : int.parse(zakatDataMap[DatabaseHelper.kywae]);
    int sate = zakatDataMap[DatabaseHelper.sate] == ''
        ? 0
        : int.parse(zakatDataMap[DatabaseHelper.sate]);
    int thoe = zakatDataMap[DatabaseHelper.thoe] == ''
        ? 0
        : int.parse(zakatDataMap[DatabaseHelper.thoe]);
    int camel = zakatDataMap[DatabaseHelper.kalaout] == ''
        ? 0
        : int.parse(zakatDataMap[DatabaseHelper.kalaout]);

    return ZakatCalculatorUtil().calcFinalZakatAmount(
        totalGoldPlatinum,
        totalSilverOther,
        totalMinus,
        double.parse(zakatDataMap[DatabaseHelper.goldRate]),
        double.parse(zakatDataMap[DatabaseHelper.silverRate]),
        cow + buf,
        sate + thoe,
        camel);
  }

  Future<Map<String, dynamic>> zakatCalculationMap() async {
    return {
      DatabaseHelper.zakatId: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.zakatId) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.zakatId)
          : new DateTime.now().microsecondsSinceEpoch,
      DatabaseHelper.goldRate: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.goldRate) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.goldRate)
          : 0.0,
      DatabaseHelper.silverRate: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.silverRate) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.silverRate)
          : 0.0,
      DatabaseHelper.goldAkhoutKyatthar: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.goldAkhoutKyatthar) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.goldAkhoutKyatthar)
          : 0.0,
      DatabaseHelper.goldAkhoutPae: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.goldAkhoutPae) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.goldAkhoutPae)
          : 0.0,
      DatabaseHelper.goldAkhoutYwae: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.goldAkhoutYwae) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.goldAkhoutYwae)
          : 0.0,
      DatabaseHelper.goldAhtaeKyatthar: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.goldAhtaeKyatthar) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.goldAhtaeKyatthar)
          : 0.0,
      DatabaseHelper.goldAhtaePae: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.goldAhtaePae) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.goldAhtaePae)
          : 0.0,
      DatabaseHelper.goldAhtaeYwae: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.goldAhtaeYwae) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.goldAhtaeYwae)
          : 0.0,
      DatabaseHelper.goldPyitceeKyatthar: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.goldPyitceeKyatthar) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.goldPyitceeKyatthar)
          : 0.0,
      DatabaseHelper.goldPyitceePae: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.goldPyitceePae) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.goldPyitceePae)
          : 0.0,
      DatabaseHelper.goldPyitceeYwae: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.goldPyitceeYwae) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.goldPyitceeYwae)
          : 0.0,
      DatabaseHelper.whiteSilverAkhoutKyatthar: await SharedPreferenceUtil()
                  .getStringValuesSF(
                      DatabaseHelper.whiteSilverAkhoutKyatthar) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.whiteSilverAkhoutKyatthar)
          : 0.0,
      DatabaseHelper.whiteSilverAkhoutPae: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.whiteSilverAkhoutPae) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.whiteSilverAkhoutPae)
          : 0.0,
      DatabaseHelper.whiteSilverAkhoutYwae: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.whiteSilverAkhoutYwae) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.whiteSilverAkhoutYwae)
          : 0.0,
      DatabaseHelper.whiteSilverAhtaeKyatthar: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.whiteSilverAhtaeKyatthar) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.whiteSilverAhtaeKyatthar)
          : 0.0,
      DatabaseHelper.whiteSilverAhtaePae: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.whiteSilverAhtaePae) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.whiteSilverAhtaePae)
          : 0.0,
      DatabaseHelper.whiteSilverAhtaeYwae: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.whiteSilverAhtaeYwae) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.whiteSilverAhtaeYwae)
          : 0.0,
      DatabaseHelper.whiteSilverPyitceeKyatthar: await SharedPreferenceUtil()
                  .getStringValuesSF(
                      DatabaseHelper.whiteSilverPyitceeKyatthar) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.whiteSilverPyitceeKyatthar)
          : 0.0,
      DatabaseHelper.whiteSilverPyitceePae: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.whiteSilverPyitceePae) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.whiteSilverPyitceePae)
          : 0.0,
      DatabaseHelper.whiteSilverPyitceeYwae: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.whiteSilverPyitceeYwae) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.whiteSilverPyitceeYwae)
          : 0.0,
      DatabaseHelper.silverAkhoutKyatthar: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.silverAkhoutKyatthar) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.silverAkhoutKyatthar)
          : 0.0,
      DatabaseHelper.silverAkhoutPae: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.silverAkhoutPae) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.silverAkhoutPae)
          : 0.0,
      DatabaseHelper.silverAkhoutYwae: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.silverAkhoutYwae) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.silverAkhoutYwae)
          : 0.0,
      DatabaseHelper.silverAhtaeKyatthar: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.silverAhtaeKyatthar) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.silverAhtaeKyatthar)
          : 0.0,
      DatabaseHelper.silverAhtaePae: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.silverAhtaePae) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.silverAhtaePae)
          : 0.0,
      DatabaseHelper.silverAhtaeYwae: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.silverAhtaeYwae) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.silverAhtaeYwae)
          : 0.0,
      DatabaseHelper.silverPyitceeKyatthar: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.silverPyitceeKyatthar) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.silverPyitceeKyatthar)
          : 0.0,
      DatabaseHelper.silverPyitceePae: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.silverPyitceePae) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.silverPyitceePae)
          : 0.0,
      DatabaseHelper.silverPyitceeYwae: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.silverPyitceeYwae) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.silverPyitceeYwae)
          : 0.0,
      DatabaseHelper.inHandSuHtarTaw: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.inHandSuHtarTaw) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.inHandSuHtarTaw)
          : 0.0,
      DatabaseHelper.inHandPyitceeSold: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.inHandPyitceeSold) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.inHandPyitceeSold)
          : 0.0,
      DatabaseHelper.inHandPyitceeBorrow: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.inHandPyitceeBorrow) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.inHandPyitceeBorrow)
          : 0.0,
      DatabaseHelper.inHandForeignCurrency: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.inHandForeignCurrency) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.inHandForeignCurrency)
          : 0.0,
      DatabaseHelper.inHandContract: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.inHandContract) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.inHandContract)
          : 0.0,
      DatabaseHelper.inHandOther: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.inHandOther) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.inHandOther)
          : 0.0,
      DatabaseHelper.inBankInBank: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.inBankInBank) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.inBankInBank)
          : 0.0,
      DatabaseHelper.inBankThuMyarHlwae: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.inBankThuMyarHlwae) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.inBankThuMyarHlwae)
          : 0.0,
      DatabaseHelper.inBankSalary: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.inBankSalary) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.inBankSalary)
          : 0.0,
      DatabaseHelper.inBankOther: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.inBankOther) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.inBankOther)
          : 0.0,
      DatabaseHelper.thuMyarDebtPyitceeSold: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.thuMyarDebtPyitceeSold) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.thuMyarDebtPyitceeSold)
          : 0.0,
      DatabaseHelper.thuMyarDebtChayPay: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.thuMyarDebtChayPay) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.thuMyarDebtChayPay)
          : 0.0,
      DatabaseHelper.thuMyarDebtAttHtrTaw: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.thuMyarDebtAttHtrTaw) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.thuMyarDebtAttHtrTaw)
          : 0.0,
      DatabaseHelper.thuMyarDebtOther: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.thuMyarDebtOther) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.thuMyarDebtOther)
          : 0.0,
      DatabaseHelper.realEstateSellHouse: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.realEstateSellHouse) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.realEstateSellHouse)
          : 0.0,
      DatabaseHelper.realEstateSellEscort: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.realEstateSellEscort) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.realEstateSellEscort)
          : 0.0,
      DatabaseHelper.realEstateSellCar: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.realEstateSellCar) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.realEstateSellCar)
          : 0.0,
      DatabaseHelper.realEstateOther: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.realEstateOther) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.realEstateOther)
          : 0.0,
      DatabaseHelper.rawWearhouse: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.rawWearhouse) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.rawWearhouse)
          : 0.0,
      DatabaseHelper.rawHome: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.rawHome) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.rawHome)
          : 0.0,
      DatabaseHelper.rawShop: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.rawShop) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.rawShop)
          : 0.0,
      DatabaseHelper.rawOther: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.rawOther) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.rawOther)
          : 0.0,
      DatabaseHelper.finishWearhouse: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.finishWearhouse) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.finishWearhouse)
          : 0.0,
      DatabaseHelper.finishHome: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.finishHome) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.finishHome)
          : 0.0,
      DatabaseHelper.finishShop: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.finishShop) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.finishShop)
          : 0.0,
      DatabaseHelper.finishAnimal: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.finishAnimal) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.finishAnimal)
          : 0.0,
      DatabaseHelper.finishOther: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.finishOther) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.finishOther)
          : 0.0,
      DatabaseHelper.sate: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.sate) !=
              ''
          ? await SharedPreferenceUtil().getStringValuesSF(DatabaseHelper.sate)
          : 0.0,
      DatabaseHelper.thoe: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.thoe) !=
              ''
          ? await SharedPreferenceUtil().getStringValuesSF(DatabaseHelper.thoe)
          : 0.0,
      DatabaseHelper.kalaout: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.kalaout) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.kalaout)
          : 0.0,
      DatabaseHelper.kywae: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.kywae) !=
              ''
          ? await SharedPreferenceUtil().getStringValuesSF(DatabaseHelper.kywae)
          : 0.0,
      DatabaseHelper.nwar: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.nwar) !=
              ''
          ? await SharedPreferenceUtil().getStringValuesSF(DatabaseHelper.nwar)
          : 0.0,
      DatabaseHelper.minusDebtMahur: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.minusDebtMahur) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.minusDebtMahur)
          : 0.0,
      DatabaseHelper.minusDebt: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.minusDebt) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.minusDebt)
          : 0.0,
      DatabaseHelper.minusSukyae: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.minusSukyae) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.minusSukyae)
          : 0.0,
      DatabaseHelper.minusMeterBill: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.minusMeterBill) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.minusMeterBill)
          : 0.0,
      DatabaseHelper.minusPaybill: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.minusPaybill) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.minusPaybill)
          : 0.0,
      DatabaseHelper.minusPaySalary: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.minusPaySalary) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.minusPaySalary)
          : 0.0,
      DatabaseHelper.minusPayRent: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.minusPayRent) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.minusPayRent)
          : 0.0,
      DatabaseHelper.minusBuyGoodPay: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.minusBuyGoodPay) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.minusBuyGoodPay)
          : 0.0,
      DatabaseHelper.minusPreZakat: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.minusPreZakat) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.minusPreZakat)
          : 0.0,
      DatabaseHelper.createdAt: DateTime.now().toString(),
      DatabaseHelper.updatedAt: DateTime.now().toString(),
      DatabaseHelper.goldRate: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.goldRate) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.goldRate)
          : 0.0,
      DatabaseHelper.silverRate: await SharedPreferenceUtil()
                  .getStringValuesSF(DatabaseHelper.silverRate) !=
              ''
          ? await SharedPreferenceUtil()
              .getStringValuesSF(DatabaseHelper.silverRate)
          : 0.0,
    };
  }

  saveDB() {
    dbHelper
        .insertZakat(saveData)
        .then((value) => {})
        .catchError((onError) => print(onError.toString()));
  }
}
