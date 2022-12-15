import 'package:flutter/material.dart';
import 'package:masalah/util/share_preference_util.dart';

import '../../../common/constants/color_constant.dart';
import '../../../common/constants/translation_constants.dart';
import '../../../common/extensions/string_extensions.dart';
import '../../../db/db_helper.dart';
import '../../reusable_widget/app_text.dart';

class MoneyForm extends StatefulWidget {
  MoneyForm({Key? key}) : super(key: key);

  @override
  State<MoneyForm> createState() => _MoneyFormState();
}

class _MoneyFormState extends State<MoneyForm> {
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

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  void dispose() {
    save();
    inHandSuHtarTaw.dispose();
    inHandPyitceeSold.dispose();
    inHandPyitceeBorrow.dispose();
    inHandForeignCurrency.dispose();
    inHandContract.dispose();
    inHandOther.dispose();
    inBankInBank.dispose();
    inBankThuMyarHlwae.dispose();
    inBankSalary.dispose();
    inBankOther.dispose();
    thuMyarDebtPyitceeSold.dispose();
    thuMyarDebtChayPay.dispose();
    thuMyarDebtAttHtrTaw.dispose();
    thuMyarDebtOther.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        description(context),
        SizedBox(
          height: 24.0,
        ),
        inHand(context),
        SizedBox(
          height: 24.0,
        ),
        inBank(context),
        SizedBox(
          height: 24.0,
        ),
        receivableMoney(context),
        SizedBox(
          height: 24.0,
        ),
      ],
    );
  }

  Container receivableMoney(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoldText(
            data: TranslationConstants.thuMyarDebt.t(context) ?? "",
            color: AppColors.primaryText,
          ),
          TextFormField(
            controller: thuMyarDebtPyitceeSold,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText:
                    TranslationConstants.thuMyarDebtPyitceeSold.t(context) ??
                        ""),
          ),
          TextFormField(
            controller: thuMyarDebtChayPay,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText:
                    TranslationConstants.thuMyarDebtChayPay.t(context) ?? ""),
          ),
          TextFormField(
              controller: thuMyarDebtAttHtrTaw,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText:
                      TranslationConstants.thuMyarDebtAttHtrTaw.t(context) ??
                          "")),
          TextFormField(
              controller: thuMyarDebtOther,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: TranslationConstants.others.t(context) ?? "")),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }

  Container inBank(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoldText(
            data: TranslationConstants.inBank.t(context) ?? "",
            color: AppColors.primaryText,
          ),
          TextFormField(
            controller: inBankInBank,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: TranslationConstants.inBankInBank.t(context) ?? ""),
          ),
          TextFormField(
            controller: inBankThuMyarHlwae,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText:
                    TranslationConstants.inBankThuMyarHlwae.t(context) ?? ""),
          ),
          TextFormField(
              controller: inBankSalary,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText:
                      TranslationConstants.inBankSalary.t(context) ?? "")),
          TextFormField(
              controller: inBankOther,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText:
                      TranslationConstants.inBankOther.t(context) ?? "")),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }

  Container inHand(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoldText(
            data: TranslationConstants.inHand.t(context) ?? "",
            color: AppColors.primaryText,
          ),
          TextFormField(
            controller: inHandSuHtarTaw,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: TranslationConstants.inHandSuHtarTaw.t(context) ?? "",
            ),
          ),
          TextFormField(
            controller: inHandPyitceeSold,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText:
                    TranslationConstants.inHandPyitceeSold.t(context) ?? ""),
          ),
          TextFormField(
              controller: inHandPyitceeBorrow,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText:
                      TranslationConstants.inHandPyitceeBorrow.t(context) ??
                          "")),
          TextFormField(
              controller: inHandForeignCurrency,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText:
                      TranslationConstants.inHandForeignCurrency.t(context) ??
                          "")),
          TextFormField(
              controller: inHandContract,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText:
                      TranslationConstants.inHandContract.t(context) ?? "")),
          TextFormField(
              controller: inHandOther,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: TranslationConstants.others.t(context) ?? "")),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }

  Container description(BuildContext context) {
    return Container(
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
            data: TranslationConstants.moneyDescription.t(context) ?? "",
          )
        ],
      ),
    );
  }

  void get() async {
    String inHandSuHtarTawTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.inHandSuHtarTaw);
    String inHandPyitceeSoldTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.inHandPyitceeSold);
    String inHandPyitceeBorrowTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.inHandPyitceeBorrow);
    String inHandForeignCurrencyTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.inHandForeignCurrency);
    String inHandContractTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.inHandContract);
    String inHandOtherTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.inHandOther);
    String inBankInBankTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.inBankInBank);
    String inBankThuMyarHlwaeTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.inBankThuMyarHlwae);
    String inBankSalaryTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.inBankSalary);
    String inBankOtherTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.inBankOther);
    String thuMyarDebtPyitceeSoldTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.thuMyarDebtPyitceeSold);
    String thuMyarDebtChayPayTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.thuMyarDebtChayPay);
    String thuMyarDebtAttHtrTawTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.thuMyarDebtAttHtrTaw);
    String thuMyarDebtOtherTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.thuMyarDebtOther);

    inHandSuHtarTaw.text =
        inHandSuHtarTawTxt == '0.0' ? '' : inHandSuHtarTawTxt;
    inHandPyitceeSold.text =
        inHandPyitceeSoldTxt == '0.0' ? '' : inHandPyitceeSoldTxt;
    inHandPyitceeBorrow.text =
        inHandPyitceeBorrowTxt == '0.0' ? '' : inHandPyitceeBorrowTxt;
    inHandForeignCurrency.text =
        inHandForeignCurrencyTxt == '0.0' ? '' : inHandForeignCurrencyTxt;
    inHandContract.text = inHandContractTxt == '0.0' ? '' : inHandContractTxt;
    inHandOther.text = inHandOtherTxt == '0.0' ? '' : inHandOtherTxt;
    inBankInBank.text = inBankInBankTxt == '0.0' ? '' : inBankInBankTxt;
    inBankThuMyarHlwae.text =
        inBankThuMyarHlwaeTxt == '0.0' ? '' : inBankThuMyarHlwaeTxt;
    inBankSalary.text = inBankSalaryTxt == '0.0' ? '' : inBankSalaryTxt;
    inBankOther.text = inBankOtherTxt == '0.0' ? '' : inBankOtherTxt;
    thuMyarDebtPyitceeSold.text =
        thuMyarDebtPyitceeSoldTxt == '0.0' ? '' : thuMyarDebtPyitceeSoldTxt;
    thuMyarDebtChayPay.text =
        thuMyarDebtChayPayTxt == '0.0' ? '' : thuMyarDebtChayPayTxt;
    thuMyarDebtAttHtrTaw.text =
        thuMyarDebtAttHtrTawTxt == '0.0' ? '' : thuMyarDebtAttHtrTawTxt;
    thuMyarDebtOther.text =
        thuMyarDebtOtherTxt == '0.0' ? '' : thuMyarDebtOtherTxt;
  }

  void save() {
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.inHandSuHtarTaw,
        inHandSuHtarTaw.text == '' ? '0.0' : inHandSuHtarTaw.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.inHandPyitceeSold,
        inHandPyitceeSold.text == '' ? '0.0' : inHandPyitceeSold.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.inHandPyitceeBorrow,
        inHandPyitceeBorrow.text == '' ? '0.0' : inHandPyitceeBorrow.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.inHandForeignCurrency,
        inHandForeignCurrency.text == '' ? '0.0' : inHandForeignCurrency.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.inHandContract,
        inHandContract.text == '' ? '0.0' : inHandContract.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.inHandOther,
        inHandOther.text == '' ? '0.0' : inHandOther.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.inBankInBank,
        inBankInBank.text == '' ? '0.0' : inBankInBank.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.inBankThuMyarHlwae,
        inBankThuMyarHlwae.text == '' ? '0.0' : inBankThuMyarHlwae.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.inBankSalary,
        inBankSalary.text == '' ? '0.0' : inBankSalary.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.inBankOther,
        inBankOther.text == '' ? '0.0' : inBankOther.text);
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.thuMyarDebtPyitceeSold,
        thuMyarDebtPyitceeSold.text == ''
            ? '0.0'
            : thuMyarDebtPyitceeSold.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.thuMyarDebtChayPay,
        thuMyarDebtChayPay.text == '' ? '0.0' : thuMyarDebtChayPay.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.thuMyarDebtAttHtrTaw,
        thuMyarDebtAttHtrTaw.text == '' ? '0.0' : thuMyarDebtAttHtrTaw.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.thuMyarDebtOther,
        thuMyarDebtOther.text == '' ? '0.0' : thuMyarDebtOther.text);
  }
}
