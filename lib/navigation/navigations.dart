import 'package:flutter_module_sample/routing/navigation_stack.dart';
import 'package:flutter_module_sample/routing/navigation_stack_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Host app navigation — Navigator 2.0 stack only (no go_router).
extension Navigations on WidgetRef {
  void push(NavigationStackItem screen) => read(navigationStackProvider).push(screen);

  void pop() => read(navigationStackProvider).pop();
}
