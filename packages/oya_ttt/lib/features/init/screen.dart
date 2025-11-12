import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oya_ttt/features/init/state.dart';
import 'package:oya_ttt/theme/data/color.dart';

class Init extends ConsumerWidget {
  const Init({super.key, required this.builder});

  final ValueWidgetBuilder<InitData> builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final init = ref.watch($init);
    return init.maybeWhen(
      data: (value) {
        return builder(context, value, null);
      },
      orElse: () => loading(context),
    );
  }

  Widget loading(BuildContext context) {
    const color = AppThemeColorData.dark();
    return Container(color: color.main.background);
  }
}
