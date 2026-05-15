import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../src/loan_module_routes.dart';
import 'extra_routes_provider.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final extraRoutes = ref.watch(extraRoutesProvider);

  return GoRouter(
    initialLocation: '/',
    routes: [
      ...extraRoutes,
      ...LoanModule.routes,
    ],
  );
});
