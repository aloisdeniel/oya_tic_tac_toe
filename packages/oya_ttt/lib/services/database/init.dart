export 'init.default.dart'
    if (dart.library.ffi) 'init.native.dart'
    if (dart.library.js_interop) 'init.web.dart';
