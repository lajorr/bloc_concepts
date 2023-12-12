import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

// this is where the functions are  defined ??

class CounterCubit extends Cubit<CounterState> {
  // final InternetCubit internetCubit;
  // StreamSubscription?
  //     internetStreamSubscription; // manually close garnu parxa !!
  CounterCubit()
      : super(
          const CounterState(
            counter: 0,
          ),
        ) {
    // monitorInternetConnection();
  }

  // StreamSubscription<InternetState> monitorInternetConnection() {
  //   return internetStreamSubscription = internetCubit.stream.listen(
  //     (internetState) {
  //       if (internetState is InternetConnected &&
  //           internetState.connectionType == ConnectionType.wifi) {
  //         increment();
  //       } else if (internetState is InternetConnected &&
  //           internetState.connectionType == ConnectionType.mobile) {
  //         decrement();
  //       }
  //     },
  //   );
  // }

  // @override
  // Future<void> close() {
  //   // TODO: implement close
  //   internetStreamSubscription!.cancel();
  //   return super.close();
  // }

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
