import 'package:flutter/material.dart';

import '../../../shared/models/todo_model.dart';
import '../../../shared/widgets/texts/text_widget.dart';

class TodoDateWidget extends StatelessWidget {
  final TodoModel todo;
  const TodoDateWidget(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: TextWidget(
        todo.date.toIso8601String(),
      ),
    );
  }
}
