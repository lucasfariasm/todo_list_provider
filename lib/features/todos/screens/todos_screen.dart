import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/features/todos/controllers/todos_controller.dart';

import '../../../shared/models/todo_model.dart';
import '../../../shared/widgets/texts/text_widget.dart';
import '../../add_todo/screens/add_todo_screen.dart';
import '../widgets/add_todo_icon_widget.dart';
import '../widgets/loading_error_widget.dart';
import '../widgets/todo_checkbox_widget.dart';
import '../widgets/todo_date_widget.dart';
import '../widgets/todo_title_and_description_widget.dart';

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

  void _goToAddTodoScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const AddTodoScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final todosController = context.watch<TodosController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
        actions: [
          AddTodoIconWidget(
            goToAddTodoScreen: _goToAddTodoScreen,
          ),
        ],
      ),
      body: isLoading || error != null
          ? LoadingErrorWidget(
              isLoading: isLoading,
              error: error,
              loadTodosAndDoneTodos: loadTodosAndDoneTodos,
            )
          : todosController.todos.isEmpty
              ? const Center(
                  child: TextWidget('Você ainda não possui nenhuma tarefa'),
                )
              : ListView.builder(
                  itemCount: todosController.todos.length,
                  itemBuilder: (_, int index) {
                    final TodoModel todo = todosController.todos[index];
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
