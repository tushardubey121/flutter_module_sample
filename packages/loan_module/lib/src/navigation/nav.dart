import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'browser_back_stub.dart' if (dart.library.html) 'browser_back_web.dart';

extension Nav on WidgetRef {
  void goTo(String location) => this.context.go(location);

  Future<T?> push<T>(String location) => this.context.push<T>(location);

  void pop({String fallback = '/'}) {
    if (kIsWeb) {
      if (this.context.canPop()) {
        browserHistoryBack();
      } else {
        this.context.go(fallback);
      }
      return;
    }
    if (this.context.canPop()) {
      this.context.pop();
    } else {
      this.context.go(fallback);
    }
  }
}
