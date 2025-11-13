import 'package:flutter/material.dart';
import 'package:oya_ttt/theme/theme.dart';

/// A themed text input field.
///
/// Provides a text field styled according to the app theme with support
/// for hint text. The field uses transparent background and themed colors
/// for both the input text and hint.
///
/// Example:
/// ```dart
/// TextInput(
///   controller: nameController,
///   hint: 'Enter your name',
/// )
/// ```
class TextInput extends StatefulWidget {
  const TextInput({super.key, required this.controller, required this.hint});

  /// The hint text to display when the field is empty.
  final String hint;

  /// The controller for managing the text field's value.
  final TextEditingController controller;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Material(
      color: Colors.transparent,
      child: TextField(
        controller: widget.controller,
        maxLines: 1,
        style: theme.text.body.copyWith(
          color: theme.color.highlight.foreground,
        ),
        decoration: InputDecoration(
          hintText: widget.hint,
          filled: true,
          hintMaxLines: 1,

          contentPadding: EdgeInsetsGeometry.symmetric(
            horizontal: theme.spacing.tiny,
            vertical: theme.spacing.small,
          ),
          border: InputBorder.none,
          fillColor: theme.color.highlight.background,
          hintStyle: theme.text.body.copyWith(
            color: theme.color.highlight.foregroundSecondary,
          ),
        ),
      ),
    );
  }
}
