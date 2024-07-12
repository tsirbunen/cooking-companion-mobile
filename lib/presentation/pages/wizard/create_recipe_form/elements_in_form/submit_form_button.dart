import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_bloc.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_event.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_state.dart';

const String submitLabel = 'SUBMIT';
const double buttonTextPadding = 15.0;

class SubmitFormButton extends StatelessWidget {
  const SubmitFormButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WizardBloc, WizardState>(
        builder: (BuildContext context, WizardState state) {
      final ThemeData themeData = Theme.of(context);

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () => _submitForm(context),
              style: _getButtonStyle(themeData),
              child: const Text(submitLabel, style: TextStyle(fontSize: 22)),
            ),
          ],
        ),
      );
    });
  }

  void _submitForm(BuildContext context) {
    context.read<WizardBloc>().add(SubmitRecipeEvent());
  }

  ButtonStyle _getButtonStyle(ThemeData themeData) {
    final colors = themeData.colorScheme;
    final Color activeColor = colors.secondaryContainer;
    final Color activeBg = colors.secondary;
    final Color disabledColor = colors.tertiaryContainer;
    final Color disabledBg = colors.onTertiaryFixed;

    return ElevatedButton.styleFrom(
      backgroundColor: activeBg,
      foregroundColor: activeColor,
      disabledBackgroundColor: disabledBg,
      disabledForegroundColor: disabledColor,
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: buttonTextPadding),
    );
  }
}
