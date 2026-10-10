import 'package:cutra/features/cutting/data/models/cutting_models.dart';
import 'package:cutra/features/cutting/presentation/controllers/automatic_cutting_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AutomaticCuttingController', () {
    test('creates an initial cutting plan', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final state = container.read(automaticCuttingControllerProvider);

      expect(state.plan, isNotNull);
      expect(state.plan!.placements, isNotEmpty);
    });

    test('updates pieces and recomputes the plan', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final controller = container.read(
        automaticCuttingControllerProvider.notifier,
      );
      controller.addPiece(
        const CarpetPiece(
          id: 'P99',
          label: 'اختبار',
          widthMm: 500,
          heightMm: 500,
        ),
      );

      expect(container.read(automaticCuttingControllerProvider).plan, isNull);

      controller.optimize();
      final state = container.read(automaticCuttingControllerProvider);

      expect(state.plan, isNotNull);
      expect(
        state.plan!.placements.any((piece) => piece.pieceId == 'P99'),
        isTrue,
      );
    });

    test('reports algorithm errors without throwing from the controller', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final controller = container.read(
        automaticCuttingControllerProvider.notifier,
      );
      controller.updateRollWidth(0);
      controller.optimize();

      final state = container.read(automaticCuttingControllerProvider);
      expect(state.plan, isNull);
      expect(state.errorMessage, isNotNull);
    });
  });
}
