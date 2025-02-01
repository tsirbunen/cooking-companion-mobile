import 'package:flutter/material.dart';
import 'package:mobile/app_services/logger/logger.dart';
import 'package:mobile/business_logic/account_logic/account_event.dart';
import 'package:mobile/business_logic/account_logic/helper_models.dart';
import 'package:mobile/business_logic/models/bloc_status/bloc_status.dart';
import 'package:mobile/presentation/pages/account/email_account_floating_actions.dart';
import 'package:mobile/presentation/widgets/app_bar/app_bar_customized.dart';
import 'package:mobile/presentation/widgets/form_widgets/form_action_buttons.dart';
import 'package:mobile/presentation/widgets/form_widgets/form_header.dart';
import 'package:mobile/presentation/widgets/form_widgets/text_field_with_open_modal_sheet_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/business_logic/account_logic/account_bloc.dart';
import 'package:mobile/business_logic/account_logic/account_state.dart';

const usernameLabel = 'username';
const usernameInfo =
    'Your username will be visible to other users in case you allow your own recipes to be public.';
const emailLabel = 'email';
const emailInfo =
    'Your email is needed for account verification purposes. It will not be shown to other users or shared with any third party.';
const passwordLabel = 'password';
const passwordConfirmLabel = 'password confirmation';
const double padding = 25.0;

class EmailAccountForm extends StatefulWidget {
  final void Function() onCloseForm;
  const EmailAccountForm({super.key, required this.onCloseForm});

  @override
  State<EmailAccountForm> createState() => _EmailAccountFormState();
}

class _EmailAccountFormState extends State<EmailAccountForm> {
  final _formKey = GlobalKey<FormState>();
  List<Field> _touchedFields = [];
  bool _passwordIsVisible = false;
  EmailAccountAction _action = EmailAccountAction.signIn;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (
        BuildContext context,
        AccountState state,
      ) {
        logger.warning(state.toString(), runtimeType);

        final validators = state.validationFnsByTarget[_action.toTarget()];
        bool isTouched(Field field) => _touchedFields.contains(field);
        final size = MediaQuery.sizeOf(context);

        return Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height - appBarHeight - padding,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormHeader(
                        title: _action.title(),
                        info: _action.info(),
                        onCloseForm: _onCloseForm),
                    if (_show(Field.username))
                      TextFieldWithOpenModalSheetInput(
                        label: usernameLabel,
                        value: state.username,
                        info: usernameInfo,
                        onChanged: (value) =>
                            _onEvent(context, Field.username, value),
                        validateFn: validators?[Field.username],
                        isTouched: isTouched(Field.username),
                      ),
                    if (_show(Field.email))
                      TextFieldWithOpenModalSheetInput(
                        label: emailLabel,
                        value: state.email,
                        info: emailInfo,
                        onChanged: (value) =>
                            _onEvent(context, Field.email, value),
                        validateFn: validators?[Field.email],
                        isTouched: isTouched(Field.email),
                      ),
                    if (_show(Field.password))
                      TextFieldWithOpenModalSheetInput(
                        label: passwordLabel,
                        value: state.password,
                        onChanged: (value) =>
                            _onEvent(context, Field.password, value),
                        validateFn: validators?[Field.password],
                        isTouched: isTouched(Field.password),
                        isVisible: _passwordIsVisible,
                        onVisibilityChanged: _onPasswordVisibilityChanged,
                      ),
                    if (_show(Field.passwordConfirm))
                      TextFieldWithOpenModalSheetInput(
                        label: passwordConfirmLabel,
                        value: state.passwordConfirm,
                        onChanged: (value) =>
                            _onEvent(context, Field.passwordConfirm, value),
                        validateFn: state.getPasswordConfirmValidationFn(),
                        isTouched: isTouched(Field.passwordConfirm),
                        isVisible: _passwordIsVisible,
                        onVisibilityChanged: _onPasswordVisibilityChanged,
                      ),
                    FormActionButtons(
                      onSubmit: _onSubmit,
                      onReset: _onReset,
                      isSubmitting: state.status.status == Status.submitting,
                      hasSomeValue: state.hasSomeValue(_action),
                      hasSomeError: state.hasSomeError(_action),
                    ),
                  ],
                ),
              ),
            ),
            EmailAccountFloatingActions(
              onChangeEmailAccountAction: _onChangeEmailAccountAction,
            ),
          ],
        );
      },
    );
  }

  void _onPasswordVisibilityChanged() {
    setState(() => _passwordIsVisible = !_passwordIsVisible);
  }

  void _onCloseForm() => widget.onCloseForm();

  void _onChangeEmailAccountAction(EmailAccountAction action) {
    setState(() => _action = action);
  }

  bool _show(Field field) => _action.isField(field);

  void _onEvent(BuildContext context, Field field, String value) {
    context.read<AccountBloc>().add(_fieldToEvent(field, value));
    _onTouchedField(field);
  }

  AccountEvent _fieldToEvent(Field field, String value) {
    return switch (field) {
      Field.username => UsernameChanged(value),
      Field.email => EmailChanged(value),
      Field.password => PasswordChanged(value),
      Field.passwordConfirm => PasswordConfirmChanged(value),
    };
  }

  void _onTouchedField(Field field) {
    if (_touchedFields.contains(field)) return;
    setState(() => _touchedFields = [..._touchedFields, field]);
  }

  void _onReset() {
    context.read<AccountBloc>().add(ClearFormValues());
    setState(() => _touchedFields = []);
  }

  void _onSubmit() {
    context.read<AccountBloc>().add(SubmitEmailAccountAction(_action));
  }
}
