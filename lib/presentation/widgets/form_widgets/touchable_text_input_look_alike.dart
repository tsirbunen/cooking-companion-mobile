import 'package:flutter/material.dart';
import 'package:mobile/presentation/widgets/form_widgets/form_field_visibility_toggle.dart';
import 'package:mobile/presentation/widgets/text_widgets/main_title.dart';

const double borderRadius = 20.0;
const double padding = 5.0;
const EdgeInsets containerPadding = EdgeInsets.all(16.0);
const rowPadding = EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0);

/// This component looks like a text input form field, but actually it is only
/// a tappable container with text; tapping the widget opens the actual text input.
/// The component contains an option to toggle the visibility of the text (for example,
/// show or "hide" password with dots).
class TouchableTextInputLookAlike extends StatelessWidget {
  final String label;
  final String? value;
  final bool isVisible;
  final Function()? onVisibilityChanged;
  final void Function() onTap;

  const TouchableTextInputLookAlike({
    super.key,
    required this.label,
    this.value,
    this.isVisible = true,
    this.onVisibilityChanged,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: padding),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              padding: containerPadding,
              decoration: _getContainerDecoration(themeData),
              child: Padding(
                padding: rowPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _getActualOrMaskedText(),
                      style: _getTextStyle(themeData),
                    ),
                    if (onVisibilityChanged != null)
                      FormFieldVisibilityToggle(
                        isVisible: isVisible,
                        onVisibilityChanged: onVisibilityChanged!,
                      ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20.0,
              child: MainTitle(
                label: label,
                type: MainTitleType.mini,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getActualOrMaskedText() {
    return isVisible ? value ?? '' : '•' * (value?.length ?? 0);
  }

  _getTextStyle(ThemeData themeData) {
    return themeData.textTheme.titleMedium!.copyWith(
      color: themeData.colorScheme.onTertiary,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    );
  }

  _getContainerDecoration(ThemeData themeData) {
    return BoxDecoration(
      color: themeData.colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(50.0),
    );
  }
}
