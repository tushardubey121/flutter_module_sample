import 'package:dummy_flutter_module/src/loan_module_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module_sample/routing/navigation_stack_item.dart';
import 'package:flutter_module_sample/screens/dashboard_screen.dart';
import 'package:flutter_module_sample/screens/dashboard_screen2.dart';

import 'navigation_stack.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();

class NavigationDelegate extends RouterDelegate<NavigationStack>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  NavigationDelegate(this.stack) {
    stack.addListener(notifyListeners);
  }

  final NavigationStack stack;

  @override
  void dispose() {
    stack.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey = globalNavigatorKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: _pages(),
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        stack.pop();
        return true;
      },
    );
  }

  List<Page<void>> _pages() => stack.items
      .map(
        (item) => switch (item) {
          DashboardScreenPage() => MaterialPage<void>(
              // key: ValueKey(item),
              child: const DashboardScreen(),
            ),
          DashboardScreen2Page() => MaterialPage<void>(
              // key: ValueKey(item),
              child: const DashboardScreen2(),
            ),
          DashboardScreenLoan(:final location) => MaterialPage<void>(
              // key: ValueKey('loan-$location'),
              child: LoanModuleShell(
                location: location,
                onLocationChanged: stack.updateLoanLocation,
                onExit: stack.pop,
              ),
            ),
        },
      )
      .toList();

  @override
  NavigationStack get currentConfiguration => stack;

  @override
  Future<void> setNewRoutePath(NavigationStack configuration) async {
    stack.items = configuration.items;
  }
}