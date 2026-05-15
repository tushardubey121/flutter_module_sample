import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../router/router_ref_extensions.dart';

class LoanModule {
  static List<RouteBase> routes = [
    GoRoute(
      path: '/loan',
      builder: (context, state) => const LoanHomeScreen(),
    ),
    GoRoute(
      path: '/loan/approve',
      name: '/loan/approve',
      builder: (_, __) => const LoanHomeApproved(),
    ),
  ];
}

class LoanHomeScreen extends ConsumerWidget {
  const LoanHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Module'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () => ref.pop(),
              child: const Text('Back to Main App'),
            ),
            ElevatedButton(
              onPressed: () => ref.go('/loan/approve'),
              child: const Text('Loan approve'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoanHomeApproved extends ConsumerWidget {
  const LoanHomeApproved({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Approved'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Loan Approve success'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => ref.pop(fallback: '/loan'),
              child: const Text('Back to Loan'),
            ),
          ],
        ),
      ),
    );
  }
}
