import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mobile/presentation/pages/wizard/page_widgets/form_widgets/add_new_item_button.dart';
import 'package:mobile/presentation/pages/wizard/page_widgets/form_input_sheet/form_input_sheet_item_model.dart';
import 'package:mobile/presentation/pages/wizard/page_widgets/form_input_sheet/open_form_input_sheet.dart';
import 'package:mobile/presentation/pages/wizard/page_widgets/form_widgets/text_input_form_field.dart';

const double itemSpacing = 10.0;

class FormInputSheetWrapper extends StatefulWidget {
  final String sheetTitle;
  final void Function(List<String> value) onSave;
  final void Function()? onDelete;
  final List<FormInputSheetItem> inputItems;
  final Widget? child;
  final bool showNoContentYet;

  const FormInputSheetWrapper({
    super.key,
    required this.sheetTitle,
    required this.onSave,
    this.onDelete,
    required this.inputItems,
    this.child,
    this.showNoContentYet = false,
  });

  @override
  State<FormInputSheetWrapper> createState() => _FormInputSheetWrapperState();
}

class _FormInputSheetWrapperState extends State<FormInputSheetWrapper> {
  final controllers = <TextEditingController>[];

  @override
  Widget build(BuildContext context) {
    action() => _openFormInputSheet(context);

    if (widget.child != null) {
      return GestureDetector(
        onTap: action,
        child: widget.child,
      );
    }

    return AddNewItemButton(
      onPressed: action,
      showNoContentYet: widget.showNoContentYet,
    );
  }

  @override
  void initState() {
    for (var i = 0; i < widget.inputItems.length; i++) {
      final controller = TextEditingController();
      final initialValue = widget.inputItems[i].initialValue;
      if (initialValue != null) controller.text = initialValue;
      controllers.add(controller);
    }
    super.initState();
  }

  @override
  void dispose() {
    for (var i = 0; i < widget.inputItems.length; i++) {
      controllers[i].dispose();
    }
    super.dispose();
  }

  void _openFormInputSheet(BuildContext context) async {
    final content = LayoutBuilder(builder: (
      BuildContext context,
      BoxConstraints constraints,
    ) {
      final availableWidth = constraints.maxWidth;
      List<Widget> halfRowItems = [];
      List<Widget> fullRowItems = [];
      final ThemeData themeData = Theme.of(context);

      final labelStyle = themeData.textTheme.titleMedium!.copyWith(
        color: themeData.colorScheme.onPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      );

      widget.inputItems.forEachIndexed((index, item) {
        final child = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.label != null) Text(item.label!, style: labelStyle),
            TextInputFormField(
              controller: controllers[index],
              hintText: item.hintText,
              maxLength: item.maxLength ?? 20,
              isDarkTheme: false,
              isNumber: item.inputType == FormInputTypeEnum.numberHalfRow,
            ),
          ],
        );

        switch (item.inputType) {
          case FormInputTypeEnum.stringFullRow:
            fullRowItems.add(
              SizedBox(width: availableWidth, child: child),
            );
            break;
          case FormInputTypeEnum.stringHalfRow:
          case FormInputTypeEnum.numberHalfRow:
            final width = availableWidth / 2 - itemSpacing;
            halfRowItems.add(
              SizedBox(width: width, child: child),
            );
            break;

          default:
            throw UnimplementedError();
        }
      });

      List<Widget> sheetWidgets = [];
      if (halfRowItems.isNotEmpty) {
        sheetWidgets.add(SizedBox(
            width: availableWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: halfRowItems,
            )));
      }
      if (fullRowItems.isNotEmpty) {
        sheetWidgets.add(Column(children: fullRowItems));
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: sheetWidgets,
      );
    });

    await openFormInputSheet(
      context: context,
      subTitle: widget.sheetTitle,
      content: content,
      onDelete: (widget.onDelete != null) ? () => _onDelete(context) : null,
      onCancel: () => _onCancel(context),
      onSave: () => _onSave(context),
    );
  }

  void _onSave(BuildContext context) {
    Navigator.of(context).pop();
    final values = controllers.map((c) => c.text).toList();
    widget.onSave(values);
    if (widget.child == null) _clearControllerValues();
  }

  void _onDelete(BuildContext context) {
    Navigator.of(context).pop();
    widget.onDelete!();
    _clearControllerValues();
  }

  void _onCancel(BuildContext context) {
    Navigator.of(context).pop();
    _resetControllerValues();
  }

  void _clearControllerValues() {
    for (var i = 0; i < widget.inputItems.length; i++) {
      controllers[i].clear();
    }
  }

  void _resetControllerValues() {
    for (var i = 0; i < widget.inputItems.length; i++) {
      final initialValue = widget.inputItems[i].initialValue;
      controllers[i].text = initialValue ?? '';
    }
  }
}
