import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:masalah/common/no_params.dart';
import 'package:masalah/domain/usecases/get_masalah_category_list.dart';
import 'package:masalah/domain/usecases/get_masalahlist.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  final GetMasalahCategoryList getMasalahCategoryList;
  final GetMasalahList getMasalahList;
  int currentIndex = 0;
  BottomNavigationBloc(
      {required this.getMasalahCategoryList, required this.getMasalahList})
      : super(BottomNavigationInitial());

  @override
  Stream<BottomNavigationState> mapEventToState(
      BottomNavigationEvent event) async* {
    if (event is PageTapped) {
      this.currentIndex = event.index;
      yield CurrentIndexChanged(currentIndex: this.currentIndex);
      yield PageLoading();

      if (this.currentIndex == 0) {
        await getMasalahCategoryList(NoParams());
        await getMasalahList(NoParams());
        yield FirstPageLoaded();
      }
      if (this.currentIndex == 1) {
        int data = 1;
        yield SecondPageLoaded(number: data);
      }
      if (this.currentIndex == 2) {
        int data = 1;
        yield ThirdPageLoaded(number: data);
      }
      if (this.currentIndex == 3) {
        int data = 1;
        yield FourthPageLoaded(number: data);
      }
    }
  }
}
