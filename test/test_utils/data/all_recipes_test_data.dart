import 'package:mobile/business_logic/models/recipe/recipe.dart';

final firstTestRecipeJson = allRecipesTestData['allRecipes']![0];
final secondTestRecipeJson = allRecipesTestData['allRecipes']![1];
final allRecipeIds = allRecipesTestData['allRecipes']!
    .map((recipe) => recipe['id'] as int)
    .toList();

final List<Recipe> allTestRecipes = allRecipesTestData['allRecipes']!
    .map((recipe) => Recipe.fromJson(recipe as Map<String, dynamic>))
    .toList();

const allRecipesTestData = {
  "allRecipes": [
    {
      "id": 1,
      "title": "Test recipe 1 title",
      "description": "Test recipe 1 description",
      "photos": [
        {"id": 1, "url": "photoUrl", "isMainPhoto": true}
      ],
      "tags": [
        {"id": 1, "tag": "vegetarian"}
      ],
      "ovenNeeded": false,
      "language": {"id": 1, "language": "English"},
      "ingredientGroups": [
        {
          "id": 1,
          "title": "Test recipe 1 ingredient group 1 title",
          "ingredients": [
            {
              "id": 1,
              "amount": 1,
              "unit": "cup",
              "name": "Test recipe 1 ingredient 1 (id 1) BLUEBERRY",
              "previousId": null
            },
            {
              "id": 2,
              "amount": 2,
              "name": "Test recipe 1 ingredient 2 (id 2)",
              "previousId": 1
            },
            {
              "id": 3,
              "unit": "piece",
              "name": "Test recipe 1 ingredient 3 (id 3)",
              "previousId": 2
            }
          ]
        },
        {
          "id": 2,
          "title": "Test recipe 1 ingredient group 2 title",
          "ingredients": [
            {
              "id": 4,
              "amount": 3,
              "unit": "cup",
              "name": "Test recipe 1 ingredient 4 (id 4)",
              "previousId": null
            },
            {
              "id": 5,
              "amount": 2,
              "name": "Test recipe 1 ingredient 5 (id 5)",
              "previousId": 4
            }
          ]
        }
      ],
      "instructionGroups": [
        {
          "id": 1,
          "title": "Test recipe 1 instruction group 1 title",
          "instructions": [
            {
              "id": 1,
              "content": "Test recipe 1 instruction 1 (id 1)",
              "previousId": null
            },
            {
              "id": 2,
              "content": "Test recipe 1 instruction 2 (id 2)",
              "previousId": 1
            }
          ]
        },
        {
          "id": 2,
          "title": "Test recipe 1 instruction group 2 title",
          "instructions": [
            {
              "id": 3,
              "content": "Test recipe 1 instruction 3 (id 3)",
              "previousId": null
            },
            {
              "id": 4,
              "content": "Test recipe 1 instruction 4 (id 4)",
              "previousId": 3
            }
          ]
        }
      ]
    },
    {
      "id": 2,
      "title": "Test recipe 2 title",
      "description": "Test recipe 2 description",
      "ovenNeeded": true,
      "language": {"id": 2, "language": "Swedish"},
      "tags": [
        {"id": 1, "tag": "vegetarian"},
        {"id": 1, "tag": "vegan"}
      ],
      "ingredientGroups": [
        {
          "id": 3,
          "title": "Test recipe 2 ingredient group 1 title",
          "ingredients": [
            {
              "id": 6,
              "amount": 1,
              "unit": "cup",
              "name": "Test recipe 2 ingredient 1 (id 6)",
              "previousId": null
            },
            {
              "id": 7,
              "amount": 2,
              "name": "Test recipe 2 ingredient 2 (id 7)",
              "previousId": 6
            }
          ]
        },
        {
          "id": 4,
          "title": "Test recipe 2 ingredient group 2 title",
          "ingredients": [
            {
              "id": 8,
              "amount": 3,
              "unit": "cup",
              "name": "Test recipe 2 ingredient 4 (id 8)",
              "previousId": null
            },
            {
              "id": 9,
              "amount": 2,
              "name": "Test recipe 2 ingredient 5 (id 9)",
              "previousId": 8
            }
          ]
        }
      ],
      "instructionGroups": [
        {
          "id": 3,
          "title": "Test recipe 2 instruction group 1 title",
          "instructions": [
            {
              "id": 5,
              "content": "Test recipe 2 instruction 1 (id 5)",
              "previousId": null
            },
            {
              "id": 6,
              "content": "Test recipe 2 instruction 2 (id 6)",
              "previousId": 5
            }
          ]
        },
        {
          "id": 4,
          "title": "Test recipe 2 instruction group 2 title",
          "instructions": [
            {
              "id": 7,
              "content": "Test recipe 2 instruction 3 (id 7)",
              "previousId": null
            },
            {
              "id": 8,
              "content": "Test recipe 2 instruction 4 (id 8)",
              "previousId": 7
            }
          ]
        }
      ]
    },
    {
      "id": 3,
      "title": "Test recipe 3 title",
      "description": "Test recipe 3 description",
      "ovenNeeded": true,
      "language": {"id": 1, "language": "English"},
      "tags": [
        {"id": 1, "tag": "vegetarian"},
        {"id": 1, "tag": "vegan"}
      ],
      "ingredientGroups": [
        {
          "id": 5,
          "title": "Test recipe 3 ingredient group 1 title",
          "ingredients": [
            {
              "id": 10,
              "amount": 1,
              "unit": "cup",
              "name": "Test recipe 3 ingredient 1 (id 10)",
              "previousId": null
            }
          ]
        }
      ],
      "instructionGroups": [
        {
          "id": 5,
          "title": "Test recipe 3 instruction group 1 title",
          "instructions": [
            {
              "id": 9,
              "content": "Test recipe 3 instruction 1 (id 10)",
              "previousId": null
            }
          ]
        }
      ]
    },
    {
      "id": 4,
      "title": "Test recipe 4 title",
      "description": "Test recipe 4 description",
      "ovenNeeded": true,
      "language": {"id": 1, "language": "English"},
      "ingredientGroups": [
        {
          "id": 6,
          "title": "Test recipe 4 ingredient group 1 title",
          "ingredients": [
            {
              "id": 11,
              "amount": 1,
              "unit": "cup",
              "name": "Test recipe 4 ingredient 1 (id 11)",
              "previousId": null
            }
          ]
        }
      ],
      "instructionGroups": [
        {
          "id": 6,
          "title": "Test recipe 4 instruction group 1 title",
          "instructions": [
            {
              "id": 10,
              "content": "Test recipe 4 instruction 1 (id 11)",
              "previousId": null
            }
          ]
        }
      ]
    },
    {
      "id": 5,
      "title": "Test recipe 5 title",
      "description": "Test recipe 5 description",
      "ovenNeeded": true,
      "language": {"id": 1, "language": "English"},
      "ingredientGroups": [
        {
          "id": 7,
          "title": "Test recipe 5 ingredient group 1 title",
          "ingredients": [
            {
              "id": 12,
              "amount": 1,
              "unit": "cup",
              "name": "Test recipe 5 ingredient 1 (id 12)",
              "previousId": null
            }
          ]
        }
      ],
      "instructionGroups": [
        {
          "id": 7,
          "title": "Test recipe 5 instruction group 1 title",
          "instructions": [
            {
              "id": 11,
              "content": "Test recipe 5 instruction 1 (id 12)",
              "previousId": null
            }
          ]
        }
      ]
    }
  ]
};
