import 'package:flutter_module_sample/routing/navigation_stack.dart';
import 'package:flutter_module_sample/routing/navigation_stack_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'browser_back_stub.dart' if (dart.library.html) 'browser_back_web.dart';

extension Navigations on WidgetRef {
  void goTo(String location) => this.context.go(location);

  void push<T>(NavigationStackItem screen) => this.read(navigationStackProvider).push(screen);
  void popPath<T>() => this.read(navigationStackProvider).pop();

  void pop({String fallback = '/'}) {
    if (this.context.canPop()) {
      this.context.pop();
      return;
    }
    maybeBrowserBackOrGo(this.context, fallback);
  }
}
