part of 'stepper_bloc.dart';

abstract class StepperEvent {}

class ContinueEvent extends StepperEvent {}

class BackEvent extends StepperEvent {}
