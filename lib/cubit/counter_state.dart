part of 'counter_cubit.dart';

// @immutable
// sealed class CounterState {}

// this is where the state variables are declared??

class CounterState {
  int counter;
  bool? wasIncremented;
  CounterState({
    required this.counter,
    this.wasIncremented,
  });
}
