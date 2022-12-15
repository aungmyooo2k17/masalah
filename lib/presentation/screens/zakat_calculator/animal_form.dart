import 'package:flutter/material.dart';
import 'package:masalah/db/db_helper.dart';
import 'package:masalah/util/share_preference_util.dart';

import '../../../common/constants/color_constant.dart';
import '../../../common/constants/translation_constants.dart';
import '../../reusable_widget/app_text.dart';
import '../../../common/extensions/string_extensions.dart';

class AnimalForm extends StatefulWidget {
  AnimalForm({Key? key}) : super(key: key);

  @override
  State<AnimalForm> createState() => _AnimalFormState();
}

class _AnimalFormState extends State<AnimalForm> {
  final kalaout = TextEditingController();
  final kywae = TextEditingController();
  final nwar = TextEditingController();
  final sate = TextEditingController();
  final thoe = TextEditingController();

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  void dispose() {
    save();
    kalaout.dispose();
    kywae.dispose();
    nwar.dispose();
    sate.dispose();
    thoe.dispose();
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
        camel(context),
        SizedBox(
          height: 24.0,
        ),
        buffaloCow(context),
        SizedBox(
          height: 24.0,
        ),
        goatSheep(context),
      ],
    );
  }

  Container goatSheep(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoldText(
            data: TranslationConstants.satethoe.t(context) ?? "",
            color: AppColors.primaryText,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: sate,
            decoration: InputDecoration(
                labelText: TranslationConstants.sate.t(context) ?? ""),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: thoe,
            decoration: InputDecoration(
                labelText: TranslationConstants.thoe.t(context) ?? ""),
          ),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }

  Container buffaloCow(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoldText(
            data: TranslationConstants.kywaenwar.t(context) ?? "",
            color: AppColors.primaryText,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: kywae,
            decoration: InputDecoration(
                labelText: TranslationConstants.kywae.t(context) ?? ""),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: nwar,
            decoration: InputDecoration(
                labelText: TranslationConstants.nwar.t(context) ?? ""),
          ),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }

  Container camel(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoldText(
            data: TranslationConstants.kalaout.t(context) ?? "",
            color: AppColors.primaryText,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: kalaout,
            decoration: InputDecoration(
                labelText: TranslationConstants.kalaout.t(context) ?? ""),
          ),
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
            data: TranslationConstants.animalDescription.t(context) ?? "",
          )
        ],
      ),
    );
  }

  get() async {
    String kalaoutTxt =
        await SharedPreferenceUtil().getStringValuesSF(DatabaseHelper.kalaout);
    String kywaeTxt =
        await SharedPreferenceUtil().getStringValuesSF(DatabaseHelper.kywae);
    String nwarTxt =
        await SharedPreferenceUtil().getStringValuesSF(DatabaseHelper.nwar);
    String sateTxt =
        await SharedPreferenceUtil().getStringValuesSF(DatabaseHelper.sate);
    String thoeTxt =
        await SharedPreferenceUtil().getStringValuesSF(DatabaseHelper.thoe);
    kalaout.text = kalaoutTxt == '0.0' ? '' : kalaoutTxt;
    kywae.text = kywaeTxt == '0.0' ? '' : kywaeTxt;
    nwar.text = nwarTxt == '0.0' ? '' : nwarTxt;
    sate.text = sateTxt == '0.0' ? '' : sateTxt;
    thoe.text = thoeTxt == '0.0' ? '' : thoeTxt;
  }

  save() {
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.kalaout, kalaout.text == '' ? '0' : kalaout.text);
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.kywae, kywae.text == '' ? '0' : kywae.text);
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.nwar, nwar.text == '' ? '0' : nwar.text);
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.sate, sate.text == '' ? '0' : sate.text);
    SharedPreferenceUtil()
        .addStringToSF(DatabaseHelper.thoe, thoe.text == '' ? '0' : thoe.text);
  }
}
