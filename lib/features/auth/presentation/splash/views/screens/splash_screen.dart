import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_models/splash_view_model.dart';
import '../../../views/widgets/common/grid_background_painter.dart';
import '../widgets/splash_footer_indicator.dart';
import '../widgets/splash_header_bar.dart';
import '../widgets/splash_identity_block.dart';
import '../../../views/widgets/common/technical_corner_marks.dart';

/// Displays the full identity for the five-second startup period.
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const Positioned.fill(
            child: CustomPaint(painter: GridBackgroundPainter()),
          ),
          const TechnicalCornerMarks(),
          const Positioned.fill(child: _SplashContent()),
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
