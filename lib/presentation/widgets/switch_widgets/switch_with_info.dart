import 'package:flutter/material.dart';
import 'package:mobile/app_services/theme/colors.dart';
import 'package:mobile/presentation/widgets/text_widgets/info.dart';

const double spacing = 20.0;
const double switchScale = 1.15;
const EdgeInsets padding = EdgeInsets.only(bottom: 10.0);

class SwitchWithInfo extends StatelessWidget {
  final bool currentValue;
  final void Function(bool) onChanged;
  final String info;

  const SwitchWithInfo({
    super.key,
    required this.currentValue,
    required this.onChanged,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.scale(
            scale: switchScale,
            child: Switch(
              thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
                  (Set<WidgetState> states) {
                return states.contains(WidgetState.selected)
                    ? const Icon(Icons.check, color: veryDark)
                    : const Icon(
                        Icons.close,
                        color: pale,
                      );
              }),
              value: currentValue,
              onChanged: onChanged,
              inactiveThumbColor: pale,
              inactiveTrackColor: veryPale,
              activeColor: veryPale,
              activeTrackColor: dark,
              trackOutlineColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                return states.contains(WidgetState.selected) ? dark : veryPale;
              }),
            ),
          ),
          const SizedBox(width: spacing),
          Expanded(
            child: Info(
              info: info,
              type: InfoType.multilinePale,
            ),
          ),
        ],
      ),
    );
  }
}
