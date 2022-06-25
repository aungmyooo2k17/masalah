import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masalah/common/constants/color_constant.dart';
import 'package:masalah/prayer_time/prayer_time_wrapper.dart';
import 'package:masalah/presentation/blocs/prayertime/prayertime_cubit.dart';
import 'package:masalah/presentation/reusable_widget/app_text.dart';
import 'package:masalah/presentation/screens/prayer_time/prayer_item_widget.dart';

class PrayerTimeTable extends StatelessWidget {
  final Function(String) onMutePressed;
  const PrayerTimeTable({Key? key,required this.onMutePressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
       return Container(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  margin:
                      EdgeInsets.only(left: 16.0, top: 8, right: 16.0, bottom: 8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, top: 8, right: 16.0, bottom: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: RegularText(
                                textAlign: TextAlign.left,
                                color: AppColors.primaryText,
                                fontSize: 14.0,
                                data: "Prayer",
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: RegularText(
                                color: AppColors.primaryText,
                                fontSize: 14.0,
                                data: "Adhan",
                              ),
                            ),
                          ],
                        ),
                      ),

                     

                      BlocBuilder<PrayertimeCubit, PrayertimeState>(
                        builder: (context, state) {
                        if(state is PrayerTimeListLoaded){
                              return ListView(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: state.data.map((e) {
                                return PrayerItemWidget(
                                  key: UniqueKey(),
                                  uiPrayerItem: e,
                                  onMutePressed: (prayerName) {
                                    onMutePressed(prayerName);
                                  
                                  },
                                );
                              }).toList());
                        }
                        return SizedBox.shrink();
                          
                        },
                      ),
                    ],
                  
                ));
  }
}