import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/business_logic/models/bloc_status/bloc_status.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_bloc.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_event.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_state.dart';

const String submitLabel = 'SUBMIT';
const String clearLabel = 'CLEAR';
const String resetLabel = 'RESET';
const double buttonTextPadding = 15.0;
const double buttonsSpacerWidth = 10.0;
const double buttonFontSize = 22.0;
const double buttonsMargin = 40.0;

class FormActionButtons extends StatelessWidget {
  const FormActionButtons({super.key});
  // FIXME: Implement disable buttons when there are no changes
  // to be cleared or submitted

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WizardBloc, WizardState>(builder: (
      BuildContext context,
      WizardState state,
    ) {
      final ThemeData themeData = Theme.of(context);
      final isEdit = state.originalRecipe != null;
      const buttonTextStyle = TextStyle(fontSize: buttonFontSize);

      final canSubmit = state.status != BlocStatus.submitting;
      final showReset = isEdit && canSubmit;
      final showClear = canSubmit;

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: buttonsMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (showReset)
              ElevatedButton(
                onPressed: () => _resetForm(context),
                style: _getButtonStyle(themeData),
                child: const Text(resetLabel, style: buttonTextStyle),
              ),
            if (showReset) const SizedBox(width: buttonsSpacerWidth),
            if (showClear)
              ElevatedButton(
                onPressed: () => _clearForm(context),
                style: _getButtonStyle(themeData),
                child: const Text(clearLabel, style: buttonTextStyle),
              ),
            if (showClear) const SizedBox(width: buttonsSpacerWidth),
            ElevatedButton(
              onPressed: canSubmit ? () => _submitForm(context) : null,
              style: _getButtonStyle(themeData, isMainAction: true),
              child: const Text(submitLabel, style: buttonTextStyle),
            ),
          ],
        ),
      );
    });
  }

  void _submitForm(BuildContext context) {
    context.read<WizardBloc>().add(SubmitRecipeEvent());
  }

  void _clearForm(BuildContext context) {
    context.read<WizardBloc>().add(ClearFormEvent());
  }

  void _resetForm(BuildContext context) {
    context.read<WizardBloc>().add(ResetFormEvent());
  }

  ButtonStyle _getButtonStyle(
    ThemeData themeData, {
    bool isMainAction = false,
  }) {
    final colors = themeData.colorScheme;
    final Color activeColor = colors.secondaryContainer;
    final Color activeBg = isMainAction ? colors.secondary : colors.onSecondary;
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
