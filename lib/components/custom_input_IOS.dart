import 'package:flutter/cupertino.dart';

enum InputType { text, number, date, password, time } // Enum for input types

class CustomInputIOS extends StatefulWidget {
  final String? labelText;
  final bool isMandatory;
  final String? hintText;
  final TextEditingController? controller;
  final InputType inputType; // Dynamically set input type
  final void Function(String)? onChanged;
  final void Function(DateTime?)? onDateSelected; // For date input
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomInputIOS({
    Key? key,
    this.labelText,
    this.hintText,
    this.isMandatory = false,
    this.controller,
    this.inputType = InputType.text, // Default is text
    this.onChanged,
    this.onDateSelected,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  _CustomInputIOSState createState() => _CustomInputIOSState();
}

class _CustomInputIOSState extends State<CustomInputIOS> {
  bool _isPasswordVisible = false; // State to toggle password visibility
  String? _errorText; // Variable to hold error message for validation

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context); // Fetch the current theme
    final textColor = theme.brightness == Brightness.dark
        ? CupertinoColors.white // Use white for dark mode
        : CupertinoColors.black; // Use black for light mode

    return GestureDetector(
      onTap: widget.inputType == InputType.date
          ? () async {
        // Show date picker for date input
        final selectedDate = await showCupertinoModalPopup<DateTime>(
          context: context,
          builder: (BuildContext context) {
            return CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (DateTime newDateTime) {
                widget.controller?.text =
                "${newDateTime.toLocal()}".split(' ')[0];
                if (widget.onDateSelected != null) {
                  widget.onDateSelected!(newDateTime);
                }
              },
            );
          },
        );
      }
          : widget.inputType == InputType.time
          ? () async {
        final selectedDuration = await showCupertinoModalPopup<Duration>(
          context: context,
          builder: (BuildContext context) {
            return CupertinoTimerPicker(
              initialTimerDuration: Duration.zero,
              onTimerDurationChanged: (Duration newDuration) {
                final formattedTime =
                    "${newDuration.inHours}:${newDuration.inMinutes % 60}";
                widget.controller?.text = formattedTime;
              },
            );
          },
        );
      }
          : null,
      child: AbsorbPointer(
        absorbing: widget.inputType == InputType.date || widget.inputType == InputType.time,
        child: CupertinoTextField(
          controller: widget.controller,
          keyboardType: _getKeyboardType(),
          obscureText: widget.inputType == InputType.password && !_isPasswordVisible,
          onChanged: widget.onChanged,
          style: TextStyle(
            fontSize: 16.0,
            color: textColor, // Dynamic text color based on theme
          ),
          placeholder: widget.hintText,
          prefix: widget.prefixIcon,
          suffix: widget.inputType == InputType.password
              ? CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(
              _isPasswordVisible ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
              color: theme.primaryColor,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          )
              : widget.suffixIcon,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            border: Border.all(color: theme.primaryColor.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(8.0),

          ),
        ),
      ),
    );
  }

  // Helper method to determine the keyboard type based on input type
  TextInputType _getKeyboardType() {
    switch (widget.inputType) {
      case InputType.number:
        return TextInputType.number;
      case InputType.date:
      case InputType.time:
        return TextInputType.none; // Disable keyboard for date and time input
      case InputType.password:
      case InputType.text:
      default:
        return TextInputType.text;
    }
  }

  // You can manually call this method for validation (e.g., when the user submits the form).
  String? validateInput() {
    if (widget.isMandatory && (widget.controller?.text == null || widget.controller?.text.isEmpty == true)) {
      setState(() {
        _errorText = 'This field is mandatory';
      });
      return _errorText;
    }
    setState(() {
      _errorText = null;
    });
    return null; // No error
  }
}