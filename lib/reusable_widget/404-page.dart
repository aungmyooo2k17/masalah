import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';

import 'app_text.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BoldText(
        data: "Item not found.",
        fontSize: 14,
        color: AppColors.primaryText,
      ),
    );
  }
}
