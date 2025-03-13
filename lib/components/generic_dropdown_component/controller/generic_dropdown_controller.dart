import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenericDropdownController<T> extends GetxController {
  Rx<T?> selectedValue = Rx<T?>(null);
  RxList<T> selectedValues = RxList<T>([]);
  RxString searchText = ''.obs;

  final TextEditingController textController = TextEditingController();
  final String Function(T) displayValue;

  GenericDropdownController({
    T? initialSelectedValue,
    List<T>? initialSelectedValues,
    required this.displayValue,
  }) {
    if (initialSelectedValue != null) {
      selectedValue.value = initialSelectedValue;
    }
    if (initialSelectedValues != null) {
      selectedValues.addAll(initialSelectedValues);
    }
    _updateText();
  }

  void updateSearchText(String text) {
    searchText.value = text;
  }

  void updateSelectedValue(T? value) {
    selectedValue.value = value;
    _updateText();
  }

  void updateSelectedValues(List<T> values) {
    selectedValues.value = values;
    _updateText();
  }

  void _updateText() {
    if (selectedValue.value != null) {
      textController.text = displayValue(selectedValue.value!);
    } else if (selectedValues.isNotEmpty) {
      textController.text = selectedValues.map(displayValue).join(', ');
    } else {
      textController.text = '';
    }
  }
}
