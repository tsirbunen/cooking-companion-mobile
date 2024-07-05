import 'package:mobile/layers/business_logic/wizard/wizard_event.dart';

bool shouldNeglectEvent<T>(WizardListEvent event, List<T> list) {
  return event.index < 0 || event.index > list.length;
}

List<T> updateList<T>(WizardListEvent event, List<T> list) {
  final isEmpty = event.isEmpty();

  if (event.index >= list.length) {
    if (isEmpty) return list;

    list.add(event.toElement());
    return list;
  }

  if (isEmpty) {
    list.removeAt(event.index);
  } else {
    list[event.index] = event.toElement();
  }

  return list;
}

bool canAndShouldRemoveItem(bool? clearItem, int? index, List<Object>? items) {
  if (clearItem == null || index == null || !clearItem) return false;
  if (items == null || items.isEmpty || index >= items.length) return false;
  return true;
}
