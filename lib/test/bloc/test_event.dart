part of 'test_bloc.dart';

@immutable
sealed class TestEvent {}

class IncreaseCountEvent extends TestEvent {
final int encreasingCount;

  IncreaseCountEvent({required this.encreasingCount});
  
}
class DecreamentalEvent extends TestEvent{
final int decreaseCountValue;

  DecreamentalEvent({required this.decreaseCountValue});
  
}