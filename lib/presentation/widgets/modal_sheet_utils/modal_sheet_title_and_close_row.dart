import 'package:flutter/material.dart';
import 'package:mobile/presentation/widgets/modal_sheet_utils/close_modal_sheet_icon_button.dart';

const double titlePaddingBottom = 10.0;
const double topPadding = 20.0;

class ModalSheetTitleAndCloseRow extends StatelessWidget {
  final String title;
  final bool isDarkTheme;
  final void Function() onClose;

  const ModalSheetTitleAndCloseRow({
    super.key,
    required this.title,
    this.isDarkTheme = false,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final style = themeData.textTheme.titleMedium!.copyWith(
      color: isDarkTheme
          ? themeData.colorScheme.tertiaryContainer
          : themeData.colorScheme.onTertiary,
      fontWeight: FontWeight.bold,
    );

    return Column(
      children: [
        const SizedBox(height: topPadding),
        Padding(
          padding: const EdgeInsets.only(bottom: titlePaddingBottom),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: style),
              CloseModalSheetIconButton(onPressed: onClose)
            ],
          ),
        ),
      ],
    );
  }
}
