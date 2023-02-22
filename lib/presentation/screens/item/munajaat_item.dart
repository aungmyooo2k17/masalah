import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/presentation/reusable_widget/app_text.dart';

import '../munajaat/munajaat_detail_screen.dart';

class MunajaatItem extends StatelessWidget {
  const MunajaatItem({Key? key, required this.no}) : super(key: key);

  final int no;

  @override
  Widget build(BuildContext context) {
    List days = ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri'];
    List pages = [3, 16, 30, 42, 55, 66, 77];
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => MunajaatDetailPdf(toPage: pages[no])),
        );
      },
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
              data: "Day: ${days[no]}",
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
