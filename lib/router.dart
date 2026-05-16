import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'screens/dashboard_screen.dart';
import 'screens/dashboard_screen2.dart';

/// App router — host routes + injected plugin routes.
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/dashboard2',
        builder: (_, __) => const DashboardScreen2(),
      ),
      // ...LoanModule.routes,
    ],
  );
});
