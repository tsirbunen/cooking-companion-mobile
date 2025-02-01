const accountFragment = '''
  id
  uuid
  username
  token
  email
  emailVerified
  identityProvider
''';

const accountResultFragment = '''
  __typename
  ... on Account {
    $accountFragment
  }
  ... on BadInputError {
    errorMessage
  }
''';
