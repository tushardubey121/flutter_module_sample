import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../navigation/browser_back_stub.dart'
    if (dart.library.html) '../navigation/browser_back_web.dart';
import 'go_router_provider.dart';

extension RouterRef on WidgetRef {
  GoRouter get _router => read(goRouterProvider);

  /// Navigate to [location] (declarative — syncs with browser history on web).
  void go(String location, {Object? extra}) {
    _router.go(location, extra: extra);
  }

  void goNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
    String? fragment,
  }) {
    _router.goNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
      fragment: fragment,
    );
  }

  /// Whether the router can pop the current route.
  bool canPop() => _router.canPop();

  /// In-app back. On web uses [browserHistoryBack] so the browser stack stays
  /// in sync (avoids `go('/')` leaving a stale `/dashboard2` history entry).
  void pop<T extends Object?>({T? result, String fallback = '/'}) {
    if (kIsWeb) {
      browserHistoryBack();
      return;
    }
    if (_router.canPop()) {
      _router.pop(result);
    } else {
      _router.go(fallback);
    }
  }

  Future<T?> push<T extends Object?>(String location, {Object? extra}) {
    return _router.push<T>(location, extra: extra);
  }
}
