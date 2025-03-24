import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifier to manage counter state
class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0); // Initial state is 0

  void increment() => state++; // Increase counter
  void decrement() => state--; // Decrease counter
}

// Provider that exposes the counter state
final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});
