import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:oya_ttt/theme/theme.dart';
import 'package:oya_ttt/widgets/base/fade_in.dart';
import 'package:oya_ttt/widgets/base/frame.dart';
import 'package:oya_ttt/widgets/big_background_text.dart';
import 'package:oya_ttt/widgets/button.dart';
import 'package:oya_ttt/widgets/character.dart';
import 'package:oya_ttt/widgets/frame_style.dart';
import 'package:oya_ttt/widgets/glitch.dart';
import 'package:oya_ttt_core/oya_ttt_core.dart';

class CharacterPicker extends StatefulWidget {
  const CharacterPicker({
    super.key,
    required this.initial,
    required this.onChanged,
    this.characters = GameCharacter.values,
  });

  final GameCharacter initial;
  final List<GameCharacter> characters;
  final ValueChanged<GameCharacter> onChanged;

  @override
  State<CharacterPicker> createState() => _CharacterPickerState();
}

class _CharacterPickerState extends State<CharacterPicker> {
  final _pageKey = GlobalKey();
  late final GameCharacter initial = widget.initial;
  GameCharacter characterAtPage(int i) {
    final index = initial.index - _initialPage + i;
    return widget.characters[index % widget.characters.length];
  }

  double get pageOpacity {
    return 2 * (0.5 - page + page.floor()).abs().clamp(0, 0.5);
  }

  static const _initialPage = 10000;
  late final pageController = PageController(
    viewportFraction: 0.45,
    initialPage: _initialPage,
  );

  double get page {
    if (pageController.hasClients) {
      if (pageController.page case final result?) {
        return result;
      }
    }
    return _initialPage.toDouble();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          key: Key('background_glow'),
          child: FadeIn(
            delay: const Duration(milliseconds: 600),
            child: AnimatedBuilder(
              animation: pageController,
              builder: (context, _) {
                final character = characterAtPage(page.round());
                final accent = theme.color.accents(character);
                final translate = 2 * (0.5 - page + page.round());
                return Opacity(
                  opacity: pageOpacity * 0.2,
                  child: Transform.translate(
                    offset: Offset(-math.sqrt(translate) * 300, 0),
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(
                        sigmaX: 20 * pageOpacity,
                        sigmaY: 10,
                      ),
                      child: BigBackgroundText(
                        text: '•' * 40,
                        color: accent.foreground,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Positioned.fill(
          key: Key('background_text'),
          child: FadeIn(
            delay: const Duration(milliseconds: 500),
            child: AnimatedBuilder(
              animation: pageController,
              builder: (context, _) {
                final character = characterAtPage(page.round());
                final accent = theme.color.accents(character);
                final translate = 2 * (0.5 - page + page.round());
                return ShaderMask(
                  shaderCallback: (size) {
                    return LinearGradient(
                      colors: [
                        Color(0x00FFFFFF),
                        Color(0xFFFFFFFF),
                        Color(0x00FFFFFF),
                      ],
                      stops: [0.1, 0.5, 0.9],
                    ).createShader(size);
                  },
                  child: Opacity(
                    opacity: pageOpacity,
                    child: Transform.translate(
                      offset: Offset(-math.sqrt(translate) * 100, 0),
                      child: AnimatedGlitch(
                        horizontalShake: 0.01,
                        scanLineJitter: 0.3,
                        child: BigBackgroundText(
                          text: character.name,
                          color: accent.foreground,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          key: _pageKey,
          padding: const EdgeInsets.only(bottom: 42),
          child: FadeIn(
            child: PageView.builder(
              controller: pageController,
              itemBuilder: (context, i) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedBuilder(
                    animation: pageController,
                    child: AppCharacter(
                      gradientFromBottom: [
                        theme.color.main.background,
                        theme.color.main.background.withValues(alpha: 0),
                      ],
                      character: characterAtPage(i),
                    ),
                    builder: (context, child) {
                      final distanceFromPage = (i.toDouble() - page)
                          .abs()
                          .clamp(0.0, 1.0);
                      return ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: distanceFromPage * 8,
                        ),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            theme.color.main.background.withValues(
                              alpha: distanceFromPage * 0.9,
                            ),
                            BlendMode.srcATop,
                          ),
                          child: Transform.scale(
                            scale: 0.8 + 0.2 * (1 - distanceFromPage),
                            child: child,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Center(
            child: AnimatedBuilder(
              animation: pageController,
              builder: (context, _) {
                final character = characterAtPage(page.round());
                final accent = theme.color.accents(character);
                final opacity = pageOpacity;
                return Opacity(
                  opacity: opacity,
                  child: DefaultFrameStyle(
                    style: FrameStyle.regular,
                    padding: const EdgeInsets.all(24),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 220),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Transform.translate(
                            offset: Offset(
                              0,
                              Curves.easeInOutCubic.transform(1 - opacity) * 20,
                            ),
                            child: Frame(
                              child: Center(
                                child: Text(
                                  character.name.toUpperCase(),
                                  style: theme.text.button.copyWith(
                                    color: accent.foreground,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -50,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Transform.translate(
                                offset: Offset(
                                  0,
                                  Curves.easeInOutCubic.transform(1 - opacity) *
                                      10,
                                ),
                                child: AnimatedGlitch(
                                  horizontalShake: 0.2,
                                  colorDrift: 0.4,
                                  child: AppCharacterSymbol(
                                    character: character,
                                    size: 64,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        Positioned(
          bottom: 12,
          left: 24,
          child: AppButton(
            onPressed: () => pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            ),
            style: FrameStyle.regular,
            child: Icon(Icons.chevron_left),
          ),
        ),
        Positioned(
          bottom: 12,
          right: 24,
          child: AppButton(
            onPressed: () => pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            ),
            style: FrameStyle.regular,
            child: Icon(Icons.chevron_right),
          ),
        ),
      ],
    );
  }
}
