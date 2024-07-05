import 'package:flutter_riverpod/flutter_riverpod.dart';

final recipeTitleInFormProvider =
    NotifierProvider<RecipeTitleInFormController, String>(
        RecipeTitleInFormController.new);

class RecipeTitleInFormController extends Notifier<String> {
  @override
  String build() {
    return '';
  }

  void updateTitle(String newTitle) {}
}
