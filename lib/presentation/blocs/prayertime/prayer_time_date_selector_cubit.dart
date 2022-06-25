import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:masalah/presentation/blocs/prayertime/prayertime_cubit.dart';


class PrayerTimeDateSelectorCubit extends Cubit<DateTime> {
  PrayerTimeDateSelectorCubit() : super(DateTime.now());
  

  void incrementDate() =>  emit(state.add(Duration(days: 1)));
    
  void decrementDate() => emit(state.subtract(Duration(days: 1)));
  


  DateTime get getCurrentState => state;


  void changeDate(DateTime dateTime)=> emit(dateTime);
  

  void resetDate() {
    emit(DateTime.now()); 
  }
}
