// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todo_list_provider/shared/widgets/inputs/text_input_widget.dart';

class DescriptionTextInputWidget extends StatelessWidget {
  final TextEditingController descriptionTEC;
  final FocusNode descriptionFN;
  final FocusNode todoDateFN;

  const DescriptionTextInputWidget({
    Key? key,
    required this.descriptionTEC,
    required this.descriptionFN,
    required this.todoDateFN,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInputWidget(
      controller: descriptionTEC,
      focusNode: descriptionFN,
      label: 'Descrição',
      minLines: 4,
      maxLines: 6,
      textCapitalization: TextCapitalization.sentences,
      onFieldSubmitted: (_) => todoDateFN.requestFocus(),
    );
  }
}
