// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../shared/widgets/inputs/text_input_widget.dart';

class TitleTextInputWidget extends StatelessWidget {
  final TextEditingController titleTEC;
  final FocusNode titleFN;
  final FocusNode descriptionFN;

  const TitleTextInputWidget({
    Key? key,
    required this.titleTEC,
    required this.titleFN,
    required this.descriptionFN,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInputWidget(
        controller: titleTEC,
        focusNode: titleFN,
        label: 'Título',
        autoFocus: true,
        textCapitalization: TextCapitalization.words,
        onFieldSubmitted: (_) => descriptionFN.requestFocus(),
        validator: (String? title) {
          if (title == null || title.isEmpty) {
            return 'Você precisa adicionar um título';
          }
          return null;
        });
  }
}
