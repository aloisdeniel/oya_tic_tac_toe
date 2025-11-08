import 'package:flutter/material.dart';
import 'package:oya_ttt/theme/theme.dart';

class TextInput extends StatefulWidget {
  const TextInput({super.key, required this.controller, required this.hint});

  final String hint;
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
        style: theme.text.body.copyWith(color: theme.color.main.foreground),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: theme.text.body.copyWith(
            color: theme.color.main.foregroundSecondary,
          ),
        ),
      ),
    );
  }
}
