import 'package:flutter/material.dart';

import '../../../shared/models/todo_model.dart';

class TodoTitleAndDescriptionWidget extends StatelessWidget {
  final TodoModel todo;
  const TodoTitleAndDescriptionWidget(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            todo.title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          if (todo.description != null)
            Text(
              todo.description!,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}
