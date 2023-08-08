// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../shared/models/todo_model.dart';

class TodoCheckboxWidget extends StatelessWidget {
  final TodoModel todo;
  const TodoCheckboxWidget(
    this.todo, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: false,
      onChanged: (bool? isDone) => print(isDone),
    );
  }
}