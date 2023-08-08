import 'package:flutter/material.dart';

import '../../../shared/models/todo_model.dart';
import '../widgets/todo_checkbox_widget.dart';
import '../widgets/todo_date_widget.dart';
import '../widgets/todo_title_and_description_widget.dart';

final List<TodoModel> todos = [
  TodoModel(title: 'Titulo 1', description: 'Descrição 1'),
  TodoModel(title: 'Titulo 2', description: 'Descrição 2'),
];

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (_, int index) {
          final TodoModel todo = todos[index];
          return Row(
            children: [
              TodoCheckboxWidget(todo),
              const SizedBox(width: 12),
              TodoTitleAndDescriptionWidget(todo),
              TodoDateWidget(todo),
            ],
          );
        },
      ),
    );
  }
}
