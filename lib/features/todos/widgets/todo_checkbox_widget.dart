import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/features/todos/controllers/todos_controller.dart';

import '../../../shared/models/todo_model.dart';

class TodoCheckboxWidget extends StatelessWidget {
  final TodoModel todo;
  const TodoCheckboxWidget(
    this.todo, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todosController = context.watch<TodosController>();
    return Checkbox(
      value: todosController.isTodoChecked(todo.id),
      onChanged: (bool? isDone) => todosController.checkTodo(todo.id),
    );
  }
}
