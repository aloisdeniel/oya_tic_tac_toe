import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oya_ttt/features/game/widgets/player_indicator.dart';
import 'package:oya_ttt/features/ready_to_start/widgets/character_presentation.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt/widgets/glitch.dart';
import 'package:oya_ttt/widgets/header.dart';
import 'package:oya_ttt/widgets/header_status.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';
import 'package:oya_ttt/l10n/app_localizations.dart';

class ReadyToStartModal extends StatelessWidget {
  const ReadyToStartModal({super.key, required this.game});
  final Game game;

  static Future<Game?> show(BuildContext context, {required Game game}) {
    return Navigator.push<Game>(
      context,
      MaterialPageRoute(builder: (context) => ReadyToStartModal(game: game)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return Background.elevator(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              theme.color.main.background.withValues(alpha: 1),
              theme.color.main.background.withValues(alpha: 0.6),
            ],
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: Column(
            children: [
              HeaderStatus(child: Text(l10n.modeWithName(game.mode.name).toUpperCase())),
              Header(title: Text(l10n.readyToStart)),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(theme.spacing.medium),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: theme.spacing.medium,
                    children: [
                      Expanded(
                        child: CharacterPresentation(
                          character: game.player1.character,
                        ),
                      ),
                      Center(
                        child: AnimatedGlitch(
                          colorDrift: 0.3,
                          scanLineJitter: 0.4,
                          horizontalShake: 0.04,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: theme.spacing.medium,
                            ),
                            child: Text(
                              l10n.vs,
                              style: theme.text.button.copyWith(
                                color: theme.color.main.foregroundSecondary,
                                fontSize: 100,
                                letterSpacing: -10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: CharacterPresentation(
                          character: game.player2.character,
                          direction: AppCharacterDirection.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Center(
                    child: AppButton(
                      style: FrameStyle.regular,
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      child: Text(l10n.cancel),
                    ),
                  ),
                  const Spacer(),
                  AppButton(
                    style: FrameStyle.primary,
                    onPressed: () async {
                      context.go('/game?id=${game.id}');
                    },
                    child: Text(l10n.startGame, textAlign: TextAlign.center),
                  ),
                ],
              ),
              SizedBox(height: theme.spacing.large),
              Row(
                spacing: theme.spacing.medium,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GamePlayerIndicator(
                        isActive: true,
                        player: game.player1,
                        direction: AppCharacterDirection.right,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GamePlayerIndicator(
                        isActive: true,
                        player: game.player2,
                        direction: AppCharacterDirection.left,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
