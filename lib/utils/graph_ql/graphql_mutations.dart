import 'package:mobile/utils/graph_ql/fragments.dart';

const createRecipeMutation = '''
 mutation CreateRecipe(\$recipeInput: RecipeInput!) {
    createRecipe(recipeInput: \$RecipeInput!) {
      $recipeFragment
    }
 }
 
''';
