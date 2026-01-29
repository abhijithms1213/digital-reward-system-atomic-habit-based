import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, CounterState> {
  HomeBloc() : super(CounterState(counter: 0)) {
    on<CounterIncrease>((event, emit) {
      emit(CounterState(counter: event.counter + 1));
    });
  }
}