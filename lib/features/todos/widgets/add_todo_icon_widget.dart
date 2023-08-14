// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AddTodoIconWidget extends StatelessWidget {
  final void Function() goToAddTodoScreen;
  const AddTodoIconWidget({
    Key? key,
    required this.goToAddTodoScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: goToAddTodoScreen,
      icon: const Icon(
        Icons.add,
        color: Colors.white,
        size: 35,
      ),
    );
  }
}
