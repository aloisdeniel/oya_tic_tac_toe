import 'dart:async';

import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

Future<void> precacheAllAssets(BuildContext context) async {
  final bundle = DefaultAssetBundle.of(context);
  final manifest = await AssetManifest.loadFromAssetBundle(bundle);
  for (var asset in manifest.listAssets()) {
    if (asset.endsWith('.png')) {
      final variants = manifest.getAssetVariants(asset);
      if (variants != null) {
        for (var variant in variants) {
          final ImageConfiguration config = createLocalImageConfiguration(
            context,
          );
          final Completer<void> completer = Completer<void>();
          final provider = ExactAssetImage(variant.key);
          final ImageStream stream = provider.resolve(config);
          ImageStreamListener? listener;
          listener = ImageStreamListener(
            (ImageInfo? image, bool sync) {
              if (!completer.isCompleted) {
                completer.complete();
              }
              // Give callers until at least the end of the frame to subscribe to the
              // image stream.
              // See ImageCache._liveImages
              SchedulerBinding.instance.addPostFrameCallback((
                Duration timeStamp,
              ) {
                image?.dispose();
                stream.removeListener(listener!);
              }, debugLabel: 'precacheImage.removeListener');
            },
            onError: (Object exception, StackTrace? stackTrace) {
              if (!completer.isCompleted) {
                completer.complete();
              }
              stream.removeListener(listener!);
              FlutterError.reportError(
                FlutterErrorDetails(
                  context: ErrorDescription('image failed to precache'),
                  library: 'image resource service',
                  exception: exception,
                  stack: stackTrace,
                  silent: true,
                ),
              );
            },
          );
          stream.addListener(listener);
          await completer.future;
        }
      }
    }
  }
}
