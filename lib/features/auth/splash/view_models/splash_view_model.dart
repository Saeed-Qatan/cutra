import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashViewModelProvider = NotifierProvider<SplashViewModel, bool>(
  SplashViewModel.new,
);

/// Manages the five-second Splash display timer.
///
/// Exposes [start] to begin the countdown after the first frame.
/// Automatically cancels the timer on disposal.
class SplashViewModel extends Notifier<bool> {
  static const displayDuration = Duration(seconds: 5);
  Timer? _timer;

  @override
  bool build() {
    ref.onDispose(() => _timer?.cancel());
    return false;
  }

  /// Starts the display timer if it has not been started yet.
  void start() {
    if (state || _timer != null) return;
    _timer = Timer(displayDuration, () => state = true);
  }
}
