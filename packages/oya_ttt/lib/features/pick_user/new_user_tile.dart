import 'package:flutter/material.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class NewUserTile extends StatelessWidget {
  const NewUserTile({super.key, required this.onUserCreated});

  final ValueChanged<User> onUserCreated;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AppButton(
      onPressed: () {
        // TODO
      },
      style: FrameStyle.regular,
      child: Row(
        spacing: 12,
        children: [
          SizedBox.square(dimension: 82, child: Icon(Icons.add)),
          Text('Create a new user', style: theme.text.button),
        ],
      ),
    );
  }
}
