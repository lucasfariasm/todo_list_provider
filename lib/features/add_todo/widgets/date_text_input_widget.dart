// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_list_provider/shared/widgets/inputs/text_input_widget.dart';

class DateTextInputWidget extends StatelessWidget {
  final TextEditingController todoDateTEC;
  final FocusNode todoDateFN;
  final void Function(DateTime date) setDate;

  const DateTextInputWidget({
    Key? key,
    required this.todoDateTEC,
    required this.todoDateFN,
    required this.setDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInputWidget(
      controller: todoDateTEC,
      focusNode: todoDateFN,
      label: 'Data',
      validator: (String? newTodoDate) {
        if (newTodoDate == null || newTodoDate.isEmpty) {
          return 'Você precisa adicionar uma data para a tarefa';
        }
        return null;
      },
      textInputAction: TextInputAction.send,
      readOnly: true,
      onTap: () async {
        final DateTime? date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            const Duration(days: 365 * 100),
          ),
        );
        String stringDate = '';

        if (date != null) {
          setDate(date);
          stringDate = date.toIso8601String();
        }

        todoDateTEC.text = stringDate;
      },
    );
  }
}
