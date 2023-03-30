import 'package:flutter/material.dart';
import 'package:masalah/presentation/screens/al_quran/constant/al_quran_constant.dart';
import 'package:masalah/presentation/screens/al_quran/widget/al_quran_item.dart';

import 'al_quran_pdf.dart';

class SurahList extends StatelessWidget {
  const SurahList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: AlQuranConstant.surahs.length,
        itemBuilder: (context, index) {
          var data = AlQuranConstant.surahs[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => AlQuranPdf(
                          toPage: AlQuranConstant.surahs[index].toPage + 1,
                        )),
              );
            },
            child: AlQuranListItem(
              no: index + 1,
              title: data.entitle,
              subTitle: "${data.enTranslation}",
              arbTitle: data.arbtitle,
            ),
          );
        },
      ),
    );
  }
}
