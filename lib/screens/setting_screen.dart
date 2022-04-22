import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/common/extensions/string_extensions.dart';
import 'package:masalah/reusable_widget/app_bar.dart';
import 'package:masalah/reusable_widget/app_text.dart';

import '../common/constants/languages.dart';
import '../common/constants/translation_constants.dart';
import '../presentation/blocs/language/language_bloc.dart';

class SettingScreen extends StatelessWidget {
 
  

  SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppTopBar(
          enableBackBtn: true,
          title: "Setting",
          bgColor: AppColors.bgColor,
          textColor: AppColors.primaryText,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  buildLanguageDialog(context);
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(TranslationConstants.gold.t(context)!),
                      BoldText(
                        color: AppColors.primaryText,
                        fontSize: 16.0,
                        data: "Zakat Calculator",
                      ),
                      Icon(
                        Icons.arrow_forward_outlined,
                        size: 18.0,
                        color: AppColors.secondaryText,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('Choose Your Language'),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(Languages.languages[index].value),
                        onTap: () {
                          BlocProvider.of<LanguageBloc>(context).add(
                            ToggleLanguageEvent(
                              Languages.languages[index],
                            ),
                          );
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: Languages.languages.length),
            ),
          );
        });
  }
}
