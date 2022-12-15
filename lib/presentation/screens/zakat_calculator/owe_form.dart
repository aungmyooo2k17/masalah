import 'package:flutter/material.dart';
import 'package:masalah/db/db_helper.dart';
import 'package:masalah/util/share_preference_util.dart';

import '../../../common/constants/color_constant.dart';
import '../../../common/constants/translation_constants.dart';
import '../../../common/extensions/string_extensions.dart';

class OweForm extends StatefulWidget {
  OweForm({Key? key}) : super(key: key);

  @override
  State<OweForm> createState() => _OweFormState();
}

class _OweFormState extends State<OweForm> {
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
    super.initState();
    get();
  }

  @override
  void dispose() {
    save();
    minusDebtMahur.dispose();
    minusDebt.dispose();
    minusSukyae.dispose();
    minusMeterBill.dispose();
    minusPaybill.dispose();
    minusPaySalary.dispose();
    minusPayRent.dispose();
    minusBuyGoodPay.dispose();
    minusPreZakat.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24.0,
        ),
        oweForm(context),
      ],
    );
  }

  Container oweForm(BuildContext context) {
    return Container(
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
                labelText:
                    TranslationConstants.minusDebtMahur.t(context) ?? ""),
          ),
          TextFormField(
            controller: minusDebt,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: TranslationConstants.minusDebt.t(context) ?? ""),
          ),
          TextFormField(
              controller: minusSukyae,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText:
                      TranslationConstants.minusSukyae.t(context) ?? "")),
          TextFormField(
              controller: minusMeterBill,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText:
                      TranslationConstants.minusMeterBill.t(context) ?? "")),
          TextFormField(
              controller: minusPaybill,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText:
                      TranslationConstants.minusPaybill.t(context) ?? "")),
          TextFormField(
              controller: minusPaySalary,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText:
                      TranslationConstants.minusPaySalary.t(context) ?? "")),
          TextFormField(
              controller: minusPayRent,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText:
                      TranslationConstants.minusPayRent.t(context) ?? "")),
          TextFormField(
              controller: minusBuyGoodPay,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText:
                      TranslationConstants.minusBuyGoodPay.t(context) ?? "")),
          TextFormField(
              controller: minusPreZakat,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText:
                      TranslationConstants.minusPreZakat.t(context) ?? "")),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }

  save() {
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.minusDebtMahur,
        minusDebtMahur.text == '' ? '0.0' : minusDebtMahur.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.minusDebt,
        minusDebt.text == '' ? '0.0' : minusDebt.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.minusSukyae,
        minusSukyae.text == '' ? '0.0' : minusSukyae.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.minusMeterBill,
        minusMeterBill.text == '' ? '0.0' : minusMeterBill.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.minusPaybill,
        minusPaybill.text == '' ? '0.0' : minusPaybill.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.minusPaySalary,
        minusPaySalary.text == '' ? '0.0' : minusPaySalary.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.minusPayRent,
        minusPayRent.text == '' ? '0.0' : minusPayRent.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.minusBuyGoodPay,
        minusBuyGoodPay.text == '' ? '0.0' : minusBuyGoodPay.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.minusPreZakat,
        minusPreZakat.text == '' ? '0.0' : minusPreZakat.text);
  }

  get() async {
    String minusDebtMahurTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.minusDebtMahur);
    String minusDebtTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.minusDebt);
    String minusSukyaeTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.minusSukyae);
    String minusMeterBillTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.minusMeterBill);
    String minusPaybillTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.minusPaybill);
    String minusPaySalaryTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.minusPaySalary);
    String minusPayRentTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.minusPayRent);
    String minusBuyGoodPayTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.minusBuyGoodPay);
    String minusPreZakatTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.minusPreZakat);

    minusDebtMahur.text = minusDebtMahurTxt == '0.0' ? '' : minusDebtMahurTxt;
    minusDebt.text = minusDebtTxt == '0.0' ? '' : minusDebtTxt;
    minusSukyae.text = minusSukyaeTxt == '0.0' ? '' : minusSukyaeTxt;
    minusMeterBill.text = minusMeterBillTxt == '0.0' ? '' : minusMeterBillTxt;
    minusPaybill.text = minusPaybillTxt == '0.0' ? '' : minusPaybillTxt;
    minusPaySalary.text = minusPaySalaryTxt == '0.0' ? '' : minusPaySalaryTxt;
    minusPayRent.text = minusPayRentTxt == '0.0' ? '' : minusPayRentTxt;
    minusBuyGoodPay.text =
        minusBuyGoodPayTxt == '0.0' ? '' : minusBuyGoodPayTxt;
    minusPreZakat.text = minusPreZakatTxt == '0.0' ? '' : minusPreZakatTxt;
  }
}
