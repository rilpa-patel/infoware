import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

abstract class CounterState extends Equatable {
  final int count;

  const CounterState(this.count);

  @override
  List<Object?> get props => [count];
}

class InitialState extends CounterState {
  const InitialState() : super(0);
}

class UpdatedState extends CounterState {
  const UpdatedState(int count) : super(count);
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const InitialState());

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield UpdatedState(state.count + 1);
    } else if (event is DecrementEvent) {
      yield UpdatedState(state.count - 1);
    }
  }
}
