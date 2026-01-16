part of 'test_bloc.dart';

@immutable
sealed class TestState {}

final class TestInitial extends TestState {}

class CounterTestState extends TestState{
  final int currentState;

  CounterTestState({required this.currentState});
  
}
