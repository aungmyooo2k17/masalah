import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/reusable_widget/app_text.dart';
import 'package:masalah/util/zakat_calculator_util.dart';

class ZakatCalculator extends StatefulWidget {
  @override
  _ZakatCalculatorState createState() => _ZakatCalculatorState();
}

class _ZakatCalculatorState extends State<ZakatCalculator> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

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

  @override
  void initState() {
    // .... Gold ....
    ZakatCalculatorUtil().getGoldAkhout()["kyatthar"].then((value) {
      goldAkhoutKyatthar.text = "$value";
    });
    ZakatCalculatorUtil().getGoldAkhout()["pae"].then((value) {
      goldAkhoutPae.text = "$value";
    });
    ZakatCalculatorUtil().getGoldAkhout()["ywae"].then((value) {
      goldAkhoutYwae.text = "$value";
    });

    ZakatCalculatorUtil().getGoldAHtae()["kyatthar"].then((value) {
      goldAhtaeKyatthar.text = "$value";
    });
    ZakatCalculatorUtil().getGoldAHtae()["pae"].then((value) {
      goldAhtaePae.text = "$value";
    });
    ZakatCalculatorUtil().getGoldAHtae()["ywae"].then((value) {
      goldAhtaeYwae.text = "$value";
    });

    ZakatCalculatorUtil().getGoldPyitCee()["kyatthar"].then((value) {
      goldPyitceeKyatthar.text = "$value";
    });
    ZakatCalculatorUtil().getGoldPyitCee()["pae"].then((value) {
      goldPyitceePae.text = "$value";
    });
    ZakatCalculatorUtil().getGoldPyitCee()["ywae"].then((value) {
      goldPyitceeYwae.text = "$value";
    });
    // .... Gold ....

    // .... Silver ....
    ZakatCalculatorUtil().getSilverAkhout()["kyatthar"].then((value) {
      silverAkhoutKyatthar.text = "$value";
    });
    ZakatCalculatorUtil().getSilverAkhout()["pae"].then((value) {
      silverAkhoutPae.text = "$value";
    });
    ZakatCalculatorUtil().getSilverAkhout()["ywae"].then((value) {
      silverAkhoutYwae.text = "$value";
    });

    ZakatCalculatorUtil().getSilverAHtae()["kyatthar"].then((value) {
      silverAhtaeKyatthar.text = "$value";
    });
    ZakatCalculatorUtil().getSilverAHtae()["pae"].then((value) {
      silverAhtaePae.text = "$value";
    });
    ZakatCalculatorUtil().getSilverAHtae()["ywae"].then((value) {
      silverAhtaeYwae.text = "$value";
    });

    ZakatCalculatorUtil().getSilverPyitCee()["kyatthar"].then((value) {
      silverPyitceeKyatthar.text = "$value";
    });
    ZakatCalculatorUtil().getSilverPyitCee()["pae"].then((value) {
      silverPyitceePae.text = "$value";
    });
    ZakatCalculatorUtil().getSilverPyitCee()["ywae"].then((value) {
      silverPyitceeYwae.text = "$value";
    });
    // .... Silver ....

    // .... WhiteSilver ....
    ZakatCalculatorUtil().getWhiteSilverAkhout()["kyatthar"].then((value) {
      whiteSilverAkhoutKyatthar.text = "$value";
    });
    ZakatCalculatorUtil().getWhiteSilverAkhout()["pae"].then((value) {
      whiteSilverAkhoutPae.text = "$value";
    });
    ZakatCalculatorUtil().getWhiteSilverAkhout()["ywae"].then((value) {
      whiteSilverAkhoutYwae.text = "$value";
    });

    ZakatCalculatorUtil().getWhiteSilverAHtae()["kyatthar"].then((value) {
      whiteSilverAhtaeKyatthar.text = "$value";
    });
    ZakatCalculatorUtil().getWhiteSilverAHtae()["pae"].then((value) {
      whiteSilverAhtaePae.text = "$value";
    });
    ZakatCalculatorUtil().getWhiteSilverAHtae()["ywae"].then((value) {
      whiteSilverAhtaeYwae.text = "$value";
    });

    ZakatCalculatorUtil().getWhiteSilverPyitCee()["kyatthar"].then((value) {
      whiteSilverPyitceeKyatthar.text = "$value";
    });
    ZakatCalculatorUtil().getWhiteSilverPyitCee()["pae"].then((value) {
      whiteSilverPyitceePae.text = "$value";
    });
    ZakatCalculatorUtil().getWhiteSilverPyitCee()["ywae"].then((value) {
      whiteSilverPyitceeYwae.text = "$value";
    });
    // .... WhiteSilver ....
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Flutter Stepper Demo'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                type: stepperType,
                physics: ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue: continued,
                onStepCancel: cancel,
                steps: <Step>[
                  Step(
                    title: new Text('ရွှေ'),
                    content: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အခေါက်",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                controller: goldAkhoutKyatthar,
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                controller: goldAkhoutPae,
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  controller: goldAkhoutYwae,
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {
                                  ZakatCalculatorUtil().saveGoldAkhout(
                                      goldAkhoutKyatthar.text,
                                      goldAkhoutPae.text,
                                      goldAkhoutYwae.text);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Saved')));
                                },
                                child: Text("Save"),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အထည်",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                controller: goldAhtaeKyatthar,
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                controller: goldAhtaePae,
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  controller: goldAhtaeYwae,
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {
                                  ZakatCalculatorUtil().saveGoldAHtae(
                                      goldAhtaeKyatthar.text,
                                      goldAhtaePae.text,
                                      goldAhtaeYwae.text);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Saved')));
                                },
                                child: Text("Save"),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အသုံးဆောင်ပစ္စည်း",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                controller: goldPyitceeKyatthar,
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                controller: goldPyitceePae,
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  controller: goldPyitceeYwae,
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {
                                  ZakatCalculatorUtil().saveGoldPyitCee(
                                      goldPyitceeKyatthar.text,
                                      goldPyitceePae.text,
                                      goldPyitceeYwae.text);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Saved')));
                                },
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('ရွှေဖြူ'),
                    content: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အခေါက်",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                controller: whiteSilverAkhoutKyatthar,
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                controller: whiteSilverAkhoutPae,
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  controller: whiteSilverAkhoutYwae,
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {
                                  ZakatCalculatorUtil().saveWhiteSilverAkhout(
                                      whiteSilverAkhoutKyatthar.text,
                                      whiteSilverAkhoutPae.text,
                                      whiteSilverAkhoutYwae.text);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Saved')));
                                },
                                child: Text("Save"),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အထည်",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                controller: whiteSilverAhtaeKyatthar,
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                controller: whiteSilverAhtaePae,
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  controller: whiteSilverAhtaeYwae,
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {
                                  ZakatCalculatorUtil().saveWhiteSilverAHtae(
                                      whiteSilverAhtaeKyatthar.text,
                                      whiteSilverAhtaePae.text,
                                      whiteSilverAhtaeYwae.text);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Saved')));
                                },
                                child: Text("Save"),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အသုံးဆောင်ပစ္စည်း",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                controller: whiteSilverPyitceeKyatthar,
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                controller: whiteSilverPyitceePae,
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  controller: whiteSilverPyitceeYwae,
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {
                                  ZakatCalculatorUtil().saveWhiteSilverPyitCee(
                                      whiteSilverPyitceeKyatthar.text,
                                      whiteSilverPyitceePae.text,
                                      whiteSilverPyitceeYwae.text);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Saved')));
                                },
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('ငွေ'),
                    content: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အခေါက်",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                controller: silverAkhoutKyatthar,
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                controller: silverAkhoutPae,
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  controller: silverAkhoutYwae,
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {
                                  ZakatCalculatorUtil().saveSilverAkhout(
                                      silverAkhoutKyatthar.text,
                                      silverAkhoutPae.text,
                                      silverAkhoutYwae.text);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Saved')));
                                },
                                child: Text("Save"),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အထည်",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                controller: silverAhtaeKyatthar,
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                controller: silverAhtaePae,
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  controller: silverAhtaeYwae,
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {
                                  ZakatCalculatorUtil().saveSilverAHtae(
                                      silverAhtaeKyatthar.text,
                                      silverAhtaePae.text,
                                      silverAhtaeYwae.text);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Saved')));
                                },
                                child: Text("Save"),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အသုံးဆောင်ပစ္စည်း",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                controller: silverPyitceeKyatthar,
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                controller: silverPyitceePae,
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  controller: silverPyitceeYwae,
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {
                                  ZakatCalculatorUtil().saveSilverPyitCee(
                                      silverPyitceeKyatthar.text,
                                      silverPyitceePae.text,
                                      silverPyitceeYwae.text);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Saved')));
                                },
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('ပိုက်ဆံ'),
                    content: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "လက်ထဲရှိ",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'စုဆောင်းထားသော'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'ပစ္စည်းရောင်း၍ရထားသော'),
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'ပစ္စည်းငှားရမ်းခရထားသော')),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'နိုင်ငံခြားငွေ(ကျပ်ဖြင့်)')),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText:
                                          'ငွေချေးစာချုပ်၊ချက်လက်မှတ်...')),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'အခြား')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "ဘဏ်ထဲရှိ",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'ဘဏ်ထဲထည့်ထားသော'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'သူများလွှဲပေးထားသော'),
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'လစာ၊ပင်စင်တစ်ခုခုရထားသော')),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'အခြား (Digital Money, etc)')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "သူများကိုပေးထားသောအကြွေး",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'ပစ္စည်းရောင်း၍ရရန်ရှိသော'),
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'ချေးပေးထားသော'),
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText:
                                          'တစ်ဦးတစ်ယောက်ထံအပ်နှံထားသော')),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'အခြား')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('အရောင်းအဝယ်ကုန်ပစ္စည်း'),
                    content: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အိမ်၊ခြံ၊မြေ",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'ရောင်းရန်ရှိသောအိမ်'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'ရောင်းရန်ရှိသောခြံ/မြေ'),
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'ရောင်းရန်ရှိသောကား')),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'အခြား')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "ကုန်ကြမ်းများ",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'ဂိုထောင်တွင်ရှိသော'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'အိမ်တွင်ရှိသော'),
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'ဆိုင်တွင်ရှိသော')),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'အခြား')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "ကုန်ချောများ",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'ဂိုထောင်တွင်ရှိသော'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'အိမ်တွင်ရှိသော'),
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'ဆိုင်တွင်ရှိသော')),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText:
                                          'မွေးမြူရေးခြံထဲရှိရောင်းရန်သားကောင်များ')),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'အခြား')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text(
                        'စားကျက်တွင်လွတ်ထားသောမွေးမြူရေးတိရိစ္ဆာန်များ'),
                    content: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "ကုလားအုပ်",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "ကျွဲ၊နွား",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "ဆိတ်၊သိုး",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('အနှုတ်စာရင်း'),
                    content: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'ဇနီးကိုမပေးရသေးသောမဟ်ရ်'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'သူများကိုပေးဆပ်ရမည့်အကြွေး'),
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText:
                                          'စုကြေးရရှိပြီးပေးသွင်းရန်ကျန်ငွေပေါင်း')),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'ပေးဆောင်ရန်ကျန်သောမီတာခ')),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText:
                                          'ပေးဆောင်ရန်ကျန်သောအဖိုးအခများ')),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText:
                                          'ဝန်ထမ်းများကိုပေးရန်ကျန်သောလစာများ')),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText:
                                          'ပေးဆောင်ရန်ကျန်သောငှားရမ်းခများ')),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText:
                                          'ပစ္စည်းဝယ်ပြီးပေးချေရန်ကျန်သောအကြွေး')),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText:
                                          'ယခင်နှစ်များ၏မပေးရသေးသောဇကားသ်')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('ပေါက်ဈေး'),
                    content: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "ရွှေဈေးစုံစမ်း၍ထည့်ရန်",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: ' '),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "ငွေဈေးစုံစမ်း၍ထည့်ရန်",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: ' '),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အောက်တိုတွက်ပေးပါ။",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: ' '),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('အဖြေ'),
                    content: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အခေါက်",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အထည်",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                data: "အသုံးဆောင်ပစ္စည်း",
                                color: AppColors.primaryText,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'ကျပ်သား'),
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'ပဲ'),
                              ),
                              TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'ရွှေး')),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.list),
        onPressed: switchStepsType,
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
    _currentStep < 8 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
