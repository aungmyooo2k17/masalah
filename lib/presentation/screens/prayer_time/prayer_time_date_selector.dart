import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masalah/common/constants/color_constant.dart';

import '../../../util/date_time_util.dart';
import '../../blocs/prayertime/cubit/prayer_time_date_selector_cubit.dart';
import '../../blocs/prayertime/prayertime_cubit.dart';
import '../../reusable_widget/app_text.dart';

class PrayerTimeDateSelector extends StatelessWidget {
  const PrayerTimeDateSelector({Key? key}) : super(key: key);


  void loadPrayerTimeOnDate(BuildContext context){
  final currentSelectedDate = context.read<PrayerTimeDateSelectorCubit>().getCurrentState;
  context.read<PrayertimeCubit>().initPrayerTimeWithOffset(currentSelectedDate);
  }


  Future<void> _selectDate(BuildContext context,DateTime selectedDate) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null){
        context.read<PrayerTimeDateSelectorCubit>().changeDate(picked);
        loadPrayerTimeOnDate(context);

    }
     
  }

  @override
  Widget build(BuildContext context) {
   return  Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              margin:
                  EdgeInsets.only(left: 16.0, top: 8, right: 16.0, bottom: 8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context
                          .read<PrayerTimeDateSelectorCubit>()
                          .decrementDate();
                          loadPrayerTimeOnDate(context);
                    
                      
                    },
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: AppColors.bgBtn,
                        borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      ),
                      child: Icon(
                        Icons.arrow_back_outlined,
                        size: 18.0,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Spacer(),
                  BlocBuilder<PrayerTimeDateSelectorCubit, DateTime>(
                    builder: (context,state) {
                      return GestureDetector(
                        onTap: () {
                          _selectDate(context,state);
                     
                        },
                        child: 
                             BoldText(
                              data: DateTimeUtil()
                                  .prayerTimeHumanReadable(state),
                              fontSize: 16,
                              color: AppColors.primaryText,
                            
                          
                        ),
                      );
                    }
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      context
                          .read<PrayerTimeDateSelectorCubit>()
                          .incrementDate();
                     loadPrayerTimeOnDate(context);

                      
                    },
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: AppColors.bgBtn,
                        borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      ),
                      child: Icon(
                        Icons.arrow_forward_outlined,
                        size: 18.0,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ]));
}
}