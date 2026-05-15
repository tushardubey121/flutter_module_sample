import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:loan_module/loan_module.dart';

import 'router/app_extra_routes.dart';

void main() {
  usePathUrlStrategy();
  runApp(
    ProviderScope(
      overrides: [extraRoutesOverride],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'Main App',
      routerConfig: router,
    );
  }
}
