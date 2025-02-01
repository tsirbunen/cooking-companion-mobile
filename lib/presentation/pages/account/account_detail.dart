import 'package:flutter/material.dart';
import 'package:mobile/presentation/widgets/text_widgets/main_title.dart';

class AccountDetail extends StatelessWidget {
  final String label;
  final String value;

  const AccountDetail({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(
            label: label,
            type: MainTitleType.mini,
          ),
          MainTitle(
            label: value,
            type: MainTitleType.midi,
          ),
        ],
      ),
    );
  }
}
