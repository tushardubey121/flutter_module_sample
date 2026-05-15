import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loan_module/loan_module.dart' show RouterRef;

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => ref.go('/dashboard2'),
              child: const Text('Open Dashboard 2'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => ref.go('/loan'),
              child: const Text('Open Loan Module'),
            ),
          ],
        ),
      ),
    );
  }
}
