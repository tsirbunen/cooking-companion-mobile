import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/business_logic/account_logic/account_bloc.dart';
import 'package:mobile/business_logic/account_logic/account_event.dart';
import 'package:mobile/business_logic/account_logic/helper_models.dart';
import 'package:mobile/business_logic/models/bloc_status/bloc_status.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mobile/repositories/recipes/graph_ql/get_all_validation_schemas.dart';
import 'package:mobile/repositories/account/repositories/api_account_repository.dart';
import '../../utils/custom_matchers.dart';
import '../../utils/test_api_service.dart';
import 'create_email_account_data.dart';
import 'helpers.dart';

const usernameChanged = 'username changed';
const emailChanged = 'email changed';

void main() {
  group('ACCOUNT BLOC -', () {
    test('Initial state params are empty, status is ok, no validationFns yet',
        () {
      final accountRepository = ApiAccountRepository(testApiService);

      final accountBloc = AccountBloc(accountRepository);
      final state = accountBloc.state;
      final accountParameters = [
        state.username,
        state.email,
        state.password,
        state.passwordConfirm,
      ];

      for (final property in accountParameters) {
        expect(property, isNull);
      }
      expect(state.status.status, Status.ok);
      expect(state.validationFnsByTarget, isEmpty);
    });

    blocTest(
      'Account parameters are properly changed',
      build: () {
        final accountRepository = ApiAccountRepository(testApiService);
        final accountBloc = AccountBloc(accountRepository);
        return accountBloc;
      },
      act: (bloc) => bloc
        ..add(UsernameChanged(username))
        ..add(UsernameChanged(''))
        ..add(UsernameChanged(usernameChanged))
        ..add(EmailChanged(email))
        ..add(EmailChanged(emailChanged))
        ..add(PasswordChanged(password))
        ..add(PasswordConfirmChanged(passwordConfirm)),
      expect: () => [
        const HasCorrectAccountState({'username': username}),
        const HasCorrectAccountState({'username': null}),
        const HasCorrectAccountState({'username': usernameChanged}),
        const HasCorrectAccountState(
            {'email': email, 'username': usernameChanged}),
        const HasCorrectAccountState(
            {'email': emailChanged, 'username': usernameChanged}),
        const HasCorrectAccountState({
          'password': password,
          'email': emailChanged,
          'username': usernameChanged
        }),
        const HasCorrectAccountState({
          'passwordConfirm': passwordConfirm,
          'password': password,
          'email': emailChanged,
          'username': usernameChanged
        }),
      ],
    );

    blocTest(
      'A validator function is set for each parameter of each queried schema',
      build: () {
        prepareTestApiServiceForFetchAccountValidationSchemasQuery();
        final accountRepository = ApiAccountRepository(testApiService);
        final accountBloc = AccountBloc(accountRepository);
        return accountBloc;
      },
      act: (bloc) => bloc
        ..add(PrepareValidationFns())
        ..add(UsernameChanged(username)),
      expect: () => [
        const CheckIfHasValidatorFns(false, []),
        const CheckIfHasValidatorFns(
          true,
          [ValidationTarget.EMAIL_ACCOUNT_INPUT],
        ),
      ],
    );

    blocTest(
      'A new email account can be created',
      build: () {
        prepareTestApiServiceForCreateEmailAccountMutation();
        final accountRepository = ApiAccountRepository(testApiService);
        final accountBloc = AccountBloc(accountRepository);
        return accountBloc;
      },
      act: (bloc) => bloc
        ..add(UsernameChanged(username))
        ..add(EmailChanged(email))
        ..add(PasswordChanged(password))
        ..add(PasswordConfirmChanged(passwordConfirm))
        ..add(SubmitEmailAccountAction(EmailAccountAction.signUp)),
      expect: () => [
        const HasCorrectAccountState({'username': username}),
        const HasCorrectAccountState({'email': email, 'username': username}),
        const HasCorrectAccountState(
            {'password': password, 'email': email, 'username': username}),
        const HasCorrectAccountState({
          'status': Status.dirty,
          'passwordConfirm': passwordConfirm,
          'password': password,
          'email': email,
          'username': username
        }),
        const HasCorrectAccountState({
          'status': Status.submitting,
          'currentAccount': null,
          'passwordConfirm': passwordConfirm,
          'password': password,
          'email': email,
          'username': username
        }),
        HasCorrectAccountState({
          'status': Status.success,
          'currentAccount': emailAccount,
          'passwordConfirm': passwordConfirm,
          'password': password,
          'email': email,
          'username': username
        }),
      ],
    );
  });
}
