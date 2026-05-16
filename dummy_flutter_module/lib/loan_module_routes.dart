import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loan_module/src/screens/loan_home_screen.dart';

import 'src/navigation/nav.dart';
import 'src/screens/home_load_approve.dart';

class LoanModule {
  static List<RouteBase> get routes => [
        GoRoute(
          path: '/loan',
          builder: (_, __) => const LoanHomeScreen(),
        ),
        GoRoute(
          path: '/loan/approve',
          builder: (_, __) => const LoanHomeApproved(),
        ),
      ];
}
