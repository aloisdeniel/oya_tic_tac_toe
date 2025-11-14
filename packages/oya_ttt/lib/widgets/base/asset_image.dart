import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class TestableAssetImage extends AssetImage {
  const TestableAssetImage(super.assetName);

  static bool get isTestEnvironment =>
      Platform.environment.containsKey('FLUTTER_TEST');

  @override
  Future<AssetBundleImageKey> obtainKey(ImageConfiguration configuration) {
    if (isTestEnvironment) {
      final chosenBundle = bundle ?? configuration.bundle ?? rootBundle;
      return Future.value(
        AssetBundleImageKey(bundle: chosenBundle, name: keyName, scale: 1),
      );
    }

    return super.obtainKey(configuration);
  }
}
