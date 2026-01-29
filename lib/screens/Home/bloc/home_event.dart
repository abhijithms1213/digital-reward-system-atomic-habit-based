part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class CounterIncrease extends HomeEvent {
  final int counter;

  CounterIncrease({required this.counter});
}
