import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, CounterTestState> {
  TestBloc() : super(CounterTestState(currentState: 0)) {
    on<IncreaseCountEvent>(
      (event, emit) => emit(CounterTestState(currentState: event.encreasingCount + 1),)
    );
    on<DecreamentalEvent>((event, emit) => emit(CounterTestState(currentState: event.decreaseCountValue-1)),);
  }
}
