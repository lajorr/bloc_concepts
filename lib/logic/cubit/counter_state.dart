part of 'counter_cubit.dart';

// @immutable
// sealed class CounterState {}

// this is where the state variables are declared??

class CounterState extends Equatable {
  final int counter;
  final bool? wasIncremented;
  const CounterState({
    required this.counter,
    this.wasIncremented,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        counter,
        wasIncremented,
      ];
}
