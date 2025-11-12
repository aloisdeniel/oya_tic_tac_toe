import 'package:flutter/widgets.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt/widgets/diagonal_decorated.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';
import 'package:oya_ttt/l10n/app_localizations.dart';

class NewGameProgress extends StatelessWidget {
  const NewGameProgress({
    super.key,
    this.mode,
    this.player1Name,
    this.player1Character,
    this.player2Name,
    this.player2Character,
  });

  final GameMode? mode;
  final String? player1Name;
  final GameCharacter? player1Character;
  final String? player2Name;
  final GameCharacter? player2Character;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NewGameProgressStep(
          isCompleted: mode != null,
          child: Text(mode?.name ?? l10n.mode),
        ),
        NewGameProgressStep(
          isCompleted: player1Name != null,
          child: Text(player1Name ?? l10n.player1),
        ),
        NewGameProgressStep(
          isCompleted: player1Character != null,
          child: player1Character != null
              ? AppCharacterAvatar(character: player1Character!, size: 50)
              : Text(l10n.character1),
        ),

        NewGameProgressStep(
          isCompleted: player2Name != null,
          child: Text(player2Name ?? l10n.player2),
        ),
        NewGameProgressStep(
          isCompleted: player2Character != null,
          child: player2Character != null
              ? AppCharacterAvatar(character: player2Character!, size: 50)
              : Text(l10n.character2),
        ),
      ],
    );
  }
}

class NewGameProgressStep extends StatelessWidget {
  const NewGameProgressStep({
    super.key,
    required this.isCompleted,
    required this.child,
  });

  final bool isCompleted;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final foreground = theme.color.highlight.foreground.withValues(
      alpha: isCompleted ? 1 : 0.3,
    );
    return SizedBox(
      width: 74,
      child: Column(
        spacing: theme.spacing.tiny,
        children: [
          DiagonalDecorated(
            color: foreground,
            smallerEdge: DiagonalEdge.bottom,
            child: SizedBox(width: theme.spacing.medium, height: theme.spacing.small),
          ),
          DefaultTextStyle(
            style: theme.text.footnote.copyWith(color: foreground),
            maxLines: 1,
            child: child,
          ),
        ],
      ),
    );
  }
}
