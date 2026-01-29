part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class TodoLoadTodosEvent extends TodoEvent {

}
class TodoToggleEvent extends TodoEvent {
  final int id;

  const TodoToggleEvent({required this.id});
  @override
  List<Object> get props => [id];
}