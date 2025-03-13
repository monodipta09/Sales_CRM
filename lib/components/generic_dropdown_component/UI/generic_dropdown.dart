import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/app_styles.dart';
import '../controller/generic_dropdown_controller.dart';

class GenericDropdown<T> extends StatelessWidget {
  final String? labelText;
  final bool isMandatory;
  final String? hintText;
  final List<T> items;
  final String Function(T) displayValue;
  final GenericDropdownController<T> controller;
  final bool isMultiSelect;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const GenericDropdown({
    super.key,
    this.labelText,
    this.hintText,
    this.isMandatory = false,
    required this.items,
    required this.displayValue,
    required this.controller,
    this.isMultiSelect = false,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                labelText!,
                style: theme.textTheme.bodyMedium,
              ),
              if (isMandatory) AppStyles.redAsterisk(),
            ],
          ),
        const SizedBox(height: 8.0),
        GestureDetector(
          onTap: () => _showDropdownDialog(context),
          child: AbsorbPointer(
            child: TextFormField(
              controller: controller.textController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon ??
                    Icon(
                      Icons.arrow_drop_down,
                      color: theme.colorScheme.primary,
                    ),
                filled: true,
                fillColor: theme.colorScheme.surface,
                contentPadding: AppStyles.defaultPadding,
                border: AppStyles.defaultBorder(theme.colorScheme.onSurface),
                focusedBorder: AppStyles.focusedBorder(theme.colorScheme.primary),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showDropdownDialog(BuildContext context) {
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GetBuilder<GenericDropdownController<T>>(
          init: controller,
          builder: (_) {
            final filteredItems = items.where((item) {
              return displayValue(item)
                  .toLowerCase()
                  .contains(controller.searchText.value.toLowerCase());
            }).toList();

            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: SizedBox(
                height: 400.0,
                width: 300.0,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search...",
                          prefixIcon: Icon(Icons.search,
                              color: theme.colorScheme.primary),
                          border: AppStyles.defaultBorder(
                              theme.colorScheme.onSurface),
                        ),
                        onChanged: (text) {
                          controller.updateSearchText(text);
                        },
                      ),
                    ),
                    Expanded(
                      child: Scrollbar(
                        thumbVisibility: true,
                        child: ListView(
                          children: filteredItems.map((item) {
                            final bool isSelected = isMultiSelect
                                ? controller.selectedValues.contains(item)
                                : controller.selectedValue.value == item;

                            return CheckboxListTile(
                              value: isSelected,
                              title: Text(displayValue(item)),
                              onChanged: (bool? selected) {
                                if (isMultiSelect) {
                                  final newSelectedValues =
                                  List<T>.from(controller.selectedValues);
                                  if (selected == true) {
                                    newSelectedValues.add(item);
                                  } else {
                                    newSelectedValues.remove(item);
                                  }
                                  controller.updateSelectedValues(newSelectedValues);
                                } else {
                                  controller.updateSelectedValue(item);
                                  Navigator.pop(context);
                                }
                                // Trigger rebuild of GetBuilder
                                controller.update();
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    if (isMultiSelect)
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Done",
                            style: TextStyle(
                                color: theme.colorScheme.primary)),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
