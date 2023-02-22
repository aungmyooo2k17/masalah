import 'package:flutter/material.dart';

import 'package:masalah/common/extensions/string_extensions.dart';
import '../../../common/constants/color_constant.dart';
import '../../../common/constants/translation_constants.dart';
import '../../reusable_widget/app_bar.dart';
import '../item/munajaat_item.dart';

class MunaJaatScreen extends StatelessWidget {
  const MunaJaatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppTopBar(
        showSetting: false,
        title: "Munajaat",
        bgColor: AppColors.bgColor,
        textColor: AppColors.primaryText,
        enableBackBtn: true,
      ),
      body: list(),
    );
  }

  list() {
    return Column(
      children: [
        ...List.generate(
          7,
          (index) {
            return MunajaatItem(no: index);
          },
        ),
      ],
    );
  }
}
