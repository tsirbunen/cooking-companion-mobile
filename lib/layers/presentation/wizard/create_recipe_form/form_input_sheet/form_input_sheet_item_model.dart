enum FormInputTypeEnum { stringFullRow, stringHalfRow, numberHalfRow }

class FormInputSheetItem {
  final String? hintText;
  final String? label;
  final String? initialValue;
  final int? maxLength;
  final FormInputTypeEnum inputType;

  const FormInputSheetItem({
    this.hintText,
    this.label,
    this.initialValue,
    this.maxLength,
    required this.inputType,
  });
}
