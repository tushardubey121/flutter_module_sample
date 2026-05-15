import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loan_module/loan_module.dart';

import '../screens/dashboard_screen.dart';
import '../screens/dashboard_screen2.dart';

/// Dashboard routes registered into [goRouterProvider] via [extraRoutesProvider].
final appExtraRoutesProvider = Provider<List<RouteBase>>((ref) {
  return [
    GoRoute(
      path: '/',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/dashboard2',
      builder: (context, state) => const DashboardScreen2(),
    ),
  ];
});

/// Merges host routes into the shared [extraRoutesProvider].
final extraRoutesOverride = extraRoutesProvider.overrideWith(
  (ref) => ref.watch(appExtraRoutesProvider),
);
