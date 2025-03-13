import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../../../style/app_styles.dart';

class GenericDropdownControllerIos<T> extends ChangeNotifier {
  T? selectedValue; // For single selection
  List<T>? selectedValues; // For multiple selection
  String searchText = ''; // Search text
  final TextEditingController textController = TextEditingController();

  final String Function(T)? displayValue;

  GenericDropdownControllerIos({
    this.selectedValue,
    this.selectedValues,
    required this.displayValue,
  }) {
    _updateText();
  }

  void updateSearchText(String text) {
    searchText = text;
    notifyListeners();
  }

  void updateSelectedValue(T? value) {
    selectedValue = value;
    _updateText();
    notifyListeners();
  }

  void updateSelectedValues(List<T> values) {
    selectedValues = values;
    _updateText();
    notifyListeners();
  }

  void _updateText() {
    if (selectedValue != null && displayValue != null) {
      textController.text = displayValue!(selectedValue!);
    } else if (selectedValues != null && displayValue != null) {
      textController.text = selectedValues!.map(displayValue!).join(', ');
    } else {
      textController.text = '';
    }
  }
}

class GenericDropdownIos<T> extends StatelessWidget {
  final String? labelText;
  final bool isMandatory;
  final String? hintText;
  final List<dynamic> items;
  final String Function(T) displayValue; // Maps item to string for display
  final GenericDropdownControllerIos<T> controller;
  final bool isMultiSelect;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const GenericDropdownIos({
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
    final TextEditingController textController = TextEditingController();

    final theme = CupertinoTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                labelText!,
                style: theme.textTheme.actionSmallTextStyle,
              ),
              SizedBox(width: 4.0),
              if (isMandatory) AppStyles.redAsterisk(),
            ],
          ),
        SizedBox(height: 8.0),
        GestureDetector(
          onTap: () => _showDropdownDialog(context),
          child: AbsorbPointer(
            child: CupertinoTextField(
              controller: controller.textController,
              readOnly: true,
              style: TextStyle(
                fontSize: 16.0,
                color: theme.brightness == Brightness.dark
                    ? CupertinoColors.white // Use white for dark mode
                    : CupertinoColors
                        .black, // Dynamic text color based on theme
              ),
              prefix: Padding(
                padding: const EdgeInsets.only(left: 7.0),
                child: prefixIcon,
              ),
              suffix: Padding(
                padding: const EdgeInsets.only(right:7.0),
                child: suffixIcon ??
                    Icon(
                      IconlyLight.arrow_down_circle,
                      color: theme.primaryColor,
                    ),
              ),
              placeholder: hintText,
              // placeholderStyle: TextStyle(fontSize: 12.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                border: Border.all(color: theme.primaryColor.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showDropdownDialog(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            final filteredItems = items
                .where((item) => displayValue(item)
                    .toLowerCase()
                    .contains(controller.searchText.toLowerCase()))
                .toList();

            return CupertinoAlertDialog(
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(12.0),
              // ),
              content: Container(
                height: 400.0, // Fixed height for the dialog
                width: double.infinity, // Optional fixed width
                // color: CupertinoColors.white,
                // constraints: BoxConstraints(maxWidth: 800.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom:8.0),
                      child: CupertinoTextField(
                        placeholder: "Search...",
                        prefix: Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Icon(CupertinoIcons.search,
                              color: theme.primaryColor),
                        ),
                        onChanged: (text) {
                          controller.updateSearchText(text);
                          setState(() {}); // Update the filtered items
                        },
                      ),
                    ),
                    Expanded(
                      child: CupertinoScrollbar(
                        thumbVisibility: true,
                        child: ListView(
                          children: filteredItems.map((item) {
                            final isSelected = isMultiSelect
                                ? controller.selectedValues?.contains(item) ??
                                    false
                                : controller.selectedValue == item;

                            return Expanded(
                              child: CupertinoListTile(
                                  title :Text(displayValue(item)),
                                  trailing : CupertinoCheckbox(
                                    value: isSelected,
                                    // title: Text(displayValue(item)),
                                    onChanged: (bool? selected) {
                                      if (isMultiSelect) {
                                        final newSelectedValues = List<T>.from(
                                            controller.selectedValues ?? []);
                                        if (selected == true) {
                                          newSelectedValues.add(item);
                                        } else {
                                          newSelectedValues.remove(item);
                                        }
                                        controller.updateSelectedValues(
                                            newSelectedValues);
                                      } else {
                                        controller.updateSelectedValue(item);
                                        // Navigator.pop(context);
                                        Get.back();
                                      }
                                      setState(() {}); // Update UI
                                    },
                                  ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    if (isMultiSelect)
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => Get.back(),
                        child: Text("Done",
                            style: TextStyle(color: theme.primaryColor)),
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
