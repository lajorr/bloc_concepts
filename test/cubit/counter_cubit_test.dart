import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_concepts/cubit/counter_cubit.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  // a group is a way of organising multiple test for features
  group('Counter Cubit', () {
    late CounterCubit counterCubit;

    setUp(() {
      // used to instantiate the objects we willl be working with

      counterCubit = CounterCubit();
    });
    tearDown(() {
      //  this function will be called after each time the test is run
      counterCubit.close();
    });

    test('the initial state for CounterCubit is CounterState(counter: 0)', () {
      // this is where the actual testing is done
      // the purpose of testing is to check where the aquired output matches the expected output

      // expect(actual, matcher)
      // actual -> actual value recieved
      // matcher -> expected valu

      expect(
        counterCubit.state,
        const CounterState(counter: 0),
      );
    });

    // to run test on bloc/ cubit components
    blocTest(
      'the cubit should emit a CounterState(counter:1, wasIncremented:true) when cubit.increment() function is called.',
      build: () {
        // this function returns the current instance counter cubic
        return counterCubit;
      },
      act: (cubit) {
        // takes a cubit and returns the action applied on it
        return cubit.increment();
      },
      expect: () {

        // this should return a list as it checks some sort of order the output came in ?? idk
        return [
          const CounterState(
            counter: 1,
            wasIncremented: true,
          )
        ];
      },
    );
    blocTest(
      'the cubit should emit a CounterState(counter:-1, wasIncremented:false) when cubit.decerement() function is called.',
      build: () {
        // this function returns the current instance counter cubic
        return counterCubit;
      },
      act: (cubit) {
        // takes a cubit and returns the action applied on it
        return cubit.decrement();
      },
      expect: () {
        return [
          const CounterState(
            counter: -1,
            wasIncremented: false,
          )
        ];
      },
    );
  });
}
