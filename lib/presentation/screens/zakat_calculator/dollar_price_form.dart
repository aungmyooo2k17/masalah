import 'package:flutter/material.dart';
import 'package:masalah/db/db_helper.dart';
import 'package:masalah/util/share_preference_util.dart';

import '../../../common/constants/color_constant.dart';
import '../../../common/constants/translation_constants.dart';
import '../../../network/remote_data_source.dart';
import '../../../util/zakat_calculator_util.dart';
import '../../reusable_widget/app_text.dart';
import '../../../common/extensions/string_extensions.dart';

class DollarPriceForm extends StatefulWidget {
  DollarPriceForm({Key? key}) : super(key: key);

  @override
  State<DollarPriceForm> createState() => _DollarPriceFormState();
}

class _DollarPriceFormState extends State<DollarPriceForm> {
  bool _optionAuto = true;

  double goldRate = 0.0;
  double silverRate = 0.0;
  double usdRate = 0.0;

  final goldPrice = TextEditingController();
  final silverPrice = TextEditingController();

  final RemoteDataSource _apiResponse = RemoteDataSource();

  @override
  void initState() {
    // _apiResponse.getUSDRate().then((value) {
    //   value = value.replaceAll(',', '');
    //   usdRate = double.parse(value);
    // });
    // _apiResponse.getGoldRate().then((value) => {goldRate = value});
    // _apiResponse.getSilverRate().then((value) => {silverRate = value});
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        manulAutoSwitch(context),
        SizedBox(
          height: 24.0,
        ),
        !_optionAuto ? manualForm() : autoForm(context),
      ],
    );
  }

  Column autoForm(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            RegularText(
              data: TranslationConstants.goldRate.t(context) ?? "",
            ),
            SizedBox(
              width: 16,
            ),
            BoldText(
              data: ZakatCalculatorUtil().getRate(goldRate, usdRate).toString(),
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            RegularText(
              data: TranslationConstants.silverRate.t(context) ?? "",
            ),
            SizedBox(
              width: 16,
            ),
            BoldText(
              data:
                  ZakatCalculatorUtil().getRate(silverRate, usdRate).toString(),
            )
          ],
        )
      ],
    );
  }

  Column manualForm() {
    return Column(
      children: [
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
                data: TranslationConstants.investigateGold.t(context) ?? "",
                color: AppColors.primaryText,
              ),
              TextFormField(
                controller: goldPrice,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: ' '),
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
                data: TranslationConstants.investigateSilver.t(context) ?? "",
                color: AppColors.primaryText,
              ),
              TextFormField(
                controller: silverPrice,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: ' '),
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
    );
  }

  Row manulAutoSwitch(BuildContext context) {
    return Row(
      children: [
        RegularText(
          data: TranslationConstants.manual.t(context) ?? "",
          color: AppColors.primaryText,
        ),
        SizedBox(
          width: 8,
        ),
        Switch(
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
          data: TranslationConstants.auto.t(context) ?? "",
          color: AppColors.primaryText,
        ),
      ],
    );
  }

  get() async {
    String goldPriceTxt =
        await SharedPreferenceUtil().getStringValuesSF(DatabaseHelper.goldRate);
    goldPrice.text = goldPriceTxt == '0.0' ? "" : goldPriceTxt;
    String silverPriceTxt = await SharedPreferenceUtil()
        .getStringValuesSF(DatabaseHelper.silverRate);
    silverPrice.text = silverPriceTxt == '0.0' ? "" : silverPriceTxt;
  }

  save() {
    SharedPreferenceUtil().addStringToSF(
        DatabaseHelper.goldRate, goldPrice.text == '' ? '0.0' : goldPrice.text);
    SharedPreferenceUtil().addStringToSF(DatabaseHelper.silverRate,
        silverPrice.text == '' ? '0.0' : silverPrice.text);
  }

  @override
  void dispose() {
    save();
    super.dispose();
  }
}
