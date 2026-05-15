import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Host app routes (e.g. dashboard) merged into [goRouterProvider].
final extraRoutesProvider = Provider<List<RouteBase>>((ref) => []);
