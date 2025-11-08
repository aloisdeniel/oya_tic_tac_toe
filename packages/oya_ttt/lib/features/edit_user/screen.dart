import 'package:flutter/material.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt/widgets/text_input.dart';

class EditUserModal extends StatefulWidget {
  const EditUserModal({super.key, this.title, this.name});

  final String? title;
  final String? name;

  @override
  State<EditUserModal> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserModal> {
  late final controller = TextEditingController(text: widget.name);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Background.room2(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              theme.color.main.background.withValues(alpha: 1),
              theme.color.main.background.withValues(alpha: 0.3),
              theme.color.main.background.withValues(alpha: 0.1),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 24,
          children: [
            const SizedBox(height: 48),
            Text(
              widget.title ?? "What's your name?",
              style: theme.text.header2.copyWith(
                color: theme.color.main.foreground,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextInput(hint: 'Name', controller: controller),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(48.0),
              child: AppButton(
                onPressed: () => Navigator.pop(context, controller.text),
                style: FrameStyle.primary,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  child: Text('Validate'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
