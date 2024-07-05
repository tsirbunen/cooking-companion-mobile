import 'package:flutter_riverpod/flutter_riverpod.dart';

final instructionsInFormProvider =
    NotifierProvider<InstructionsInFormController, List<String>>(
        InstructionsInFormController.new);

class InstructionsInFormController extends Notifier<List<String>> {
  @override
  List<String> build() {
    return [];
  }

  void addInstruction(String newInput) {
    state = [...state, newInput];
  }

  void removeInstruction(int index) {
    state = [...state]..removeAt(index);
  }

  void updateInstruction(int index, String newInput) {
    state = [...state]..[index] = newInput;
  }
}
