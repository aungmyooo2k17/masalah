import 'package:flutter/material.dart';
import 'package:masalah/db/db_helper.dart';
import 'package:masalah/util/share_preference_util.dart';

import '../../../common/constants/color_constant.dart';
import '../../../common/constants/translation_constants.dart';
import '../../reusable_widget/app_text.dart';
import '../../../common/extensions/string_extensions.dart';

class SilverForm extends StatefulWidget {
  const SilverForm({Key? key}) : super(key: key);

  @override
  State<SilverForm> createState() => SilverFormState();
}

class SilverFormState extends State<SilverForm> {
  final silverAkhoutKyatthar = TextEditingController();
  final silverAkhoutPae = TextEditingController();
  final silverAkhoutYwae = TextEditingController();
  final silverAhtaeKyatthar = TextEditingController();
  final silverAhtaePae = TextEditingController();
  final silverAhtaeYwae = TextEditingController();
  final silverPyitceeKyatthar = TextEditingController();
  final silverPyitceePae = TextEditingController();
  final silverPyitceeYwae = TextEditingController();

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  void dispose() {
    save();
    silverAkhoutKyatthar.dispose();
    silverAkhoutPae.dispose();
    silverAkhoutYwae.dispose();
    silverAhtaeKyatthar.dispose();
    silverAhtaePae.dispose();
    silverAhtaeYwae.dispose();
    silverPyitceeKyatthar.dispose();
    silverPyitceePae.dispose();
    silverPyitceeYwae.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BoldText(
          data: TranslationConstants.silver.t(context) ?? "",
          color: AppColors.primaryText,
          fontSize: 22.0,
        ),
        SizedBox(
          height: 24.0,
        ),
        description(context),
        SizedBox(
          height: 24.0,
        ),
        barForm(context),
        SizedBox(height: 16.0),
        jewelleriesForm(context),
        SizedBox(height: 16.0),
        accessoriesForm(context),
      ],
    );
  }

  Container accessoriesForm(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BoldText(
              data: TranslationConstants.atoneAsungPyitcee.t(context) ?? "",
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
                                  bottomLeft: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0)),
                            ),
                            child: Center(
                              child: RegularText(
                                  data: TranslationConstants.kyatthar
                                          .t(context) ??
                                      "",
                                  fontSize: 10.0,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8.0),
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border:
                                  Border.all(color: Colors.black12, width: 1),
                            ),
                            child: TextField(
                              controller: silverPyitceeKyatthar,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    bottom: 30 / 2, // HERE THE IMPORTANT PART
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
                                  bottomLeft: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0)),
                            ),
                            child: Center(
                              child: RegularText(
                                  data:
                                      TranslationConstants.pae.t(context) ?? "",
                                  fontSize: 10.0,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8.0),
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border:
                                  Border.all(color: Colors.black12, width: 1),
                            ),
                            child: TextField(
                              controller: silverPyitceePae,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    bottom: 30 / 2, // HERE THE IMPORTANT PART
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
                                  bottomLeft: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0)),
                            ),
                            child: Center(
                              child: RegularText(
                                  data: TranslationConstants.ywae.t(context) ??
                                      "",
                                  fontSize: 10.0,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8.0),
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border:
                                  Border.all(color: Colors.black12, width: 1),
                            ),
                            child: TextField(
                              controller: silverPyitceeYwae,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    bottom: 30 / 2, // HERE THE IMPORTANT PART
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
        ));
  }

  Container jewelleriesForm(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BoldText(
              data: TranslationConstants.ahtae.t(context) ?? "",
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
                                  bottomLeft: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0)),
                            ),
                            child: Center(
                              child: RegularText(
                                  data: TranslationConstants.kyatthar
                                          .t(context) ??
                                      "",
                                  fontSize: 10.0,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8.0),
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border:
                                  Border.all(color: Colors.black12, width: 1),
                            ),
                            child: TextField(
                              controller: silverAhtaeKyatthar,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    bottom: 30 / 2, // HERE THE IMPORTANT PART
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
                                  bottomLeft: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0)),
                            ),
                            child: Center(
                              child: RegularText(
                                  data:
                                      TranslationConstants.pae.t(context) ?? "",
                                  fontSize: 10.0,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8.0),
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border:
                                  Border.all(color: Colors.black12, width: 1),
                            ),
                            child: TextField(
                              controller: silverAhtaePae,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    bottom: 30 / 2, // HERE THE IMPORTANT PART
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
                                  bottomLeft: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0)),
                            ),
                            child: Center(
                              child: RegularText(
                                  data: TranslationConstants.ywae.t(context) ??
                                      "",
                                  fontSize: 10.0,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8.0),
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border:
                                  Border.all(color: Colors.black12, width: 1),
                            ),
                            child: TextField(
                              controller: silverAhtaeYwae,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    bottom: 30 / 2, // HERE THE IMPORTANT PART
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
        ));
  }

  Container barForm(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BoldText(
              data: TranslationConstants.akhout.t(context) ?? "",
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
                                  bottomLeft: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0)),
                            ),
                            child: Center(
                              child: RegularText(
                                  data: TranslationConstants.kyatthar
                                          .t(context) ??
                                      "",
                                  fontSize: 10.0,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8.0),
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border:
                                  Border.all(color: Colors.black12, width: 1),
                            ),
                            child: TextField(
                              controller: silverAkhoutKyatthar,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    bottom: 30 / 2, // HERE THE IMPORTANT PART
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
                                  bottomLeft: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0)),
                            ),
                            child: Center(
                              child: RegularText(
                                  data:
                                      TranslationConstants.pae.t(context) ?? "",
                                  fontSize: 10.0,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8.0),
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border:
                                  Border.all(color: Colors.black12, width: 1),
                            ),
                            child: TextField(
                              controller: silverAkhoutPae,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    bottom: 30 / 2, // HERE THE IMPORTANT PART
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
                                  bottomLeft: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0)),
                            ),
                            child: Center(
                              child: RegularText(
                                  data: TranslationConstants.ywae.t(context) ??
                                      "",
                                  fontSize: 10.0,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8.0),
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border:
                                  Border.all(color: Colors.black12, width: 1),
                            ),
                            child: TextField(
                              controller: silverAkhoutYwae,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    bottom: 30 / 2, // HERE THE IMPORTANT PART
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
        ));
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
          RegularText(
            fontSize: 14,
            color: AppColors.white,
            data: TranslationConstants.silverDescription.t(context) ?? "",
          )
        ],
      ),
    );
  }

  void get() async {
    String silverAkhoutKyattharTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.silverAkhoutKyatthar);
    String silverAkhoutPaeTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.silverAkhoutPae);
    String silverAkhoutYwaeTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.silverAkhoutYwae);
    String silverAhtaeKyattharTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.silverAhtaeKyatthar);
    String silverAhtaePaeTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.silverAhtaePae);
    String silverAhtaeYwaeTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.silverAhtaeYwae);
    String silverPyitceeKyattharTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.silverPyitceeKyatthar);
    String silverPyitceePaeTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.silverPyitceePae);
    String silverPyitceeYwaeTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.silverPyitceeYwae);

    silverAkhoutKyatthar.text =
        silverAkhoutKyattharTxt == '0.0' ? "" : silverAkhoutKyattharTxt;
    silverAkhoutPae.text =
        silverAkhoutPaeTxt == '0.0' ? "" : silverAkhoutPaeTxt;
    silverAkhoutYwae.text =
        silverAkhoutYwaeTxt == '0.0' ? "" : silverAkhoutYwaeTxt;
    silverAhtaeKyatthar.text =
        silverAhtaeKyattharTxt == '0.0' ? "" : silverAhtaeKyattharTxt;
    silverAhtaePae.text = silverAhtaePaeTxt == '0.0' ? "" : silverAhtaePaeTxt;
    silverAhtaeYwae.text =
        silverAhtaeYwaeTxt == '0.0' ? "" : silverAhtaeYwaeTxt;
    silverPyitceeKyatthar.text =
        silverPyitceeKyattharTxt == '0.0' ? "" : silverPyitceeKyattharTxt;
    silverPyitceePae.text =
        silverPyitceePaeTxt == '0.0' ? "" : silverPyitceePaeTxt;
    silverPyitceeYwae.text =
        silverPyitceeYwaeTxt == '0.0' ? "" : silverPyitceeYwaeTxt;
  }

  void save() {
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.silverAkhoutKyatthar,
        silverAkhoutKyatthar.text == '' ? '0.0' : silverAkhoutKyatthar.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.silverAkhoutPae,
        silverAkhoutPae.text == '' ? '0.0' : silverAkhoutPae.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.silverAkhoutYwae,
        silverAkhoutYwae.text == '' ? '0.0' : silverAkhoutYwae.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.silverAhtaeKyatthar,
        silverAhtaeKyatthar.text == '' ? '0.0' : silverAhtaeKyatthar.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.silverAhtaePae,
        silverAhtaePae.text == '' ? '0.0' : silverAhtaePae.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.silverAhtaeYwae,
        silverAhtaeYwae.text == '' ? '0.0' : silverAhtaeYwae.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.silverPyitceeKyatthar,
        silverPyitceeKyatthar.text == '' ? '0.0' : silverPyitceeKyatthar.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.silverPyitceePae,
        silverPyitceePae.text == '' ? '0.0' : silverPyitceePae.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.silverPyitceeYwae,
        silverPyitceeYwae.text == '' ? '0.0' : silverPyitceeYwae.text);
  }
}
