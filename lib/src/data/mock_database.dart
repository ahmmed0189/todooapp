import 'package:todooapp/src/data/database_repository.dart';
import 'package:todooapp/src/futures/presentation/todo.dart';

class MockDatabase implements DatabaseRepository {
  List<Todo> todos = [];

  @override
  void addTodo(Todo todo) {
    todos.add(todo);
  }

  @override
  List<Todo> getTodos() {
    return todos;
  }

  @override
  void removeTodo(Todo todo) {
    todos.remove(todo);
  }

  @override
  void updateTodo(Todo todo, bool isDone) {
    todo.isDone = isDone;
  }
}
