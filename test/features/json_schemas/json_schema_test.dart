import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/business_logic/models/json_schema/json_schema.dart';
import 'package:mobile/business_logic/models/json_schema/utils_for_json_schema.dart';

void main() {
  group('JSON SCHEMA -', () {
    test('Created minLength validation function works properly', () {
      final fnWithErrorMessage =
          getMinLengthValidationFn(5, {'minLength': 'Must have 5'});
      expect(fnWithErrorMessage('1234'), 'Must have 5');
      expect(fnWithErrorMessage('12345'), isNull);
      expect(fnWithErrorMessage('123456'), isNull);

      final fnNoErrorMessage = getMinLengthValidationFn(3, {});
      expect(fnNoErrorMessage('12'), tooShortDefault);
      expect(fnNoErrorMessage('123'), isNull);
      expect(fnNoErrorMessage('1234'), isNull);
    });

    test('Created maxLength validation function works properly', () {
      final fnWithErrorMessage =
          getMaxLengthValidationFn(5, {'maxLength': 'Must not exceed 5'});
      expect(fnWithErrorMessage('123456'), 'Must not exceed 5');
      expect(fnWithErrorMessage('12345'), isNull);
      expect(fnWithErrorMessage('1234'), isNull);

      final fnNoErrorMessage = getMaxLengthValidationFn(3, {});
      expect(fnNoErrorMessage('1234'), tooLongDefault);
      expect(fnNoErrorMessage('123'), isNull);
      expect(fnNoErrorMessage('12'), isNull);
    });

    test('Created isRequired validation function works properly', () {
      final fnWithErrorMessage =
          getIsRequiredValidationFn({'required': 'Field is required'});
      expect(fnWithErrorMessage(null), 'Field is required');
      expect(fnWithErrorMessage(''), 'Field is required');
      expect(fnWithErrorMessage('a'), isNull);

      final fnNoErrorMessage = getIsRequiredValidationFn({});
      expect(fnNoErrorMessage(null), requiredDefault);
      expect(fnNoErrorMessage(''), requiredDefault);
      expect(fnNoErrorMessage('a'), isNull);
    });

    test('Created pattern validation function works properly', () {
      final fnWithErrorMessage = getPatternValidationFn(
          r'^[a-zA-Z]+$', {'pattern': 'Must contain only letters'});
      expect(fnWithErrorMessage('XX123456'), 'Must contain only letters');
      expect(fnWithErrorMessage('As..'), 'Must contain only letters');
      expect(fnWithErrorMessage('As'), isNull);

      final fnNoErrorMessage = getPatternValidationFn(r'^[a-zA-Z]+$', {});
      expect(fnNoErrorMessage('XX123456'), patternDefault);
      expect(fnNoErrorMessage('As..'), patternDefault);
      expect(fnNoErrorMessage('As'), isNull);
    });

    test('Property validation function works properly', () {
      final property = {
        'pattern': r'^[a-zA-Z]+$',
        'minLength': 3,
        'maxLength': 5,
        'errorMessage': {
          'pattern': 'Must contain only letters',
          'minLength': 'Must have at least 3 characters',
          'maxLength': 'Must not exceed 5 characters',
        },
      };

      const isRequired = true;

      final fn = getPropertyValidationFn(property, isRequired);
      expect(fn('Aa'), 'Must have at least 3 characters');
      expect(fn('Aa1'), 'Must contain only letters');
      expect(fn('Aaaaaa'), 'Must not exceed 5 characters');
      expect(fn('Aaa'), isNull);
    });

    test('Properly working validation functions are created from a Json schema',
        () {
      const jsonSchema = JsonSchema(
        title: 'Email account input',
        description: 'Input for creating an account',
        type: 'object',
        required: ['username', 'password'],
        properties: {
          "username": {
            "title": "Username",
            "description":
                "A name chosen by the account owner. Can in some cases be shown to other users.",
            "type": "string",
            "pattern": r'^[a-zA-Z]+$',
            "minLength": 3,
            "maxLength": 5,
            "errorMessage": {
              "pattern": "Username must contain only letters",
              "minLength": "Username too short",
              "maxLength": "Username too long"
            },
          },
          "password": {
            "title": "Password",
            "description": "A secret word or phrase used for authentication.",
            "type": "string",
            "minLength": 8,
            "maxLength": 20,
            "errorMessage": {
              "minLength": "Password too short",
              "maxLength": "Password too long"
            },
          },
        },
      );

      final validators = convertJsonSchemaToPropertyValidationFns(jsonSchema);
      expect(validators.containsKey('username'), isTrue);
      expect(validators.containsKey('password'), isTrue);

      final usernameValidator = validators['username']!;
      expect(usernameValidator('Aa'), 'Username too short');
      expect(usernameValidator('Aa1'), 'Username must contain only letters');

      final passwordValidator = validators['password']!;
      expect(passwordValidator('1234567'), 'Password too short');
      expect(passwordValidator('123456789012345678901'), 'Password too long');
    });
  });
}
