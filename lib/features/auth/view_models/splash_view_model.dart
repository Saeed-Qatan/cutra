import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashViewModelProvider = StateNotifierProvider<SplashViewModel, bool>(
  (ref) => SplashViewModel(),
);

class SplashViewModel extends StateNotifier<bool> {
  static const displayDuration = Duration(seconds: 5);
  Timer? _timer;

  SplashViewModel() : super(false);

  void start() {
    if (state || _timer != null) return;
    _timer = Timer(displayDuration, () => state = true);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
