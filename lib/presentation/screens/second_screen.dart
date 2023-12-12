// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concepts/presentation/screens/third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  final String title;
  final Color color;

  static const routeName = "/second";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Incremented',
                      ),
                      duration: Duration(
                        milliseconds: 300,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Decremented',
                      ),
                      duration: Duration(
                        milliseconds: 300,
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Text(
                  state.counter.toString(),
                  style: const TextStyle(
                    fontSize: 32,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(
                    Icons.remove,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(
                    Icons.add,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ThirdScreen.routeName);
              },
              color: color,
              child: const Text('Next'),
            )
          ],
        ),
      ),
    );
  }
}
