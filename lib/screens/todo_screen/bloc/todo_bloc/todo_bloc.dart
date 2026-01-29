import 'package:bloc/bloc.dart';
import 'package:drewardsystem/screens/todo_screen/model/todo_model.dart';
import 'package:drewardsystem/screens/todo_screen/repository/todo_repo.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepo todoRepo;
  TodoBloc({required this.todoRepo}) : super(TodoInitial()) {
    on<TodoLoadTodosEvent>((event, emit) async {
      emit(TodoLoadingState());
      try {
        final List<TodoModel> todos = await todoRepo.fetchTodos();
        emit(TodoLoadedState(todos: todos));
      } catch (_) {
        emit(TodoErrorState());
      }
    });
    on<TodoToggleEvent>((event, emit) {
      if (state is TodoLoadedState) {
        final currentState = state as TodoLoadedState;
        final updatedTodos = currentState.todos.map((todo) {
          if (todo.id == event.id) {
            return TodoModel(
              id: todo.id,
              description: todo.description,
              isCompleted: !todo.isCompleted,
            );
          }
          return todo;
        }).toList();
        emit(TodoLoadedState(todos: updatedTodos));
      }
    });
  }
}
