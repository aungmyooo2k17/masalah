import 'package:flutter/material.dart';
import 'package:masalah/db/db_helper.dart';
import 'package:masalah/util/share_preference_util.dart';

import '../../../common/extensions/string_extensions.dart';
import '../../../common/constants/color_constant.dart';
import '../../../common/constants/translation_constants.dart';
import '../../reusable_widget/app_text.dart';

class PropertyForm extends StatefulWidget {
  PropertyForm({Key? key}) : super(key: key);

  @override
  State<PropertyForm> createState() => _PropertyFormState();
}

class _PropertyFormState extends State<PropertyForm> {
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

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  void dispose() {
    save();
    realEstateSellHouse.dispose();
    realEstateSellEscort.dispose();
    realEstateSellCar.dispose();
    realEstateOther.dispose();
    rawWearhouse.dispose();
    rawHome.dispose();
    rawShop.dispose();
    rawOther.dispose();
    finishWearhouse.dispose();
    finishHome.dispose();
    finishShop.dispose();
    finishAnimal.dispose();
    finishOther.dispose();
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
        realEstate(context),
        SizedBox(
          height: 24.0,
        ),
        material(context),
        SizedBox(
          height: 24.0,
        ),
        goods(context),
      ],
    );
  }

  Container goods(BuildContext context) {
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
            data: TranslationConstants.goods.t(context) ?? "",
            color: AppColors.primaryText,
          ),
          TextFormField(
            controller: finishWearhouse,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText:
                    TranslationConstants.finishWearhouse.t(context) ?? ""),
          ),
          TextFormField(
            controller: finishHome,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: TranslationConstants.finishHome.t(context) ?? ""),
          ),
          TextFormField(
              controller: finishShop,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: TranslationConstants.finishShop.t(context) ?? "")),
          TextFormField(
              controller: finishAnimal,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText:
                      TranslationConstants.finishAnimal.t(context) ?? "")),
          TextFormField(
              controller: finishOther,
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

  Container material(BuildContext context) {
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
            data: TranslationConstants.raw.t(context) ?? "",
            color: AppColors.primaryText,
          ),
          TextFormField(
            controller: rawWearhouse,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: TranslationConstants.rawWearhouse.t(context) ?? ""),
          ),
          TextFormField(
            controller: rawHome,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: TranslationConstants.rawHome.t(context) ?? ""),
          ),
          TextFormField(
              controller: rawShop,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: TranslationConstants.rawShop.t(context) ?? "")),
          TextFormField(
              controller: rawOther,
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

  Container realEstate(BuildContext context) {
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
            data: TranslationConstants.realEstate.t(context) ?? "",
            color: AppColors.primaryText,
          ),
          TextFormField(
            controller: realEstateSellHouse,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText:
                    TranslationConstants.realEstateSellHouse.t(context) ?? ""),
          ),
          TextFormField(
            controller: realEstateSellEscort,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText:
                    TranslationConstants.realEstateSellEscort.t(context) ?? ""),
          ),
          TextFormField(
              controller: realEstateSellCar,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText:
                      TranslationConstants.realEstateSellCar.t(context) ?? "")),
          TextFormField(
              controller: realEstateOther,
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
            data: TranslationConstants.goodsDescription.t(context) ?? "",
          )
        ],
      ),
    );
  }

  get() async {
    String realEstateSellHouseTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.realEstateSellHouse);
    String realEstateSellEscortTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.realEstateSellEscort);
    String realEstateSellCarTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.realEstateSellCar);
    String realEstateOtherTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.realEstateOther);
    String rawWearhouseTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.rawWearhouse);
    String rawHomeTxt =
        await SharedPreferenceUtil().getStringValuesSF(DatabaseHelper.rawHome);
    String rawShopTxt =
        await SharedPreferenceUtil().getStringValuesSF(DatabaseHelper.rawShop);
    String rawOtherTxt =
        await SharedPreferenceUtil().getStringValuesSF(DatabaseHelper.rawOther);
    String finishWearhouseTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.finishWearhouse);
    String finishHomeTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.finishHome);
    String finishShopTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.finishShop);
    String finishAnimalTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.finishAnimal);
    String finishOtherTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.finishOther);
    realEstateSellHouse.text =
        realEstateSellHouseTxt == '0.0' ? '' : realEstateSellHouseTxt;
    realEstateSellEscort.text =
        realEstateSellEscortTxt == '0.0' ? '' : realEstateSellEscortTxt;
    realEstateSellCar.text =
        realEstateSellCarTxt == '0.0' ? '' : realEstateSellCarTxt;
    realEstateOther.text =
        realEstateOtherTxt == '0.0' ? '' : realEstateOtherTxt;
    rawWearhouse.text = rawWearhouseTxt == '0.0' ? '' : rawWearhouseTxt;
    rawHome.text = rawHomeTxt == '0.0' ? '' : rawHomeTxt;
    rawShop.text = rawShopTxt == '0.0' ? '' : rawShopTxt;
    rawOther.text = rawOtherTxt == '0.0' ? '' : rawOtherTxt;
    finishWearhouse.text =
        finishWearhouseTxt == '0.0' ? '' : finishWearhouseTxt;
    finishHome.text = finishHomeTxt == '0.0' ? '' : finishHomeTxt;
    finishShop.text = finishShopTxt == '0.0' ? '' : finishShopTxt;
    finishAnimal.text = finishAnimalTxt == '0.0' ? '' : finishAnimalTxt;
    finishOther.text = finishOtherTxt == '0.0' ? '' : finishOtherTxt;
  }

  save() {
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.realEstateSellHouse,
        realEstateSellHouse.text == '' ? '0.0' : realEstateSellHouse.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.realEstateSellEscort,
        realEstateSellEscort.text == '' ? '0.0' : realEstateSellEscort.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.realEstateSellCar,
        realEstateSellCar.text == '' ? '0.0' : realEstateSellCar.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.realEstateOther,
        realEstateOther.text == '' ? '0.0' : realEstateOther.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.rawWearhouse,
        rawWearhouse.text == '' ? '0.0' : rawWearhouse.text);
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.rawHome, rawHome.text == '' ? '0.0' : rawHome.text);
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.rawShop, rawShop.text == '' ? '0.0' : rawShop.text);
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.rawOther, rawOther.text == '' ? '0.0' : rawOther.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.finishWearhouse,
        finishWearhouse.text == '' ? '0.0' : finishWearhouse.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.finishHome,
        finishHome.text == '' ? '0.0' : finishHome.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.finishShop,
        finishShop.text == '' ? '0.0' : finishShop.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.finishAnimal,
        finishAnimal.text == '' ? '0.0' : finishAnimal.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.finishOther,
        finishOther.text == '' ? '0.0' : finishOther.text);
  }
}
