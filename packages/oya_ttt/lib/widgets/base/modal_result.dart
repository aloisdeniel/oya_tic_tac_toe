import 'package:flutter/widgets.dart';

typedef PickerResultResultCallback<T> =
    void Function(BuildContext context, T result);

class PickerResult<T> extends InheritedWidget {
  const PickerResult({super.key, required super.child, this.onResult});

  final PickerResultResultCallback<T>? onResult;

  static void send<T>(BuildContext context, T result) {
    final widget = context
        .dependOnInheritedWidgetOfExactType<PickerResult<T>>();
    if (widget?.onResult case final onResult?) {
      return onResult(context, result);
    }
    Navigator.pop(context, result);
  }

  @override
  bool updateShouldNotify(covariant PickerResult<T> oldWidget) {
    return (onResult != null) != (oldWidget.onResult != null);
  }
}
