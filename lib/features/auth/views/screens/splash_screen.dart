import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_error_widget.dart';
import '../../view_models/auth_view_model.dart';
import '../../view_models/splash_view_model.dart';
import '../widgets/splash/grid_background_painter.dart';
import '../widgets/splash/splash_footer_indicator.dart';
import '../widgets/splash/splash_header_bar.dart';
import '../widgets/splash/splash_identity_block.dart';
import '../widgets/splash/technical_corner_marks.dart';

/// Displays the full identity while the session initializes in parallel.
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) ref.read(splashViewModelProvider.notifier).start();
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);
    final splashFinished = ref.watch(splashViewModelProvider);
    final failureMessage = authState.when(
      loading: () => null,
      error: (error, _) => error.toString(),
      data: (state) => state.failure?.message,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const Positioned.fill(
            child: CustomPaint(painter: GridBackgroundPainter()),
          ),
          const TechnicalCornerMarks(),
          const Positioned.fill(child: _SplashContent()),
          if (splashFinished && failureMessage != null)
            Positioned.fill(
              child: ColoredBox(
                color: Colors.white,
                child: Center(
                  child: AppErrorWidget(
                    message: failureMessage,
                    onRetry: () => ref.invalidate(authViewModelProvider),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Center column hosting header, identity block, and footer indicator.
class _SplashContent extends StatelessWidget {
  const _SplashContent();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: const Column(
                  children: [
                    SplashHeaderBar(),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Center(child: SplashIdentityBlock()),
                      ),
                    ),
                    SplashFooterIndicator(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
