import 'package:flutter/material.dart';

import 'navigation_stack.dart';
import 'navigation_stack_item.dart';

class NavigationParser extends RouteInformationParser<NavigationStack> {
  @override
  Future<NavigationStack> parseRouteInformation(RouteInformation routeInformation) async {
    final path = _normalizePath(routeInformation.uri.path);

    if (path.startsWith('/loan')) {
      return NavigationStack([
        DashboardScreenPage(),
        DashboardScreenLoan(location: path),
      ]);
    }

    return switch (path) {
      '/' => NavigationStack([DashboardScreenPage()]),
      '/dashboard' => NavigationStack([
          DashboardScreenPage(),
          DashboardScreen2Page(),
        ]),
      _ => NavigationStack([DashboardScreenPage()]),
    };
  }

  @override
  RouteInformation restoreRouteInformation(NavigationStack configuration) {
    if (configuration.items.isEmpty) {
      return RouteInformation(uri: Uri.parse('/'));
    }
    final path = _pathFor(configuration.items.last);
    return RouteInformation(uri: Uri.parse(path));
  }

  String _pathFor(NavigationStackItem item) => switch (item) {
        DashboardScreenPage() => '/',
        DashboardScreen2Page() => '/dashboard',
        DashboardScreenLoan(:final location) => location,
      };

  String _normalizePath(String path) {
    if (path.isEmpty) return '/';
    return path.startsWith('/') ? path : '/$path';
  }
}
