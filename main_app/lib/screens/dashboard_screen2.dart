import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main_app/navigation/navigations.dart';

class DashboardScreen2 extends ConsumerWidget {
  const DashboardScreen2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Dashboard 2')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => ref.pop(),
          child: const Text('Back To Dashboard'),
        ),
      ),
    );
  }
}
