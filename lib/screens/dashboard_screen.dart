import 'package:flutter/material.dart';
import 'package:flutter_module_sample/navigation/navigations.dart';
import 'package:flutter_module_sample/routing/navigation_stack_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Dashboard')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => ref.push(DashboardScreen2Page()),
              child: const Text('Open Dashboard 2'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => ref.push(DashboardScreenLoan()),
              child: const Text('Open Loan Module'),
            ),
          ],
        ),
      ),
    );
  }
}