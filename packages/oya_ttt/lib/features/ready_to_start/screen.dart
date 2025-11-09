import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oya_ttt/features/ready_to_start/player.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/background.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt/widgets/glitch.dart';
import 'package:oya_ttt/widgets/header.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

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
              Header(
                title: Text('Ready to Start?'),
                subtitle: Text('${game.mode.name} Mode'),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 24,
                    children: [
                      Expanded(
                        child: PlayerPreview(
                          player: game.player1,
                          isPlayer2: false,
                        ),
                      ),
                      Center(
                        child: AnimatedGlitch(
                          colorDrift: 0.3,
                          scanLineJitter: 0.4,
                          horizontalShake: 0.04,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            child: Text(
                              'VS',
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
                        child: PlayerPreview(
                          player: game.player2,
                          isPlayer2: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  spacing: 24,
                  children: [
                    AppButton(
                      style: FrameStyle.regular,
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      child: Text('CANCEL'),
                    ),
                    Expanded(
                      child: AppButton(
                        style: FrameStyle.primary,
                        onPressed: () async {
                          context.go('/game?id=${game.id}');
                        },
                        child: Text('START GAME', textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
