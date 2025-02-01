// ignore_for_file: constant_identifier_names

enum IdentityProvider { EMAIL, GITHUB, FACEBOOK }

extension IdentityProviderAccountTypeExtension on IdentityProvider {
  String get accountType {
    switch (this) {
      case IdentityProvider.EMAIL:
        return 'email';
      case IdentityProvider.GITHUB:
        return 'github';
      case IdentityProvider.FACEBOOK:
        return 'facebook';
    }
  }
}
