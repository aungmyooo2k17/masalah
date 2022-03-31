part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class BottomNavigationInitial extends BottomNavigationState {}

class CurrentIndexChanged extends BottomNavigationState {
  final int currentIndex;

  CurrentIndexChanged({required this.currentIndex});

  @override
  String toString() => 'CurrentIndexChanged to $currentIndex';
}

class PageLoading extends BottomNavigationState {
  @override
  String toString() => 'PageLoading';
}

class FirstPageLoaded extends BottomNavigationState {
  FirstPageLoaded();

  @override
  String toString() => 'MasalahListPageLoaded Loaded';
}

class SecondPageLoaded extends BottomNavigationState {
  final int number;

  SecondPageLoaded({required this.number});

  @override
  String toString() => 'SecondPageLoaded with number: $number';
}

class ThirdPageLoaded extends BottomNavigationState {
  final int number;

  ThirdPageLoaded({required this.number});

  @override
  String toString() => 'SecondPageLoaded with number: $number';
}

class FourthPageLoaded extends BottomNavigationState {
  final int number;

  FourthPageLoaded({required this.number});

  @override
  String toString() => 'SecondPageLoaded with number: $number';
}
