import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

// this is where the functions are  defined ??

class CounterCubit extends Cubit<CounterState> {
  CounterCubit()
      : super(
          const CounterState(
            counter: 0,
          ),
        );

  // state contains the current state values
  // state.counter contains the current counter value.

  void increment() => emit(
        CounterState(
          counter: state.counter + 1,
          wasIncremented: true,
        ),
      );

  void decrement() => emit(
        CounterState(
          counter: state.counter - 1,
          wasIncremented: false,
        ),
      );
}
