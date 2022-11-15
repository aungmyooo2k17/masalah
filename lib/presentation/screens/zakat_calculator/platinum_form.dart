import 'package:flutter/material.dart';

import '../../../common/constants/color_constant.dart';
import '../../../common/constants/translation_constants.dart';
import '../../../db/db_helper.dart';
import '../../../util/share_preference_util.dart';
import '../../reusable_widget/app_text.dart';
import '../../../common/extensions/string_extensions.dart';

class PlatinumForm extends StatefulWidget {
  const PlatinumForm({Key? key}) : super(key: key);

  @override
  State<PlatinumForm> createState() => PlatinumFormState();
}

class PlatinumFormState extends State<PlatinumForm> {
  final whiteSilverAkhoutKyatthar = TextEditingController();
  final whiteSilverAkhoutPae = TextEditingController();
  final whiteSilverAkhoutYwae = TextEditingController();
  final whiteSilverAhtaeKyatthar = TextEditingController();
  final whiteSilverAhtaePae = TextEditingController();
  final whiteSilverAhtaeYwae = TextEditingController();
  final whiteSilverPyitceeKyatthar = TextEditingController();
  final whiteSilverPyitceePae = TextEditingController();
  final whiteSilverPyitceeYwae = TextEditingController();

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
          data: TranslationConstants.platinum.t(context) ?? "",
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
                              controller: whiteSilverPyitceeKyatthar,
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
                              controller: whiteSilverPyitceePae,
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
                              controller: whiteSilverPyitceeYwae,
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
                              controller: whiteSilverAhtaeKyatthar,
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
                              controller: whiteSilverAhtaePae,
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
                              controller: whiteSilverAhtaeYwae,
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
                              controller: whiteSilverAkhoutKyatthar,
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
                              controller: whiteSilverAkhoutPae,
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
                              controller: whiteSilverAkhoutYwae,
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
            data: TranslationConstants.platinumDescription.t(context) ?? "",
          )
        ],
      ),
    );
  }

  save() {
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.whiteSilverAkhoutKyatthar,
        whiteSilverAkhoutKyatthar.text == ''
            ? '0.0'
            : whiteSilverAkhoutKyatthar.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.whiteSilverAkhoutPae,
        whiteSilverAkhoutPae.text == '' ? '0.0' : whiteSilverAkhoutPae.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.whiteSilverAkhoutYwae,
        whiteSilverAkhoutYwae.text == '' ? '0.0' : whiteSilverAkhoutYwae.text);
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.whiteSilverAhtaeKyatthar,
        whiteSilverAhtaeKyatthar.text == ''
            ? '0.0'
            : whiteSilverAhtaeKyatthar.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.whiteSilverAhtaePae,
        whiteSilverAhtaePae.text == '' ? '0.0' : whiteSilverAhtaePae.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.whiteSilverAhtaeYwae,
        whiteSilverAhtaeYwae.text == '' ? '0.0' : whiteSilverAhtaeYwae.text);
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.whiteSilverPyitceeKyatthar,
        whiteSilverPyitceeKyatthar.text == ''
            ? '0.0'
            : whiteSilverPyitceeKyatthar.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.whiteSilverPyitceePae,
        whiteSilverPyitceePae.text == '' ? '0.0' : whiteSilverPyitceePae.text);
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.whiteSilverPyitceeYwae,
        whiteSilverPyitceeYwae.text == ''
            ? '0.0'
            : whiteSilverPyitceeYwae.text);
  }

  get() async {
    String whiteSilverAkhoutKyattharTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.whiteSilverAkhoutKyatthar);
    whiteSilverAkhoutKyatthar.text = whiteSilverAkhoutKyattharTxt == '0.0'
        ? ''
        : whiteSilverAkhoutKyattharTxt;
    String whiteSilverAkhoutPaeTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.whiteSilverAkhoutPae);
    whiteSilverAkhoutPae.text =
        whiteSilverAkhoutPaeTxt == '0.0' ? '' : whiteSilverAkhoutPaeTxt;
    String whiteSilverAkhoutYwaeTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.whiteSilverAkhoutYwae);
    whiteSilverAkhoutYwae.text =
        whiteSilverAkhoutYwaeTxt == '0.0' ? '' : whiteSilverAkhoutYwaeTxt;
    String whiteSilverAhtaeKyattharTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.whiteSilverAhtaeKyatthar);
    whiteSilverAhtaeKyatthar.text =
        whiteSilverAhtaeKyattharTxt == '0.0' ? '' : whiteSilverAhtaeKyattharTxt;
    String whiteSilverAhtaePaeTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.whiteSilverAhtaePae);
    whiteSilverAhtaePae.text =
        whiteSilverAhtaePaeTxt == '0.0' ? '' : whiteSilverAhtaePaeTxt;
    String whiteSilverAhtaeYwaeTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.whiteSilverAhtaeYwae);
    whiteSilverAhtaeYwae.text =
        whiteSilverAhtaeYwaeTxt == '0.0' ? '' : whiteSilverAhtaeYwaeTxt;
    String whiteSilverPyitceeKyattharTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.whiteSilverPyitceeKyatthar);
    whiteSilverPyitceeKyatthar.text = whiteSilverPyitceeKyattharTxt == '0.0'
        ? ''
        : whiteSilverPyitceeKyattharTxt;
    String whiteSilverPyitceePaeTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.whiteSilverPyitceePae);
    whiteSilverPyitceePae.text =
        whiteSilverPyitceePaeTxt == '0.0' ? '' : whiteSilverPyitceePaeTxt;
    String whiteSilverPyitceeYwaeTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.whiteSilverPyitceeYwae);
    whiteSilverPyitceeYwae.text =
        whiteSilverPyitceeYwaeTxt == '0.0' ? '' : whiteSilverPyitceeYwaeTxt;
  }
}
