import 'package:flutter/material.dart';
import 'package:masalah/presentation/screens/al_quran/al_quran_pdf.dart';

import 'constant/al_quran_constant.dart';
import 'widget/al_quran_item.dart';

class ParaScreen extends StatelessWidget {
  const ParaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: AlQuranConstant.juzs.length,
        itemBuilder: (context, index) {
          var data = AlQuranConstant.juzs[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => AlQuranPdf(
                          toPage: AlQuranConstant.juzs[index].page + 1,
                        )),
              );
            },
            child: AlQuranListItem(
              no: index + 1,
              title: data.enTitle,
              subTitle: data.enJuz,
              arbTitle: data.arbTitle,
            ),
          );
        },
      ),
    );
  }
}
