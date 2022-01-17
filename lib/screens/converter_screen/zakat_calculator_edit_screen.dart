import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/db/db_helper.dart';
import 'package:masalah/model/result.dart';
import 'package:masalah/model/zakat.dart';
import 'package:masalah/network/remote_data_source.dart';
import 'package:masalah/reusable_widget/app_text.dart';
import 'package:masalah/util/zakat_calculator_util.dart';

import 'zakat_list_screen.dart';

class ZakatCalculatorEdit extends StatefulWidget {
  const ZakatCalculatorEdit({Key? key, required this.zakatId})
      : super(key: key);

  final String zakatId;
  @override
  _ZakatCalculatorEditState createState() => _ZakatCalculatorEditState();
}

class _ZakatCalculatorEditState extends State<ZakatCalculatorEdit> {
  GlobalKey _globalKey = new GlobalKey();
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  final dbHelper = DatabaseHelper.instance;

  late Map<String, String> _result = {"result": "", "netWorth": ""};
  String _resultSateThoe = "";
  String _resultKywaeNwar = "";
  String _resultKalaout = "";
  bool _optionAuto = true;

  final goldAkhoutKyatthar = TextEditingController();
  final goldAkhoutPae = TextEditingController();
  final goldAkhoutYwae = TextEditingController();
  final goldAhtaeKyatthar = TextEditingController();
  final goldAhtaePae = TextEditingController();
  final goldAhtaeYwae = TextEditingController();
  final goldPyitceeKyatthar = TextEditingController();
  final goldPyitceePae = TextEditingController();
  final goldPyitceeYwae = TextEditingController();
  final whiteSilverAkhoutKyatthar = TextEditingController();
  final whiteSilverAkhoutPae = TextEditingController();
  final whiteSilverAkhoutYwae = TextEditingController();
  final whiteSilverAhtaeKyatthar = TextEditingController();
  final whiteSilverAhtaePae = TextEditingController();
  final whiteSilverAhtaeYwae = TextEditingController();
  final whiteSilverPyitceeKyatthar = TextEditingController();
  final whiteSilverPyitceePae = TextEditingController();
  final whiteSilverPyitceeYwae = TextEditingController();
  final silverAkhoutKyatthar = TextEditingController();
  final silverAkhoutPae = TextEditingController();
  final silverAkhoutYwae = TextEditingController();
  final silverAhtaeKyatthar = TextEditingController();
  final silverAhtaePae = TextEditingController();
  final silverAhtaeYwae = TextEditingController();
  final silverPyitceeKyatthar = TextEditingController();
  final silverPyitceePae = TextEditingController();
  final silverPyitceeYwae = TextEditingController();
  final inHandSuHtarTaw = TextEditingController();
  final inHandPyitceeSold = TextEditingController();
  final inHandPyitceeBorrow = TextEditingController();
  final inHandForeignCurrency = TextEditingController();
  final inHandContract = TextEditingController();
  final inHandOther = TextEditingController();
  final inBankInBank = TextEditingController();
  final inBankThuMyarHlwae = TextEditingController();
  final inBankSalary = TextEditingController();
  final inBankOther = TextEditingController();
  final thuMyarDebtPyitceeSold = TextEditingController();
  final thuMyarDebtChayPay = TextEditingController();
  final thuMyarDebtAttHtrTaw = TextEditingController();
  final thuMyarDebtOther = TextEditingController();
  final realEstateSellHouse = TextEditingController();
  final realEstateSellEscort = TextEditingController();
  final realEstateSellCar = TextEditingController();
  final realEstateOther = TextEditingController();
  final rawWearhouse = TextEditingController();
  final rawHome = TextEditingController();
  final rawShop = TextEditingController();
  final rawOther = TextEditingController();
  final finishWearhouse = TextEditingController();
  final finishHome = TextEditingController();
  final finishShop = TextEditingController();
  final finishAnimal = TextEditingController();
  final finishOther = TextEditingController();
  final minusDebtMahur = TextEditingController();
  final minusDebt = TextEditingController();
  final minusSukyae = TextEditingController();
  final minusMeterBill = TextEditingController();
  final minusPaybill = TextEditingController();
  final minusPaySalary = TextEditingController();
  final minusPayRent = TextEditingController();
  final minusBuyGoodPay = TextEditingController();
  final minusPreZakat = TextEditingController();
  final kalaout = TextEditingController();
  final kywae = TextEditingController();
  final nwar = TextEditingController();
  final sate = TextEditingController();
  final thoe = TextEditingController();
  final goldPrice = TextEditingController();
  final silverPrice = TextEditingController();

  final RemoteDataSource _apiResponse = RemoteDataSource();

  double goldRate = 0.0;
  double silverRate = 0.0;
  double usdRate = 0.0;

  @override
  void initState() {
    _apiResponse.getUSDRate().then((value) {
      print("usdddd");
      print(value);
      value = value.replaceAll(',', '');
      usdRate = double.parse(value);
    });
    _apiResponse.getGoldRate().then((value) => {goldRate = value});
    _apiResponse.getSilverRate().then((value) => {silverRate = value});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.primaryText, //change your color here
        ),
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: AppColors.bgColor,
        titleTextStyle: TextStyle(fontSize: 26),
        title: BoldText(
          data: "Zakat Calculator",
          color: AppColors.primaryText,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: AppColors.primaryText,
            ),
            tooltip: 'More',
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ZakatListScreen()));
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: dbHelper.queryZakatById(widget.zakatId),
        builder: (BuildContext context, AsyncSnapshot<Result> snapshot) {
          if (snapshot.data is SuccessState) {
            Zakat zakats = (snapshot.data as SuccessState).value;

            goldAkhoutKyatthar.text = zakats.goldAkhoutKyatthar.toString();
            goldAkhoutPae.text = zakats.goldAkhoutPae.toString();
            goldAkhoutYwae.text = zakats.goldAkhoutYwae.toString();
            goldAhtaeKyatthar.text = zakats.goldAhtaeKyatthar.toString();
            goldAhtaePae.text = zakats.goldAhtaePae.toString();
            goldAhtaeYwae.text = zakats.goldAhtaeYwae.toString();
            goldPyitceeKyatthar.text = zakats.goldPyitceeKyatthar.toString();
            goldPyitceePae.text = zakats.goldPyitceePae.toString();
            goldPyitceeYwae.text = zakats.goldPyitceeYwae.toString();
            whiteSilverAkhoutKyatthar.text =
                zakats.whiteSilverAkhoutKyatthar.toString();
            whiteSilverAkhoutPae.text = zakats.whiteSilverAkhoutPae.toString();
            whiteSilverAkhoutYwae.text =
                zakats.whiteSilverAkhoutYwae.toString();
            whiteSilverAhtaeKyatthar.text =
                zakats.whiteSilverAhtaeKyatthar.toString();
            whiteSilverAhtaePae.text = zakats.whiteSilverAhtaePae.toString();
            whiteSilverAhtaeYwae.text = zakats.whiteSilverAhtaeYwae.toString();
            whiteSilverPyitceeKyatthar.text =
                zakats.whiteSilverPyitceeKyatthar.toString();
            whiteSilverPyitceePae.text =
                zakats.whiteSilverPyitceePae.toString();
            whiteSilverPyitceeYwae.text =
                zakats.whiteSilverPyitceeYwae.toString();
            silverAkhoutKyatthar.text = zakats.silverAkhoutKyatthar.toString();
            silverAkhoutPae.text = zakats.silverAkhoutPae.toString();
            silverAkhoutYwae.text = zakats.silverAkhoutYwae.toString();
            silverAhtaeKyatthar.text = zakats.silverAhtaeKyatthar.toString();
            silverAhtaePae.text = zakats.silverAhtaePae.toString();
            silverAhtaeYwae.text = zakats.silverAhtaeYwae.toString();
            silverPyitceeKyatthar.text =
                zakats.silverPyitceeKyatthar.toString();
            silverPyitceePae.text = zakats.silverPyitceePae.toString();
            silverPyitceeYwae.text = zakats.silverPyitceeYwae.toString();
            inHandSuHtarTaw.text = zakats.inHandSuHtarTaw.toString();
            inHandPyitceeSold.text = zakats.inHandPyitceeSold.toString();
            inHandPyitceeBorrow.text = zakats.inHandPyitceeBorrow.toString();
            inHandForeignCurrency.text =
                zakats.inHandForeignCurrency.toString();
            inHandContract.text = zakats.inHandContract.toString();
            inHandOther.text = zakats.inHandOther.toString();
            inBankInBank.text = zakats.inBankInBank.toString();
            inBankThuMyarHlwae.text = zakats.inBankThuMyarHlwae.toString();
            inBankSalary.text = zakats.inBankSalary.toString();
            inBankOther.text = zakats.inBankOther.toString();
            thuMyarDebtPyitceeSold.text =
                zakats.thuMyarDebtPyitceeSold.toString();
            thuMyarDebtChayPay.text = zakats.thuMyarDebtChayPay.toString();
            thuMyarDebtAttHtrTaw.text = zakats.thuMyarDebtAttHtrTaw.toString();
            thuMyarDebtOther.text = zakats.thuMyarDebtOther.toString();
            realEstateSellHouse.text = zakats.realEstateSellHouse.toString();
            realEstateSellEscort.text = zakats.realEstateSellEscort.toString();
            realEstateSellCar.text = zakats.realEstateSellCar.toString();
            realEstateOther.text = zakats.realEstateOther.toString();
            rawWearhouse.text = zakats.rawWearhouse.toString();
            rawHome.text = zakats.rawHome.toString();
            rawShop.text = zakats.rawShop.toString();
            rawOther.text = zakats.rawOther.toString();
            finishWearhouse.text = zakats.finishWearhouse.toString();
            finishHome.text = zakats.finishHome.toString();
            finishShop.text = zakats.finishShop.toString();
            finishAnimal.text = zakats.finishAnimal.toString();
            finishOther.text = zakats.finishOther.toString();
            minusDebtMahur.text = zakats.minusDebtMahur.toString();
            minusDebt.text = zakats.minusDebt.toString();
            minusSukyae.text = zakats.minusSukyae.toString();
            minusMeterBill.text = zakats.minusMeterBill.toString();
            minusPaybill.text = zakats.minusPaybill.toString();
            minusPaySalary.text = zakats.minusPaySalary.toString();
            minusPayRent.text = zakats.minusPayRent.toString();
            minusBuyGoodPay.text = zakats.minusBuyGoodPay.toString();
            minusPreZakat.text = zakats.minusPreZakat.toString();
            kalaout.text = zakats.kalaout.toString();
            kywae.text = '0';
            nwar.text = '0';
            sate.text = zakats.sate.toString();
            thoe.text = zakats.thoe.toString();
            goldPrice.text = zakats.goldRate.toString();
            silverPrice.text = zakats.silverRate.toString();

            return Stepper(
              type: StepperType.horizontal,
              physics: ScrollPhysics(),
              currentStep: _currentStep,
              // onStepTapped: (step) => tapped(step),
              onStepContinue: continued,
              onStepCancel: cancel,
              controlsBuilder: (BuildContext context,
                  {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
                return Row(
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(right: 4.0),
                        width: 1000.0,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.primaryText),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          child: Text('PREVIOUS'),
                          onPressed: onStepCancel,
                        ),
                      ),
                      flex: 1,
                    ),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(left: 4.0),
                        width: 1000.0,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.primaryText),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          child: Text('NEXT'),
                          onPressed: onStepContinue,
                        ),
                      ),
                      flex: 1,
                    ),
                  ],
                );
              },
              steps: <Step>[
                Step(
                  title: RegularText(
                    data: _currentStep == 0 ? 'Step 1' : '',
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldText(
                        data: "ရွှေ",
                        color: AppColors.primaryText,
                        fontSize: 22.0,
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.primaryText,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RegularText(
                              fontSize: 14,
                              color: AppColors.white,
                              data:
                                  "ရွှေအထည်တိုင်းကိုထည့်တွက်ရမည်။ ဝတ်ထားသည်ဖြစ်စေ၊သိမ်းဆည်းထားသည်ဖြစ်စေ၊ မိမိပိုင်ဆိုင်သမျှရွှေထည်များ၏အလေးချိန်ထည့်ပေးပါ။သွားတု၊နာရီ၊ဘောပင်၊ကြယ်သီး၊ဘီး၊ဘီးကုတ်အစရှိသောအရာများတွင်ပါဝင်သောရွှေပမာဏကိုထည့်ရေးပါ။",
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အခေါက်",
                                color: AppColors.primaryText,
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              new Row(
                                children: <Widget>[
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ကျပ်သား',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller: goldAkhoutKyatthar,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ပဲ',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller: goldAkhoutPae,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ရွှေး',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller: goldAkhoutYwae,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                ],
                              ),
                            ],
                          )),
                      SizedBox(height: 16.0),
                      Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အထည်",
                                color: AppColors.primaryText,
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              new Row(
                                children: <Widget>[
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ကျပ်သား',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller: goldAhtaeKyatthar,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ပဲ',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller: goldAhtaePae,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ရွှေး',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller: goldAhtaeYwae,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                ],
                              ),
                            ],
                          )),
                      SizedBox(height: 16.0),
                      Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အသုံးဆောင်ပစ္စည်း",
                                color: AppColors.primaryText,
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              new Row(
                                children: <Widget>[
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ကျပ်သား',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller: goldPyitceeKyatthar,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ပဲ',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller: goldPyitceePae,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ရွှေး',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller: goldPyitceeYwae,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                ],
                              ),
                            ],
                          )),
                      SizedBox(height: 24.0),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 0
                      ? StepState.complete
                      : StepState.indexed,
                ),
                Step(
                  title: RegularText(
                    data: _currentStep == 1 ? 'Step 2' : '',
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldText(
                        data: "ရွှေဖြူ",
                        color: AppColors.primaryText,
                        fontSize: 22.0,
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.primaryText,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RegularText(
                              fontSize: 14,
                              color: AppColors.white,
                              data:
                                  "ရွှေဖြူ (White Gold) ကိုရွှေဖြူဟုခေါ်တွင်သည်ဖြစ်စေ၊ပလာတီနမ်ဟုခေါ်တွင်သည်ဖြစ်စေ၊ ရွှေဖြူသည်ရွှေသာဖြစ်သည်။ထို့ကြောင့်ရွှေဖြူတွင်ဇကားသ်ရှိသည်။ သို့သောပလာတီနမ်(စစ်စစ်)သည်အခြားသတ္တုဖြစ်သဖြင့်ပလာတီနမ်တွင်ဇကားသ်မရှိပါ။ ",
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အခေါက်",
                                color: AppColors.primaryText,
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              new Row(
                                children: <Widget>[
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ကျပ်သား',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller:
                                                    whiteSilverAkhoutKyatthar,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ပဲ',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller:
                                                    whiteSilverAkhoutPae,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ရွှေး',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller:
                                                    whiteSilverAkhoutYwae,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                ],
                              ),
                            ],
                          )),
                      SizedBox(height: 16.0),
                      Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အထည်",
                                color: AppColors.primaryText,
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              new Row(
                                children: <Widget>[
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ကျပ်သား',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller:
                                                    whiteSilverAhtaeKyatthar,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ပဲ',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller: whiteSilverAhtaePae,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ရွှေး',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller:
                                                    whiteSilverAhtaeYwae,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                ],
                              ),
                            ],
                          )),
                      SizedBox(height: 16.0),
                      Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အသုံးဆောင်ပစ္စည်း",
                                color: AppColors.primaryText,
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              new Row(
                                children: <Widget>[
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ကျပ်သား',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller:
                                                    whiteSilverPyitceeKyatthar,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ပဲ',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller:
                                                    whiteSilverPyitceePae,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ရွှေး',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller:
                                                    whiteSilverPyitceeYwae,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                ],
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 24.0,
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 1,
                  state: _currentStep >= 1
                      ? StepState.complete
                      : StepState.indexed,
                ),
                Step(
                  title: RegularText(
                    data: _currentStep == 2 ? 'Step 3' : '',
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldText(
                        data: "ငွေ",
                        color: AppColors.primaryText,
                        fontSize: 22.0,
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.primaryText,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RegularText(
                              fontSize: 14,
                              color: AppColors.white,
                              data:
                                  "ရွှေအထည်တိုင်းကိုထည့်တွက်ရမည်။ ဝတ်ထားသည်ဖြစ်စေ၊သိမ်းဆည်းထားသည်ဖြစ်စေ၊ မိမိပိုင်ဆိုင်သမျှရွှေထည်များ၏အလေးချိန်ထည့်ပေးပါ။သွားတု၊နာရီ၊ဘောပင်၊ကြယ်သီး၊ဘီး၊ဘီးကုတ်အစရှိသောအရာများတွင်ပါဝင်သောရွှေပမာဏကိုထည့်ရေးပါ။",
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အခေါက်",
                                color: AppColors.primaryText,
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              new Row(
                                children: <Widget>[
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ကျပ်သား',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller:
                                                    silverAkhoutKyatthar,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ပဲ',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller: silverAkhoutPae,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ရွှေး',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller: silverAkhoutYwae,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                ],
                              ),
                            ],
                          )),
                      SizedBox(height: 16.0),
                      Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အထည်",
                                color: AppColors.primaryText,
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              new Row(
                                children: <Widget>[
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ကျပ်သား',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller: silverAhtaeKyatthar,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ပဲ',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller: silverAhtaePae,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ရွှေး',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller: silverAhtaeYwae,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                ],
                              ),
                            ],
                          )),
                      SizedBox(height: 16.0),
                      Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အသုံးဆောင်ပစ္စည်း",
                                color: AppColors.primaryText,
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              new Row(
                                children: <Widget>[
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ကျပ်သား',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller:
                                                    silverPyitceeKyatthar,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ပဲ',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller: silverPyitceePae,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  new Flexible(
                                    child: Container(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryText,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0)),
                                              ),
                                              child: Center(
                                                child: RegularText(
                                                    data: 'ရွှေး',
                                                    fontSize: 10.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                              child: TextField(
                                                controller: silverPyitceeYwae,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      bottom: 30 /
                                                          2, // HERE THE IMPORTANT PART
                                                    )),
                                                style: TextStyle(
                                                  height: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                ],
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 24.0,
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 2,
                  state: _currentStep >= 2
                      ? StepState.complete
                      : StepState.indexed,
                ),
                Step(
                  title: RegularText(
                    data: _currentStep == 3 ? 'Step 4' : '',
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                  content: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.primaryText,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoldText(
                              fontSize: 14,
                              color: AppColors.white,
                              data:
                                  "အိမ်ငှားရန်စပေါ်တင်ထားသောငွေနှင့်ပတ်သက်ပြီးစစ်မှန်သောမုဖ်သီတစ်ပါးအားကိုယ့်အခြေအနေအကြောင်းစုံတင်ပြကာမတ်စ်အလဟ်မေးမြန်းပြီးအကယ်၍ထည့်တွက်ရမည်ဆိုပါက'အခြား'ဆိုသောအကွက်တွင်ထည့်တွက်ပါ။ ပိုင်ဆိုင်ထားသောအွန်လိုင်းပိုက်ဆံများနှင့်အခြားအွန်လိုင်းပိုင်ဆိုင်မှုများကိုလည်းထည့်တွက်ရပါမည်။",
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoldText(
                              data: "လက်ထဲရှိ",
                              color: AppColors.primaryText,
                            ),
                            TextFormField(
                              controller: inHandSuHtarTaw,
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(labelText: 'စုဆောင်းထားသော'),
                            ),
                            TextFormField(
                              controller: inHandPyitceeSold,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: 'ပစ္စည်းရောင်း၍ရထားသော'),
                            ),
                            TextFormField(
                                controller: inHandPyitceeBorrow,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: 'ပစ္စည်းငှားရမ်းခရထားသော')),
                            TextFormField(
                                controller: inHandForeignCurrency,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: 'နိုင်ငံခြားငွေ(ကျပ်ဖြင့်)')),
                            TextFormField(
                                controller: inHandContract,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText:
                                        'ငွေချေးစာချုပ်၊ချက်လက်မှတ်...')),
                            TextFormField(
                                controller: inHandOther,
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(labelText: 'အခြား')),
                            SizedBox(
                              height: 8.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoldText(
                              data: "ဘဏ်ထဲရှိ",
                              color: AppColors.primaryText,
                            ),
                            TextFormField(
                              controller: inBankInBank,
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(labelText: 'ဘဏ်ထဲထည့်ထားသော'),
                            ),
                            TextFormField(
                              controller: inBankThuMyarHlwae,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: 'သူများလွှဲပေးထားသော'),
                            ),
                            TextFormField(
                                controller: inBankSalary,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: 'လစာ၊ပင်စင်တစ်ခုခုရထားသော')),
                            TextFormField(
                                controller: inBankOther,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: 'အခြား (Digital Money, etc)')),
                            SizedBox(
                              height: 8.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoldText(
                              data: "သူများကိုပေးထားသောအကြွေး",
                              color: AppColors.primaryText,
                            ),
                            TextFormField(
                              controller: thuMyarDebtPyitceeSold,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: 'ပစ္စည်းရောင်း၍ရရန်ရှိသော'),
                            ),
                            TextFormField(
                              controller: thuMyarDebtChayPay,
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(labelText: 'ချေးပေးထားသော'),
                            ),
                            TextFormField(
                                controller: thuMyarDebtAttHtrTaw,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: 'တစ်ဦးတစ်ယောက်ထံအပ်နှံထားသော')),
                            TextFormField(
                                controller: thuMyarDebtOther,
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(labelText: 'အခြား')),
                            SizedBox(
                              height: 8.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 3,
                  state: _currentStep >= 3
                      ? StepState.complete
                      : StepState.indexed,
                ),
                Step(
                  title: RegularText(
                    data: _currentStep == 4 ? 'Step 5' : '',
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                  content: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.primaryText,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoldText(
                              fontSize: 14,
                              color: AppColors.white,
                              data:
                                  "ရောင်းရန်ရည်ရွယ်ထားသောပစ္စည်းဟူသမျှတွင်ဇကားသ်တာဝန်ရှိပါသည်။ ခုချက်ချင်းရောင်းရန်ရည်ရွယ်ထားသည်ဖြစ်စေ၊ ဈေးကောင်းရမည့်အချိန်ရောင်းရန်ရည်ရွယ်ပြီးယခုကိုယ်တိုင်အသုံးပြုနေသည်ဖြစ်စေ၊ အားလုံးကိုထည့်တွက်ရမည်။",
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoldText(
                              data: "အိမ်၊ခြံ၊မြေ",
                              color: AppColors.primaryText,
                            ),
                            TextFormField(
                              controller: realEstateSellHouse,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: 'ရောင်းရန်ရှိသောအိမ်'),
                            ),
                            TextFormField(
                              controller: realEstateSellEscort,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: 'ရောင်းရန်ရှိသောခြံ/မြေ'),
                            ),
                            TextFormField(
                                controller: realEstateSellCar,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: 'ရောင်းရန်ရှိသောကား')),
                            TextFormField(
                                controller: realEstateOther,
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(labelText: 'အခြား')),
                            SizedBox(
                              height: 8.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoldText(
                              data: "ကုန်ကြမ်းများ",
                              color: AppColors.primaryText,
                            ),
                            TextFormField(
                              controller: rawWearhouse,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: 'ဂိုထောင်တွင်ရှိသော'),
                            ),
                            TextFormField(
                              controller: rawHome,
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(labelText: 'အိမ်တွင်ရှိသော'),
                            ),
                            TextFormField(
                                controller: rawShop,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: 'ဆိုင်တွင်ရှိသော')),
                            TextFormField(
                                controller: rawOther,
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(labelText: 'အခြား')),
                            SizedBox(
                              height: 8.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoldText(
                              data: "ကုန်ချောများ",
                              color: AppColors.primaryText,
                            ),
                            TextFormField(
                              controller: finishWearhouse,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: 'ဂိုထောင်တွင်ရှိသော'),
                            ),
                            TextFormField(
                              controller: finishHome,
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(labelText: 'အိမ်တွင်ရှိသော'),
                            ),
                            TextFormField(
                                controller: finishShop,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: 'ဆိုင်တွင်ရှိသော')),
                            TextFormField(
                                controller: finishAnimal,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText:
                                        'မွေးမြူရေးခြံထဲရှိရောင်းရန်သားကောင်များ')),
                            TextFormField(
                                controller: finishOther,
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(labelText: 'အခြား')),
                            SizedBox(
                              height: 8.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 4,
                  state: _currentStep >= 4
                      ? StepState.complete
                      : StepState.indexed,
                ),
                Step(
                  title: RegularText(
                    data: _currentStep == 5 ? 'Step 6' : '',
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                  content: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.primaryText,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoldText(
                              fontSize: 14,
                              color: AppColors.white,
                              data:
                                  "သားကောင်၏ဇကားသ်နှင့်ပတ်သက်၍သိသင့်သိထိုက်သောအရာများ \n (၁) ရောင်းဝယ်ဖောက်ကားရန်မွေးမြူထားသော၊တစ်ချိန်ချိန်တွင်ပြန်ရောင်းရန်ဆန္ဒရှိသောသားကောင်များကိုဤစာရင်းတွင်မထည့်သွင်းရပါ။ ထိုသားကောင်းများ၏ဈေးနှုန်းကိုအရောင်းအဝယ်ကုန်ပစ္စည်းတွင်ထည့်၍တွက်ပါ။ \n (၂) နို့ရယူရန်သို့မဟုတ်ဝါသနာအရမွေးမြူထား၍ရောင်းရန်ဆန္ဒမရှိသောသားကောင်များကိုသာဤနေရာတွင်ထည့်တွက်ပါ။ \n (၃) မွေးမြူထားသောသားကောင်သည်လွန်ခဲ့သည့်တစ်နှစ်တာကာလတွင် (၆)လကျော် စားကျက်တွင်ကျက်စားထားသောသားကောင်ဖြစ်ရမည်။ အကယ်၍ (၆)လတိတိ သို့မဟုတ် (၆) လအထက်ကာလတွင်အိမ်တွင်း၌အစာဝယ်ယူကျွေးမွေးခဲ့ပါကထိုသားကောင်ကိုထည့်မတွက်ရပါ။ \n (၄) ကုလားအုပ်မ ဇကားသ်ထိုက်သောပုံစံများတွင်ကုလားအုပ်မသာပေးရမည်။သို့မဟုတ်ကုလားအုပ်မ၏တန်ဖိုးနှင့်ညီမျှသောတန်ဖိုးရှိကုလားအုပ်ပေးရမည်။ ကုလားအုပ်မတစ်ကောင်အစားကုလားအုပ်တစ်ကောင်ပေးခွင့်မရှိပါ။ \n (၅) ကုလားအုပ် မှအပကျန်သားကောင်အမျိုးအစားများတွင် အထီးအမ မခွဲခြားထားပါ။ ကြိုက်နှစ်သက်ရာပေးခွင့်ရှိသည်။ \n (၆) ဇကားသ်တွင်ပေးရသောဆိတ်သည်အနည်းဆုံးအသက်တစ်နှစ်ပြည့်ရမည်။ ",
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoldText(
                              data: "ကုလားအုပ်",
                              color: AppColors.primaryText,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: kalaout,
                              decoration:
                                  InputDecoration(labelText: 'ကုလားအုပ်'),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoldText(
                              data: "ကျွဲ၊နွား",
                              color: AppColors.primaryText,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: kywae,
                              decoration: InputDecoration(labelText: 'ကျွဲ'),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: nwar,
                              decoration: InputDecoration(labelText: 'နွား'),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoldText(
                              data: "ဆိတ်၊သိုး",
                              color: AppColors.primaryText,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: sate,
                              decoration: InputDecoration(labelText: 'ဆိတ်'),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: thoe,
                              decoration: InputDecoration(labelText: 'သိုး'),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 5,
                  state: _currentStep >= 5
                      ? StepState.complete
                      : StepState.indexed,
                ),
                Step(
                  title: RegularText(
                    data: _currentStep == 6 ? 'Step 7' : '',
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                  content: Column(
                    children: [
                      // Container(
                      //   padding: EdgeInsets.all(16),
                      //   decoration: BoxDecoration(
                      //     color: AppColors.bgBtn,
                      //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      //   ),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [

                      //       BoldText(
                      //         fontSize: 14,
                      //         color: AppColors.white,
                      //         data:
                      //             "lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum",
                      //       )
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: minusDebtMahur,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: 'ဇနီးကိုမပေးရသေးသောမဟ်ရ်'),
                            ),
                            TextFormField(
                              controller: minusDebt,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: 'သူများကိုပေးဆပ်ရမည့်အကြွေး'),
                            ),
                            TextFormField(
                                controller: minusSukyae,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText:
                                        'စုကြေးရရှိပြီးပေးသွင်းရန်ကျန်ငွေပေါင်း')),
                            TextFormField(
                                controller: minusMeterBill,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: 'ပေးဆောင်ရန်ကျန်သောမီတာခ')),
                            TextFormField(
                                controller: minusPaybill,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText:
                                        'ပေးဆောင်ရန်ကျန်သောအဖိုးအခများ')),
                            TextFormField(
                                controller: minusPaySalary,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText:
                                        'ဝန်ထမ်းများကိုပေးရန်ကျန်သောလစာများ')),
                            TextFormField(
                                controller: minusPayRent,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText:
                                        'ပေးဆောင်ရန်ကျန်သောငှားရမ်းခများ')),
                            TextFormField(
                                controller: minusBuyGoodPay,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText:
                                        'ပစ္စည်းဝယ်ပြီးပေးချေရန်ကျန်သောအကြွေး')),
                            TextFormField(
                                controller: minusPreZakat,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText:
                                        'ယခင်နှစ်များ၏မပေးရသေးသောဇကားသ်')),
                            SizedBox(
                              height: 8.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 6,
                  state: _currentStep >= 6
                      ? StepState.complete
                      : StepState.indexed,
                ),
                Step(
                  title: RegularText(
                    data: _currentStep == 7 ? 'Step 8' : '',
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          RegularText(
                            data: 'Manual',
                            color: AppColors.primaryText,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          CupertinoSwitch(
                            value: _optionAuto,
                            onChanged: (value) {
                              setState(() {
                                _optionAuto = value;
                              });
                            },
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          RegularText(
                            data: 'Auto',
                            color: AppColors.primaryText,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      !_optionAuto
                          ? Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BoldText(
                                        data: "ရွှေဈေးစုံစမ်း၍ထည့်ရန်",
                                        color: AppColors.primaryText,
                                      ),
                                      TextFormField(
                                        controller: goldPrice,
                                        keyboardType: TextInputType.number,
                                        decoration:
                                            InputDecoration(labelText: ' '),
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 24.0,
                                ),
                                Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BoldText(
                                        data: "ငွေဈေးစုံစမ်း၍ထည့်ရန်",
                                        color: AppColors.primaryText,
                                      ),
                                      TextFormField(
                                        controller: silverPrice,
                                        keyboardType: TextInputType.number,
                                        decoration:
                                            InputDecoration(labelText: ' '),
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 24.0,
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Row(
                                  children: [
                                    RegularText(
                                      data: "Gold Rate",
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    BoldText(
                                      data: ZakatCalculatorUtil()
                                          .getRate(goldRate, usdRate)
                                          .toString(),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    RegularText(
                                      data: "Silver Rate",
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    BoldText(
                                      data: ZakatCalculatorUtil()
                                          .getRate(silverRate, usdRate)
                                          .toString(),
                                    )
                                  ],
                                )
                              ],
                            ),
                      SizedBox(
                        height: 24.0,
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 7,
                  state: _currentStep >= 7
                      ? StepState.complete
                      : StepState.indexed,
                ),
                Step(
                  title: RegularText(
                    data: _currentStep == 8 ? 'Step 9' : '',
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                  content: RepaintBoundary(
                    key: _globalKey,
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
                          SizedBox(
                            width: 16,
                          ),
                          BoldText(
                            data: _result['result']! +
                                "\n" +
                                _resultKalaout +
                                "\n" +
                                _resultKywaeNwar +
                                "\n" +
                                _resultSateThoe,
                          )
                        ],
                      ),
                    ),
                  ),
                  isActive: _currentStep >= 8,
                  state: _currentStep >= 8
                      ? StepState.complete
                      : StepState.indexed,
                ),
              ],
            );
          } else if (snapshot.data is ErrorState) {
            String errorMessage = (snapshot.data as ErrorState).msg;
            return Text(errorMessage);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    final isLastStep = _currentStep == 8;

    if (isLastStep) {
      // logic here;
    }

    if (_currentStep == 7) {
      if (_optionAuto) {
        goldPrice.text =
            ZakatCalculatorUtil().getRate(goldRate, usdRate).toString();
        silverPrice.text =
            ZakatCalculatorUtil().getRate(silverRate, usdRate).toString();
      } else {}
      setState(() {
        _result = ZakatCalculatorUtil().calcFinalZakatAmount(
            ZakatCalculatorUtil().getTotalGoldPlatinum(
              double.parse(goldPrice.text == '' ? '0.0' : goldPrice.text),
              double.parse(goldAkhoutKyatthar.text == ''
                  ? '0.0'
                  : goldAkhoutKyatthar.text),
              double.parse(
                  goldAkhoutPae.text == '' ? '0.0' : goldAkhoutPae.text),
              double.parse(
                  goldAkhoutYwae.text == '' ? '0.0' : goldAkhoutYwae.text),
              double.parse(goldAhtaeKyatthar.text == ''
                  ? '0.0'
                  : goldAhtaeKyatthar.text),
              double.parse(goldAhtaePae.text == '' ? '0.0' : goldAhtaePae.text),
              double.parse(
                  goldAhtaeYwae.text == '' ? '0.0' : goldAhtaeYwae.text),
              double.parse(goldPyitceeKyatthar.text == ''
                  ? '0.0'
                  : goldPyitceeKyatthar.text),
              double.parse(
                  goldPyitceePae.text == '' ? '0.0' : goldPyitceePae.text),
              double.parse(
                  goldPyitceeYwae.text == '' ? '0.0' : goldPyitceeYwae.text),
              double.parse(whiteSilverAkhoutKyatthar.text == ''
                  ? '0.0'
                  : whiteSilverAkhoutKyatthar.text),
              double.parse(whiteSilverAkhoutPae.text == ''
                  ? '0.0'
                  : whiteSilverAkhoutPae.text),
              double.parse(whiteSilverAkhoutYwae.text == ''
                  ? '0.0'
                  : whiteSilverAkhoutYwae.text),
              double.parse(whiteSilverAhtaeKyatthar.text == ''
                  ? '0.0'
                  : whiteSilverAhtaeKyatthar.text),
              double.parse(whiteSilverAhtaePae.text == ''
                  ? '0.0'
                  : whiteSilverAhtaePae.text),
              double.parse(whiteSilverAhtaeYwae.text == ''
                  ? '0.0'
                  : whiteSilverAhtaeYwae.text),
              double.parse(whiteSilverPyitceeKyatthar.text == ''
                  ? '0.0'
                  : whiteSilverPyitceeKyatthar.text),
              double.parse(whiteSilverPyitceePae.text == ''
                  ? '0.0'
                  : whiteSilverPyitceePae.text),
              double.parse(whiteSilverPyitceeYwae.text == ''
                  ? '0.0'
                  : whiteSilverPyitceeYwae.text),
            ),
            ZakatCalculatorUtil().getTotalSilverMoneyOther(
                double.parse(silverPrice.text == '' ? '0.0' : silverPrice.text),
                double.parse(silverAkhoutKyatthar.text == ''
                    ? '0.0'
                    : silverAkhoutKyatthar.text),
                double.parse(
                    silverAkhoutPae.text == '' ? '0.0' : silverAkhoutPae.text),
                double.parse(silverAkhoutYwae.text == ''
                    ? '0.0'
                    : silverAkhoutYwae.text),
                double.parse(silverAhtaeKyatthar.text == ''
                    ? '0.0'
                    : silverAhtaeKyatthar.text),
                double.parse(
                    silverAhtaePae.text == '' ? '0.0' : silverAhtaePae.text),
                double.parse(
                    silverAhtaeYwae.text == '' ? '0.0' : silverAhtaeYwae.text),
                double.parse(silverPyitceeKyatthar.text == ''
                    ? '0.0'
                    : silverPyitceeKyatthar.text),
                double.parse(silverPyitceePae.text == ''
                    ? '0.0'
                    : silverPyitceePae.text),
                double.parse(silverPyitceeYwae.text == ''
                    ? '0.0'
                    : silverPyitceeYwae.text),
                double.parse(
                    inHandSuHtarTaw.text == '' ? '0.0' : inHandSuHtarTaw.text),
                double.parse(inHandPyitceeSold.text == ''
                    ? '0.0'
                    : inHandPyitceeSold.text),
                double.parse(inHandPyitceeBorrow.text == ''
                    ? '0.0'
                    : inHandPyitceeBorrow.text),
                double.parse(inHandForeignCurrency.text == ''
                    ? '0.0'
                    : inHandForeignCurrency.text),
                double.parse(
                    inHandContract.text == '' ? '0.0' : inHandContract.text),
                double.parse(inHandOther.text == '' ? '0.0' : inHandOther.text),
                double.parse(
                    inBankInBank.text == '' ? '0.0' : inBankInBank.text),
                double.parse(inBankThuMyarHlwae.text == ''
                    ? '0.0'
                    : inBankThuMyarHlwae.text),
                double.parse(
                    inBankSalary.text == '' ? '0.0' : inBankSalary.text),
                double.parse(inBankOther.text == '' ? '0.0' : inBankOther.text),
                double.parse(thuMyarDebtPyitceeSold.text == ''
                    ? '0.0'
                    : thuMyarDebtPyitceeSold.text),
                double.parse(thuMyarDebtChayPay.text == ''
                    ? '0.0'
                    : thuMyarDebtChayPay.text),
                double.parse(thuMyarDebtAttHtrTaw.text == '' ? '0.0' : thuMyarDebtAttHtrTaw.text),
                double.parse(thuMyarDebtOther.text == '' ? '0.0' : thuMyarDebtOther.text),
                double.parse(realEstateSellHouse.text == '' ? '0.0' : realEstateSellHouse.text),
                double.parse(realEstateSellEscort.text == '' ? '0.0' : realEstateSellEscort.text),
                double.parse(realEstateSellCar.text == '' ? '0.0' : realEstateSellCar.text),
                double.parse(realEstateOther.text == '' ? '0.0' : realEstateOther.text),
                double.parse(rawWearhouse.text == '' ? '0.0' : rawWearhouse.text),
                double.parse(rawHome.text == '' ? '0.0' : rawHome.text),
                double.parse(rawShop.text == '' ? '0.0' : rawShop.text),
                double.parse(rawOther.text == '' ? '0.0' : rawOther.text),
                double.parse(finishWearhouse.text == '' ? '0.0' : finishWearhouse.text),
                double.parse(finishHome.text == '' ? '0.0' : finishHome.text),
                double.parse(finishShop.text == '' ? '0.0' : finishShop.text),
                double.parse(finishAnimal.text == '' ? '0.0' : finishAnimal.text),
                double.parse(finishOther.text == '' ? '0.0' : finishOther.text)),
            ZakatCalculatorUtil().getTotalMinus(double.parse(minusDebtMahur.text == '' ? '0.0' : minusDebtMahur.text), double.parse(minusDebt.text == '' ? '0.0' : minusDebt.text), double.parse(minusSukyae.text == '' ? '0.0' : minusSukyae.text), double.parse(minusMeterBill.text == '' ? '0.0' : minusMeterBill.text), double.parse(minusPaybill.text == '' ? '0.0' : minusPaybill.text), double.parse(minusPaySalary.text == '' ? '0.0' : minusPaySalary.text), double.parse(minusPayRent.text == '' ? '0.0' : minusPayRent.text), double.parse(minusBuyGoodPay.text == '' ? '0.0' : minusBuyGoodPay.text), double.parse(minusPreZakat.text == '' ? '0.0' : minusPreZakat.text)),
            double.parse(goldPrice.text),
            double.parse(silverPrice.text));
      });
    } else if (_currentStep == 8) {
      Map<String, dynamic> row = {
        DatabaseHelper.goldAkhoutKyatthar:
            goldAkhoutKyatthar.text != '' ? goldAkhoutKyatthar.text : 0.0,
        DatabaseHelper.goldAkhoutPae:
            goldAkhoutPae.text != '' ? goldAkhoutPae.text : 0.0,
        DatabaseHelper.goldAkhoutYwae:
            goldAkhoutYwae.text != '' ? goldAkhoutYwae.text : 0.0,
        DatabaseHelper.goldAhtaeKyatthar:
            goldAhtaeKyatthar.text != '' ? goldAhtaeKyatthar.text : 0.0,
        DatabaseHelper.goldAhtaePae:
            goldAhtaePae.text != '' ? goldAhtaePae.text : 0.0,
        DatabaseHelper.goldAhtaeYwae:
            goldAhtaeYwae.text != '' ? goldAhtaeYwae.text : 0.0,
        DatabaseHelper.goldPyitceeKyatthar:
            goldPyitceeKyatthar.text != '' ? goldPyitceeKyatthar.text : 0.0,
        DatabaseHelper.goldPyitceePae:
            goldPyitceePae.text != '' ? goldPyitceePae.text : 0.0,
        DatabaseHelper.goldPyitceeYwae:
            goldPyitceeYwae.text != '' ? goldPyitceeYwae.text : 0.0,
        DatabaseHelper.whiteSilverAkhoutKyatthar:
            whiteSilverAkhoutKyatthar.text != ''
                ? whiteSilverAkhoutKyatthar.text
                : 0.0,
        DatabaseHelper.whiteSilverAkhoutPae:
            whiteSilverAkhoutPae.text != '' ? whiteSilverAkhoutPae.text : 0.0,
        DatabaseHelper.whiteSilverAkhoutYwae:
            whiteSilverAkhoutYwae.text != '' ? whiteSilverAkhoutYwae.text : 0.0,
        DatabaseHelper.whiteSilverAhtaeKyatthar:
            whiteSilverAhtaeKyatthar.text != ''
                ? whiteSilverAhtaeKyatthar.text
                : 0.0,
        DatabaseHelper.whiteSilverAhtaePae:
            whiteSilverAhtaePae.text != '' ? whiteSilverAhtaePae.text : 0.0,
        DatabaseHelper.whiteSilverAhtaeYwae:
            whiteSilverAhtaeYwae.text != '' ? whiteSilverAhtaeYwae.text : 0.0,
        DatabaseHelper.whiteSilverPyitceeKyatthar:
            whiteSilverPyitceeKyatthar.text != ''
                ? whiteSilverPyitceeKyatthar.text
                : 0.0,
        DatabaseHelper.whiteSilverPyitceePae:
            whiteSilverPyitceePae.text != '' ? whiteSilverPyitceePae.text : 0.0,
        DatabaseHelper.whiteSilverPyitceeYwae: whiteSilverPyitceeYwae.text != ''
            ? whiteSilverPyitceeYwae.text
            : 0.0,
        DatabaseHelper.silverAkhoutKyatthar:
            silverAkhoutKyatthar.text != '' ? silverAkhoutKyatthar.text : 0.0,
        DatabaseHelper.silverAkhoutPae:
            silverAkhoutPae.text != '' ? silverAkhoutPae.text : 0.0,
        DatabaseHelper.silverAkhoutYwae:
            silverAkhoutYwae.text != '' ? silverAkhoutYwae.text : 0.0,
        DatabaseHelper.silverAhtaeKyatthar:
            silverAhtaeKyatthar.text != '' ? silverAhtaeKyatthar.text : 0.0,
        DatabaseHelper.silverAhtaePae:
            silverAhtaePae.text != '' ? silverAhtaePae.text : 0.0,
        DatabaseHelper.silverAhtaeYwae:
            silverAhtaeYwae.text != '' ? silverAhtaeYwae.text : 0.0,
        DatabaseHelper.silverPyitceeKyatthar:
            silverPyitceeKyatthar.text != '' ? silverPyitceeKyatthar.text : 0.0,
        DatabaseHelper.silverPyitceePae:
            silverPyitceePae.text != '' ? silverPyitceePae.text : 0.0,
        DatabaseHelper.silverPyitceeYwae:
            silverPyitceeYwae.text != '' ? silverPyitceeYwae.text : 0.0,
        DatabaseHelper.inHandSuHtarTaw:
            inHandSuHtarTaw.text != '' ? inHandSuHtarTaw.text : 0.0,
        DatabaseHelper.inHandPyitceeSold:
            inHandPyitceeSold.text != '' ? inHandPyitceeSold.text : 0.0,
        DatabaseHelper.inHandPyitceeBorrow:
            inHandPyitceeBorrow.text != '' ? inHandPyitceeBorrow.text : 0.0,
        DatabaseHelper.inHandForeignCurrency:
            inHandForeignCurrency.text != '' ? inHandForeignCurrency.text : 0.0,
        DatabaseHelper.inHandContract:
            inHandContract.text != '' ? inHandContract.text : 0.0,
        DatabaseHelper.inHandOther:
            inHandOther.text != '' ? inHandOther.text : 0.0,
        DatabaseHelper.inBankInBank:
            inBankInBank.text != '' ? inBankInBank.text : 0.0,
        DatabaseHelper.inBankThuMyarHlwae:
            inBankThuMyarHlwae.text != '' ? inBankThuMyarHlwae.text : 0.0,
        DatabaseHelper.inBankSalary:
            inBankSalary.text != '' ? inBankSalary.text : 0.0,
        DatabaseHelper.inBankOther:
            inBankOther.text != '' ? inBankOther.text : 0.0,
        DatabaseHelper.thuMyarDebtPyitceeSold: thuMyarDebtPyitceeSold.text != ''
            ? thuMyarDebtPyitceeSold.text
            : 0.0,
        DatabaseHelper.thuMyarDebtChayPay:
            thuMyarDebtChayPay.text != '' ? thuMyarDebtChayPay.text : 0.0,
        DatabaseHelper.thuMyarDebtAttHtrTaw:
            thuMyarDebtAttHtrTaw.text != '' ? thuMyarDebtAttHtrTaw.text : 0.0,
        DatabaseHelper.thuMyarDebtOther:
            thuMyarDebtOther.text != '' ? thuMyarDebtOther.text : 0.0,
        DatabaseHelper.realEstateSellHouse:
            realEstateSellHouse.text != '' ? realEstateSellHouse.text : 0.0,
        DatabaseHelper.realEstateSellEscort:
            realEstateSellEscort.text != '' ? realEstateSellEscort.text : 0.0,
        DatabaseHelper.realEstateSellCar:
            realEstateSellCar.text != '' ? realEstateSellCar.text : 0.0,
        DatabaseHelper.realEstateOther:
            realEstateOther.text != '' ? realEstateOther.text : 0.0,
        DatabaseHelper.rawWearhouse:
            rawWearhouse.text != '' ? rawWearhouse.text : 0.0,
        DatabaseHelper.rawHome: rawHome.text != '' ? rawHome.text : 0.0,
        DatabaseHelper.rawShop: rawShop.text != '' ? rawShop.text : 0.0,
        DatabaseHelper.rawOther: rawOther.text != '' ? rawOther.text : 0.0,
        DatabaseHelper.finishWearhouse:
            finishWearhouse.text != '' ? finishWearhouse.text : 0.0,
        DatabaseHelper.finishHome:
            finishHome.text != '' ? finishHome.text : 0.0,
        DatabaseHelper.finishShop:
            finishShop.text != '' ? finishShop.text : 0.0,
        DatabaseHelper.finishAnimal:
            finishAnimal.text != '' ? finishAnimal.text : 0.0,
        DatabaseHelper.finishOther:
            finishOther.text != '' ? finishOther.text : 0.0,
        DatabaseHelper.sate: sate.text != '' ? sate.text : 0.0,
        DatabaseHelper.thoe: thoe.text != '' ? thoe.text : 0.0,
        DatabaseHelper.kalaout: kalaout.text != '' ? kalaout.text : 0.0,
        DatabaseHelper.kywae: kywae.text != '' ? kywae.text : 0.0,
        DatabaseHelper.nwar: nwar.text != '' ? nwar.text : 0.0,
        DatabaseHelper.minusDebtMahur:
            minusDebtMahur.text != '' ? minusDebtMahur.text : 0.0,
        DatabaseHelper.minusDebt: minusDebt.text != '' ? minusDebt.text : 0.0,
        DatabaseHelper.minusSukyae:
            minusSukyae.text != '' ? minusSukyae.text : 0.0,
        DatabaseHelper.minusMeterBill:
            minusMeterBill.text != '' ? minusMeterBill.text : 0.0,
        DatabaseHelper.minusPaybill:
            minusPaybill.text != '' ? minusPaybill.text : 0.0,
        DatabaseHelper.minusPaySalary:
            minusPaySalary.text != '' ? minusPaySalary.text : 0.0,
        DatabaseHelper.minusPayRent:
            minusPayRent.text != '' ? minusPayRent.text : 0.0,
        DatabaseHelper.minusBuyGoodPay:
            minusBuyGoodPay.text != '' ? minusBuyGoodPay.text : 0.0,
        DatabaseHelper.minusPreZakat:
            minusPreZakat.text != '' ? minusPreZakat.text : 0.0,
        DatabaseHelper.createdAt: DateTime.now().toString(),
        DatabaseHelper.updatedAt: DateTime.now().toString(),
        DatabaseHelper.goldRate: goldPrice.text,
        DatabaseHelper.silverRate: silverPrice.text,
        DatabaseHelper.yourWorth: _result['netWorth']!,
        DatabaseHelper.yourZakat: _result['result']!
      };
      print(dbHelper.updateZakat(row, widget.zakatId));
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ZakatListScreen()));
    }

    _currentStep < 8 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
