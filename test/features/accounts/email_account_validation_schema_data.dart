import 'package:mobile/business_logic/models/json_schema/json_schema.dart';
import 'package:mobile/repositories/recipes/graph_ql/get_all_validation_schemas.dart';

final Map<ValidationTarget, JsonSchema>
    createEmailAccountValidationSchemaTestData = {
  ValidationTarget.EMAIL_ACCOUNT_INPUT: JsonSchema.fromJson(
      validationJsonSchemasTestData as Map<String, dynamic>),
  ValidationTarget.SIGN_IN_TO_EMAIL_ACCOUNT_INPUT: JsonSchema.fromJson(
      validationJsonSchemasTestData as Map<String, dynamic>),
  ValidationTarget.REQUEST_VERIFICATION_EMAIL_INPUT: JsonSchema.fromJson(
      validationJsonSchemasTestData as Map<String, dynamic>),
};

const emailAccountValidationSchemaTitle = "Email account input";

final emailAccountValidationSchemaTestData = {
  "target": "EMAIL_ACCOUNT_INPUT",
  "schema": {
    "title": emailAccountValidationSchemaTitle,
    "description": "Input for creating an account",
    "type": "object",
    "required": ["username", "password"],
    "properties": {
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
      "email": {
        "title": "Email",
        "description":
            "An email address used for account verification purposes.",
        "type": "string",
        "format": "email",
        "errorMessage": {"format": "Invalid email address"},
      },
    },
  },
};

final signInToEmailAccountValidationSchemaTestData = {
  "target": "SIGN_IN_TO_EMAIL_ACCOUNT_INPUT",
  "schema": {
    "title": "Sign in to email account input",
    "description": "Input for signing in to an email account",
    "type": "object",
    "required": ["email", "password"],
    "properties": {
      "email": {
        "title": "Email",
        "description": "The email address associated with the account.",
        "type": "string",
        "format": "email",
        "errorMessage": {"format": "Invalid email address"},
      },
      "password": {
        "title": "Password",
        "description": "The password associated with the account.",
        "type": "string",
        "minLength": 8,
        "maxLength": 20,
        "errorMessage": {
          "minLength": "Password too short",
          "maxLength": "Password too long"
        },
      },
    },
  },
};

final requestVerificationEmailValidationSchemaTestData = {
  "target": "REQUEST_VERIFICATION_EMAIL_INPUT",
  "schema": {
    "title": "Request verification email input",
    "description": "Input for requesting a verification email",
    "type": "object",
    "required": ["email"],
    "properties": {
      "email": {
        "title": "Email",
        "description": "The email address associated with the account.",
        "type": "string",
        "format": "email",
        "errorMessage": {"format": "Invalid email address"},
      },
    },
  },
};

final validationJsonSchemasTestData = {
  "validationSchemas": [
    emailAccountValidationSchemaTestData,
    signInToEmailAccountValidationSchemaTestData,
    requestVerificationEmailValidationSchemaTestData,
  ]
};
