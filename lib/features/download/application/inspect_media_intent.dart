import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef InspectMediaIntent = Future<void> Function(String normalizedUrl);

/// Remains null until the reviewed native authentication contract is available.
final inspectMediaIntentProvider = Provider<InspectMediaIntent?>((ref) => null);
