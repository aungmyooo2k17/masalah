import 'package:flutter/material.dart';
import 'package:masalah/util/share_preference_util.dart';

import '../../../common/constants/color_constant.dart';
import '../../../common/constants/translation_constants.dart';
import '../../reusable_widget/app_text.dart';
import '../../../common/extensions/string_extensions.dart';

class GoldForm extends StatefulWidget {
  const GoldForm({Key? key}) : super(key: key);

  @override
  State<GoldForm> createState() => _GoldFormState();
}

class _GoldFormState extends State<GoldForm> {
  final goldAkhoutKyatthar = TextEditingController();
  final goldAkhoutPae = TextEditingController();
  final goldAkhoutYwae = TextEditingController();
  final goldAhtaeKyatthar = TextEditingController();
  final goldAhtaePae = TextEditingController();
  final goldAhtaeYwae = TextEditingController();
  final goldPyitceeKyatthar = TextEditingController();
  final goldPyitceePae = TextEditingController();
  final goldPyitceeYwae = TextEditingController();

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  void dispose() {
    save();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BoldText(
          data: TranslationConstants.gold.t(context) ?? "",
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
                              controller: goldPyitceeKyatthar,
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
                              controller: goldPyitceePae,
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
                              controller: goldPyitceeYwae,
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
                              controller: goldAhtaeKyatthar,
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
                              controller: goldAhtaePae,
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
                              controller: goldAhtaeYwae,
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
                              controller: goldAkhoutKyatthar,
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
                              controller: goldAkhoutPae,
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
                              controller: goldAkhoutYwae,
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
            data: TranslationConstants.goldDescription.t(context) ?? "",
          )
        ],
      ),
    );
  }

  get() async {
    String goldAkhoutKyattharTxt =
        await SharedPreferenceUtil().getStringValuesSF("goldAkhoutKyatthar");
    String goldAkhoutPaeTxt =
        await SharedPreferenceUtil().getStringValuesSF("goldAkhoutPae");
    String goldAkhoutYwaeTxt =
        await SharedPreferenceUtil().getStringValuesSF("goldAkhoutYwae");
    String goldAhtaeKyattharTxt =
        await SharedPreferenceUtil().getStringValuesSF("goldAhtaeKyatthar");
    String goldAhtaePaeTxt =
        await SharedPreferenceUtil().getStringValuesSF("goldAhtaePae");
    String goldAhtaeYwaeTxt =
        await SharedPreferenceUtil().getStringValuesSF("goldAhtaeYwae");
    String goldPyitceeKyattharTxt =
        await SharedPreferenceUtil().getStringValuesSF("goldPyitceeKyatthar");
    String goldPyitceePaeTxt =
        await SharedPreferenceUtil().getStringValuesSF("goldPyitceePae");
    String goldPyitceeYwaeTxt =
        await SharedPreferenceUtil().getStringValuesSF("goldPyitceeYwae");
    goldAkhoutKyatthar.text =
        goldAkhoutKyattharTxt == '0.0' ? "" : goldAkhoutKyattharTxt;
    goldAkhoutPae.text = goldAkhoutPaeTxt == '0.0' ? "" : goldAkhoutPaeTxt;
    goldAkhoutYwae.text = goldAkhoutYwaeTxt == '0.0' ? "" : goldAkhoutYwaeTxt;
    goldAhtaeKyatthar.text =
        goldAhtaeKyattharTxt == '0.0' ? "" : goldAhtaeKyattharTxt;
    goldAhtaePae.text = goldAhtaePaeTxt == '0.0' ? "" : goldAhtaePaeTxt;
    goldAhtaeYwae.text = goldAhtaeYwaeTxt == '0.0' ? "" : goldAhtaeYwaeTxt;
    goldPyitceeKyatthar.text =
        goldPyitceeKyattharTxt == '0.0' ? "" : goldPyitceeKyattharTxt;
    goldPyitceePae.text = goldPyitceePaeTxt == '0.0' ? "" : goldPyitceePaeTxt;
    goldPyitceeYwae.text =
        goldPyitceeYwaeTxt == '0.0' ? "" : goldPyitceeYwaeTxt;
  }

  save() {
    SharedPreferenceUtil().addStringToSF("goldAkhoutKyatthar",
        goldAkhoutKyatthar.text == '' ? '0.0' : goldAkhoutKyatthar.text);
    SharedPreferenceUtil().addStringToSF(
        "goldAkhoutPae", goldAkhoutPae.text == '' ? '0.0' : goldAkhoutPae.text);
    SharedPreferenceUtil().addStringToSF("goldAkhoutYwae",
        goldAkhoutYwae.text == '' ? '0.0' : goldAkhoutYwae.text);
    SharedPreferenceUtil().addStringToSF("goldAhtaeKyatthar",
        goldAhtaeKyatthar.text == '' ? '0.0' : goldAhtaeKyatthar.text);
    SharedPreferenceUtil().addStringToSF(
        "goldAhtaePae", goldAhtaePae.text == '' ? '0.0' : goldAhtaePae.text);
    SharedPreferenceUtil().addStringToSF(
        "goldAhtaeYwae", goldAhtaeYwae.text == '' ? '0.0' : goldAhtaeYwae.text);
    SharedPreferenceUtil().addStringToSF("goldPyitceeKyatthar",
        goldPyitceeKyatthar.text == '' ? '0.0' : goldPyitceeKyatthar.text);
    SharedPreferenceUtil().addStringToSF("goldPyitceePae",
        goldPyitceePae.text == '' ? '0.0' : goldPyitceePae.text);
    SharedPreferenceUtil().addStringToSF("goldPyitceeYwae",
        goldPyitceeYwae.text == '' ? '0.0' : goldPyitceeYwae.text);
  }
}
