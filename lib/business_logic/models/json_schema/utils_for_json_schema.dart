import 'package:mobile/business_logic/account_logic/helper_models.dart';
import 'package:mobile/business_logic/models/json_schema/json_schema.dart';

const tooShortDefault = 'Too short!';
const tooLongDefault = 'Too long!';
const requiredDefault = 'Required';
const patternDefault = 'Not valid';

getMinLengthValidationFn(num minLength, Map<String, dynamic> errorMessagesMap) {
  return (String? value) {
    final String message = errorMessagesMap['minLength'] ?? tooShortDefault;
    if (value == null || value.length < minLength) return message;
    return null;
  };
}

getMaxLengthValidationFn(num maxLength, Map<String, dynamic> errorMessagesMap) {
  return (String? value) {
    final String message = errorMessagesMap['maxLength'] ?? tooLongDefault;
    if (value == null || value.length > maxLength) return message;
    return null;
  };
}

getIsRequiredValidationFn(Map<String, dynamic> errorMessagesMap) {
  return (String? value) {
    final String message = errorMessagesMap['required'] ?? requiredDefault;
    if (value == null || value.isEmpty) return message;
    return null;
  };
}

getPatternValidationFn(String pattern, errorMessagesMap) {
  RegExp exp = RegExp(pattern);

  return (String? value) {
    final String message = errorMessagesMap['pattern'] ?? patternDefault;
    RegExpMatch? match = value != null ? exp.firstMatch(value) : null;
    if (match == null) return message;
    return null;
  };
}

ValidatorFn getCombinedPropertyValidatorFn(List<Function(String?)> validators) {
  return (String? value) {
    for (final validator in validators) {
      final String? errorMessage = validator(value);
      if (errorMessage != null) return errorMessage;
    }
    return null;
  };
}

getPropertyValidationFn(Map<String, dynamic> property, bool isRequired) {
  final pattern = property['pattern'];
  final minLength = property['minLength'];
  final maxLength = property['maxLength'];
  final errorMessagesMap = property['errorMessage'] ?? {};
  List<Function(String?)> validators = [];
  if (minLength != null) {
    validators.add(getMinLengthValidationFn(minLength, errorMessagesMap));
  }

  if (maxLength != null) {
    validators.add(getMaxLengthValidationFn(maxLength, errorMessagesMap));
  }

  if (isRequired) {
    validators.add(getIsRequiredValidationFn(errorMessagesMap));
  }

  if (pattern != null) {
    validators.add(getPatternValidationFn(pattern, errorMessagesMap));
  }

  return getCombinedPropertyValidatorFn(validators);
}

Map<String, ValidatorFn> convertJsonSchemaToPropertyValidationFns(
  JsonSchema jsonSchema,
) {
  Map<String, ValidatorFn> validatorFns = {};

  final requiredFields = jsonSchema.required;
  final properties = jsonSchema.properties;
  for (final entry in properties.entries) {
    final key = entry.key;
    final property = entry.value;
    if (property != null) {
      final isRequired = requiredFields.contains(key);
      final validationFn = getPropertyValidationFn(property, isRequired);
      validatorFns[key] = validationFn;
    }
  }

  return validatorFns;
}
