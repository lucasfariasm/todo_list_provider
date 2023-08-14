import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/features/todos/controllers/todos_controller.dart';

import '../../../shared/models/todo_model.dart';
import '../widgets/todo_checkbox_widget.dart';
import '../widgets/todo_date_widget.dart';
import '../widgets/todo_title_and_description_widget.dart';

final List<TodoModel> todos = [
  TodoModel(title: 'Titulo 1', description: 'Descrição 1'),
  TodoModel(title: 'Titulo 2', description: 'Descrição 2'),
];

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadTodosAndDoneTodos();
    });
    super.initState();
  }

  Future<void> loadTodosAndDoneTodos() async {
    isLoading = true;
    error = null;

    final todosController = context.read<TodosController>();

    final String? errorLoadingTodos = await todosController.loadTodos();

    final String? errorLoadingDoneTodos = await todosController.loadDoneTodos();

    if (errorLoadingTodos != null || errorLoadingDoneTodos != null) {
      setState(() {
        error = errorLoadingTodos ?? errorLoadingDoneTodos;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

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
