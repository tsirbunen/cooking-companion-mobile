import 'package:flutter/material.dart';
import 'package:mobile/presentation/widgets/form_widgets/form_close_button.dart';
import 'package:mobile/presentation/widgets/text_widgets/description.dart';
import 'package:mobile/presentation/widgets/text_widgets/main_title.dart';

const double iconSize = 30.0;
const EdgeInsets descriptionPadding = EdgeInsets.only(top: 5.0, bottom: 20.0);

class FormHeader extends StatelessWidget {
  final String title;
  final String info;
  final void Function() onCloseForm;

  const FormHeader({
    super.key,
    required this.title,
    required this.info,
    required this.onCloseForm,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MainTitle(label: title),
            FormCloseButton(onCloseForm: onCloseForm),
          ],
        ),
        Padding(
          padding: descriptionPadding,
          child: Description(info: info),
        ),
      ],
    );
  }
}
