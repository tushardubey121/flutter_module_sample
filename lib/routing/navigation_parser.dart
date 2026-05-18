import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'navigation_stack.dart';
import 'navigation_stack_item.dart';
import 'navigation_stack_keys.dart';

class NavigationParser extends RouteInformationParser<NavigationStack> {
  WidgetRef ref;
  BuildContext context;

  NavigationParser(this.ref, this.context);

  @override
  Future<NavigationStack> parseRouteInformation(RouteInformation routeInformation) async {
    final Uri uri = routeInformation.uri;
    List<String> pathSeg = uri.pathSegments.toSet().toList();
    List<NavigationStackItem> items = [];
    for (var i = 0; i < pathSeg.length; i++) {
      final String key = pathSeg[i];
      switch (key) {
        case NavigationStackKeys.dashboard:
          items.add(DashboardScreenPage());
          break;
        case NavigationStackKeys.dashboard_2:
          items.add(DashboardScreenPage());
          break;
        case NavigationStackKeys.loan:
          items.add(DashboardScreenLoan());
          break;
      }
    }
    if (items.isEmpty) items.add(DashboardScreenPage());
    return NavigationStack(items);
  }

  @override
  RouteInformation? restoreRouteInformation(NavigationStack configuration) {
    final location = configuration.items.fold<String>("", (previousValue, element) {
      final List<String> screens = previousValue.split("?");
      return "${screens.first}${getScreenKeys(element)}";
    });
    return RouteInformation(uri: Uri.parse(location));
  }

  String getScreenKeys(NavigationStackItem element) {
    return switch (element) {
      DashboardScreenPage() => NavigationStackKeys.dashboard,
      DashboardScreen2Page() => NavigationStackKeys.dashboard_2,
      DashboardScreenLoan() => NavigationStackKeys.loan,
    };
  }
}
