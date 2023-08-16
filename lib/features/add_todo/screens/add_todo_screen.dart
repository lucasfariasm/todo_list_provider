import 'package:flutter/material.dart';
import 'package:todo_list_provider/shared/widgets/texts/text_widget.dart';

import '../../../shared/widgets/inputs/text_input_widget.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _formKey = GlobalKey<FormState>();
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
