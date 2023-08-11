import 'dart:convert';
import 'dart:developer';

import '../../const/messages_const.dart';
import '../../errors/local_storage_exceptions.dart';
import '../../models/todo_model.dart';
import 'local_storage_service.dart';

class TodosLocalStorageService {
  final String todosKey = "todos";
  final LocalStorageService _localStorageService;

  TodosLocalStorageService(this._localStorageService);

  Future<String?> setTodos(List<TodoModel> todos) async {
    try {
      final String data = jsonEncode(
        todos.map((todo) => todo.toMap()).toList(),
      );

      await _localStorageService.set(todosKey, data);

      return null;
    } on LocalStorageException {
      return "Erro ao salvar tarefas.";
    } catch (error, st) {
      log(
        "Error saving todos",
        error: error,
        stackTrace: st,
      );
      return defaultErrorMessage;
    }
  }

  Future<(String? error, List<TodoModel>? todos)> getTodos() async {
    try {
      final String? todosJson = await _localStorageService.get(todosKey);

      if (todosJson != null) {
        final todos = (jsonDecode(todosJson) as List)
            .map<TodoModel>(
              (todo) => TodoModel.fromMap(todo),
            )
            .toList();
        return (null, todos);
      }

      return (null, <TodoModel>[]);
    } on LocalStorageException {
      return ("Erro ao carregar tarefas.", null);
    } catch (error, st) {
      log(
        "Error loading todos",
        error: error,
        stackTrace: st,
      );
      return (defaultErrorMessage, null);
    }
  }
}
