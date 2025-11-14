import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class TestableAssetImage extends AssetImage {
  const TestableAssetImage(super.assetName);

  @override
  Future<AssetBundleImageKey> obtainKey(ImageConfiguration configuration) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      final chosenBundle = bundle ?? configuration.bundle ?? rootBundle;
      return Future.value(
        AssetBundleImageKey(bundle: chosenBundle, name: keyName, scale: 1),
      );
    }

    return super.obtainKey(configuration);
  }
}
