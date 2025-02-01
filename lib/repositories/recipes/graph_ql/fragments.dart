const ingredientFragment = '''
  id
  name
  amount
  unit
  previousId
  ''';

const ingredientGroupFragment = '''
  id
  title
  ingredients {
    $ingredientFragment
  }
''';

const instructionFragment = '''
  id
  content
  previousId
''';

const instructionGroupFragment = '''
  id
  title
  instructions {
    $instructionFragment
  }
''';

const recipeFragment = '''
  id
  title
  description
  photos {
    id
    url
    isMainPhoto
  }
  tags {
    id
    tag
  }
  ovenNeeded
  language {
    id
    language
  }
  ingredientGroups {
    $ingredientGroupFragment
  }
  instructionGroups {
    $instructionGroupFragment
  }
''';

const validationSchemaFragment = '''
    target
    schema  
''';

const generalResultFragment = '''
  __typename
  ... on GeneralSuccess {
    successMessage
  }
  ... on GeneralError {
    errorMessage
  }
''';
