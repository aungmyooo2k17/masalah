part of 'stepper_bloc.dart';

class SaveRateEvent extends StepperEvent {
  final double rate;
  final double volume;

  SaveRateEvent({required this.rate, required this.volume});
}

class StepperState {
  final int currentStep;
  final double rate;
  final double volume;

  const StepperState(
      {required this.currentStep, required this.rate, required this.volume});

  factory StepperState.initial() =>
      StepperState(currentStep: 0, rate: 0.0, volume: 0.0);
}
