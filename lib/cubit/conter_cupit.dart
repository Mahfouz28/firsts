import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInit());

  void increment() {
    emit(CounterUpdate(state.count + 1));
  }

  void decrement() {
    emit(
      CounterUpdate(state.count - 1),
    );
  }
}
