import 'package:drewardsystem/screens/todo_screen/model/todo_model.dart';

class TodoRepo {
  Future<List<TodoModel>> fetchTodos() async {
    Future.delayed(Duration(seconds: 2));
    return [
      TodoModel(id: 1, description: 'desc 1', isCompleted: false),
      TodoModel(id: 2, description: 'desc 2', isCompleted: false),
      TodoModel(id: 3, description: 'desc 3', isCompleted: true),
    ];
  }
}
