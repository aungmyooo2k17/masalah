import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/common/constants/translation_constants.dart';
import 'package:masalah/presentation/reusable_widget/app_bar.dart';
import 'package:masalah/presentation/screens/converter_screen/zakat_list_screen.dart';
import 'package:masalah/presentation/screens/item/converter_item/setting_item.dart';
import 'package:masalah/common/extensions/string_extensions.dart';
import 'package:masalah/presentation/screens/zakat_calculator/zc_screen.dart';
import 'package:masalah/util/share_preference_util.dart';

class ConverterScreen extends StatelessWidget {
  const ConverterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppTopBar(
          enableBackBtn: true,
          title: TranslationConstants.tools.t(context) ?? "",
          bgColor: AppColors.bgColor,
          textColor: AppColors.primaryText,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SettingItem(
                title: TranslationConstants.zakatCalculator.t(context) ?? "",
                onTap: () {
                  SharedPreferenceUtil().clearSharePrefZakatData();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ZCScreen()));
                },
              ),
              SettingItem(
                title: "Zakat List",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ZakatListScreen()));
                },
              )
            ],
          ),
        ));
  }
}
