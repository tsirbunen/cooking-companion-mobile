import 'package:flutter/material.dart';
import 'package:mobile/layers/presentation/wizard/create_recipe_form/form_widgets/no_content_yet.dart';

const double itemSpacing = 10.0;
const double iconSize = 35.0;

class AddNewItemButton extends StatelessWidget {
  final void Function() onPressed;
  final bool showNoContentYet;

  const AddNewItemButton({
    super.key,
    required this.onPressed,
    this.showNoContentYet = false,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(top: showNoContentYet ? 0.0 : itemSpacing),
      child: Row(
        mainAxisAlignment: showNoContentYet
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showNoContentYet) const NoContentYet(),
          Material(
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: Center(
              child: Ink(
                decoration: ShapeDecoration(
                  color: themeData.colorScheme.onSecondary,
                  shape: const CircleBorder(),
                ),
                child: IconButton(
                  icon: const Icon(Icons.add, size: iconSize),
                  color: themeData.colorScheme.secondaryContainer,
                  onPressed: onPressed,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
