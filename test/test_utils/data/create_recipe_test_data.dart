import 'package:mobile/repositories_and_data/models/create_recipe_input/create_recipe_input.dart';
import 'package:mobile/repositories_and_data/models/ingredient_group_input/ingredient_group_input.dart';
import 'package:mobile/repositories_and_data/models/ingredient_input/ingredient_input.dart';
import 'package:mobile/repositories_and_data/models/instruction_group_input/instruction_group_input.dart';

const testTitleForCreate = 'test title for create';

const createRecipeTestInput = CreateRecipeInput(
  title: testTitleForCreate,
  language: 'English',
  ovenNeeded: false,
  description: null,
  tags: ['some tag'],
  ingredientGroups: [
    IngredientGroupInput(title: null, ingredients: [
      IngredientInput(
        name: 'some ingredient',
        amount: 2.0,
        unit: 'dL',
      )
    ])
  ],
  instructionGroups: [
    InstructionGroupInput(
      title: null,
      instructions: ['some instruction'],
    )
  ],
);

final createRecipeTestData = {
  "createRecipe": {
    "id": 6,
    "title": testTitleForCreate,
    "description": "Test create / description",
    "ovenNeeded": true,
    "language": {"id": 1, "language": "English"},
    "ingredientGroups": [
      {
        "id": 8,
        "title": "Test create / ingredient group 1 title",
        "ingredients": [
          {
            "id": 13,
            "amount": 1,
            "unit": "cup",
            "name": "Create test recipe ingredient",
            "previousId": null
          }
        ]
      }
    ],
    "instructionGroups": [
      {
        "id": 8,
        "title": "Test create / instruction group 1 title",
        "instructions": [
          {
            "id": 12,
            "content": "Create test recipe instruction",
            "previousId": null
          }
        ]
      }
    ]
  }
};
