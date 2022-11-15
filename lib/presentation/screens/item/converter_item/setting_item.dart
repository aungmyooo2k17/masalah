import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/common/constants/translation_constants.dart';
import 'package:masalah/presentation/reusable_widget/app_text.dart';
import 'package:masalah/presentation/screens/converter_screen/zakat_calculator_screen.dart';
import 'package:masalah/common/extensions/string_extensions.dart';
import 'package:masalah/presentation/screens/zakat_calculator/zc_screen.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const SettingItem({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BoldText(
              color: AppColors.primaryText,
              fontSize: 16.0,
              data: title,
            ),
            Icon(
              Icons.arrow_forward_outlined,
              size: 18.0,
              color: AppColors.secondaryText,
            )
          ],
        ),
      ),
    );
  }
}
