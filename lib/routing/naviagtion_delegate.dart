import 'package:dummy_flutter_module/loan_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module_sample/routing/navigation_stack_item.dart';
import 'package:flutter_module_sample/screens/dashboard_screen.dart';
import 'package:flutter_module_sample/screens/dashboard_screen2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'navigation_stack.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();

class NavigationDelegate extends RouterDelegate<NavigationStack> with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final NavigationStack stack;

  NavigationDelegate(this.stack) : super() {
    stack.addListener(notifyListeners);
  }

  @override
  void dispose() {
    stack.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  final navigatorKey = globalNavigatorKey;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Navigator(
        key: navigatorKey,
        pages: _pages(ref),
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          stack.pop();
          return true;
        },
      );
    });
  }

  List<Page> _pages(WidgetRef ref) => stack.items
      .mapIndexed((e, i) => switch (e) {
            DashboardScreenPage() => MaterialPage(child: DashboardScreen()),
            DashboardScreen2Page() => MaterialPage(child: DashboardScreen2()),
            DashboardScreenLoan() => MaterialPage(child: LoanHomeScreen()),
          })
      .toList();

  @override
  NavigationStack get currentConfiguration => stack;

  @override
  Future<void> setNewRoutePath(NavigationStack configuration) async {
    stack.items = configuration.items;
  }
}

extension _IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
