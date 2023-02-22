import 'package:flutter/material.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/presentation/screens/al_quran/al_quran_home.dart';
import 'package:masalah/presentation/screens/converter_screen.dart';
import 'package:masalah/presentation/screens/manzil_pdf.dart';
import 'package:masalah/presentation/screens/masalah_category_screen.dart';
import '../../reusable_widget/app_bar.dart';
import '../munajaat/munajaat_screen.dart';
import './tool_item.dart';

class ToolListPage extends StatelessWidget {
  const ToolListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(
        title: "Home",
        bgColor: AppColors.bgColor,
        textColor: AppColors.primaryText,
      ),
      backgroundColor: AppColors.bgColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            ToolItem(
              image: 'assets/images/quran_icon.png',
              title: 'Al Quran',
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AlQuranHome()));
              },
            ),
            ToolItem(
              image: 'assets/images/masalah_icon.png',
              title: 'Masalah',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MasalahCategoryScreen()));
              },
            ),
            ToolItem(
              image: 'assets/images/mugu_icon.png',
              title: 'Manzil',
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ManzilPdf()));
              },
            ),
            ToolItem(
              image: 'assets/images/manzil_icon.png',
              title: 'Mugu',
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MunaJaatScreen()));
              },
            ),
            ToolItem(
              image: 'assets/images/zakat_icon.png',
              title: 'Zakat',
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ConverterScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
