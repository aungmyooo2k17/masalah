import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'stepper_event.dart';
part 'stepper_state.dart';

class StepperBloc extends Bloc<StepperEvent, StepperState> {
  StepperBloc(StepperState initialState) : super(initialState);

  void onContinue() {
    add(ContinueEvent());
  }

  void onBack() {
    add(BackEvent());
  }

  void onSaveRate(double rate, double volume) {
    add(SaveRateEvent(rate: rate, volume: volume));
  }

  @override
  StepperState get initialState => StepperState.initial();

  @override
  Stream<StepperState> mapEventToState(
    StepperEvent event,
  ) async* {
    final _currentState = state;
    if (event is ContinueEvent) {
      yield StepperState(
          currentStep: _currentState.currentStep + 1,
          rate: _currentState.rate,
          volume: _currentState.volume);
    } else if (event is BackEvent) {
      yield StepperState(
          currentStep: _currentState.currentStep - 1,
          rate: _currentState.rate,
          volume: _currentState.volume);
    } else if (event is SaveRateEvent) {
      yield StepperState(
          currentStep: _currentState.currentStep,
          rate: event.rate,
          volume: event.volume);
    }
  }
}
