import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/main.dart';
import 'package:masalah/masalah_app.dart';

import 'app_text.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BoldText(
          data: "No internet connection.",
          fontSize: 14,
          color: AppColors.primaryText,
        ),
        SizedBox(
          height: 16,
        ),
        OutlinedButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => MasalahApp()),
                  (Route<dynamic> route) => false);
            },
            child: Text("Try again!"))
      ],
    );
  }
}
