import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/model/masalah.dart';
import 'package:masalah/presentation/reusable_widget/app_text.dart';
import 'package:masalah/presentation/screens/masalah_detail_screen.dart';


class MasalahItem extends StatelessWidget {
  const MasalahItem({Key? key, required this.masalah}) : super(key: key);

  final Masalah masalah;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MasalahDetailScreen(masalah: masalah)));
      },
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BoldText(
                  color: AppColors.primaryText,
                  fontSize: 16.0,
                  data: masalah.masalahTitle!,
                ),
                Icon(
                  Icons.arrow_forward_outlined,
                  size: 18.0,
                  color: AppColors.secondaryText,
                )
              ],
            ),
            RegularText(
              data: masalah.masalahDescription!,
              fontSize: 12,
              color: AppColors.secondaryText,
              maxLine: 2,
            )
          ],
        ),
      ),
    );
  }
}
