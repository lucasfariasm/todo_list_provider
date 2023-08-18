import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/features/todos/controllers/todos_controller.dart';
import 'package:todo_list_provider/shared/mixins/snack_bar_mixin.dart';
import 'package:todo_list_provider/shared/models/todo_model.dart';
import 'package:todo_list_provider/shared/widgets/texts/text_widget.dart';

import '../../../shared/widgets/inputs/text_input_widget.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> with SnackBarMixin {
  final _formKey = GlobalKey<FormState>();

  final _titleTEC = TextEditingController();
  final _titleFN = FocusNode();

  final _descriptionTEC = TextEditingController();
  final _descriptionFN = FocusNode();

  final _todoDateTEC = TextEditingController();
  final _todoDateFN = FocusNode();

  late DateTime todoDate;

  @override
  void dispose() {
    _titleTEC.dispose();
    _titleFN.dispose();

    _descriptionTEC.dispose();
    _descriptionFN.dispose();

    _todoDateTEC.dispose();
    _todoDateFN.dispose();

    super.dispose();
  }

  Future<void> _addTodo() async {
    if (_formKey.currentState!.validate()) {
      final todoController = Provider.of<TodosController>(
        context,
        listen: false,
      );
      final String? error = await todoController.addTodos(
        TodoModel(
          title: _titleTEC.text,
          description: _descriptionTEC.text,
          cDate: todoDate,
        ),
      );

      if (context.mounted) {
        if (error != null) {
          showSnackBar(
            error,
            context: context,
            isError: true,
          );
        } else {
          Navigator.of(context).pop();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Criar Tarefa'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextInputWidget(
                controller: TextEditingController(),
                focusNode: FocusNode(),
                label: 'Título',
              ),
            ],
          ),
        ),
      )),
    );
  }
}
