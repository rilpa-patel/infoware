import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoware/helper/bloc.dart';



class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Count: ${state.count}',
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 16),
                TextButton(
                  child: const Text('Increment'),
                  onPressed: () {
                    counterBloc.add(IncrementEvent());
                  },
                ),
                TextButton(
                  child: const Text('Decrement'),
                  onPressed: () {
                    counterBloc.add(DecrementEvent());
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
