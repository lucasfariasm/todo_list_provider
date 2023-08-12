import 'package:flutter/material.dart';
import 'package:todo_list_provider/shared/models/todo_model.dart';
import 'package:todo_list_provider/shared/services/local_storage/todos_local_storage_service.dart';

class TodosController extends ChangeNotifier {
  final TodosLocalStorageService _todosLocalStorageService;

  TodosController(this._todosLocalStorageService);

  final List<TodoModel> todos = [];

  final List<String> doneTodos = [];

  Future<String?> loadTodos() async {
    final (String? error, List<TodoModel>? loadedTodos) =
        await _todosLocalStorageService.getTodos();

    if (error == null) {
      todos
        ..clear()
        ..addAll(loadedTodos!);

      sortTodosByDate();
    }

    return error;
  }

  void sortTodosByDate() {
    todos.sort((todoA, todoB) => todoA.date.compareTo(todoB.date));
    notifyListeners();
  }

  Future<String?> loadDoneTodos() async {
    final (String? error, List<String>? loadedDoneTodos) =
        await _todosLocalStorageService.getDoneTodos();

    if (error == null) {
      doneTodos
        ..clear()
        ..addAll(loadedDoneTodos!);
    }

    return error;
  }

  Future<String?> addTodos(TodoModel todo) async {
    todos.add(todo);

    final String? error = await saveTodo();

    if (error == null) {
      sortTodosByDate();
    }

    return error;
  }

  Future<String?> saveTodo() {
    return _todosLocalStorageService.setTodos(todos);
  }

  bool isTodoChecked(String id) {
    return doneTodos.indexWhere((checkedTodoId) => checkedTodoId == id) != -1;
  }

  Future<String?> checkTodo(String id) async {
    if (!isTodoChecked(id)) {
      doneTodos.add(id);
    } else {
      doneTodos.removeWhere((checkedTodoId) => checkedTodoId == id);
    }

    final String? error =
        await _todosLocalStorageService.setDoneTodos(doneTodos);

    if (error == null) {
      notifyListeners();
    }

    if (isTodoChecked(id)) {
      doneTodos.add(id);
    } else {
      doneTodos.removeWhere((checkedTodoId) => checkedTodoId == id);
    }

    return error;
  }
}
