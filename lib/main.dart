import 'package:flutter/material.dart';
import 'package:flutter_module_sample/routing/naviagtion_delegate.dart';
import 'package:flutter_module_sample/routing/navigation_parser.dart';
import 'package:flutter_module_sample/routing/navigation_stack.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  usePathUrlStrategy();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stack = ref.watch(navigationStackProvider);
    return MaterialApp.router(
      title: 'Main App',
      routeInformationParser: NavigationParser(),
      routerDelegate: NavigationDelegate(stack),
    );
  }
}
