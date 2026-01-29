part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class CounterState extends HomeInitial{
  final int counter;

  CounterState({required this.counter});
}