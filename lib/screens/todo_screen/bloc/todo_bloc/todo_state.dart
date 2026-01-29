part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();
  
  @override
  List<Object> get props => [];
}

final class TodoInitial extends TodoState {}

class TodoLoadedState extends TodoState {
  final List<TodoModel> todos;

  const TodoLoadedState({required this.todos});
  @override
  List<Object> get props => [todos];
}
class TodoErrorState extends TodoState {
  
}
class TodoLoadingState extends TodoState {
  
}