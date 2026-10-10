import 'package:cutra/features/cutting/data/models/cutting_models.dart';
import 'package:cutra/features/cutting/domain/algorithms/manual_cut_engine.dart';
import 'package:cutra/features/cutting/presentation/controllers/manual_cutting_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ManualCutEngine', () {
    const engine = ManualCutEngine();

    test('vertical split creates left and right regions', () {
      final layout = ManualCutLayout.initial(
        const CarpetRollStock(rollWidthMm: 1000, availableLengthMm: 800),
      );

      final result = engine.splitSelected(
        layout: layout,
        direction: CutDirection.vertical,
        positionMm: 400,
      );

      expect(result.regions, hasLength(2));
      expect(result.regions[0].widthMm, 400);
      expect(result.regions[1].xMm, 400);
      expect(result.regions[1].widthMm, 600);
    });

    test('horizontal split creates top and bottom regions', () {
      final layout = ManualCutLayout.initial(
        const CarpetRollStock(rollWidthMm: 1000, availableLengthMm: 800),
      );

      final result = engine.splitSelected(
        layout: layout,
        direction: CutDirection.horizontal,
        positionMm: 300,
      );

      expect(result.regions, hasLength(2));
      expect(result.regions[0].heightMm, 300);
      expect(result.regions[1].yMm, 300);
      expect(result.regions[1].heightMm, 500);
    });

    test('rejects cut position outside the selected region', () {
      final layout = ManualCutLayout.initial(
        const CarpetRollStock(rollWidthMm: 1000, availableLengthMm: 800),
      );

      expect(
        () => engine.splitSelected(
          layout: layout,
          direction: CutDirection.vertical,
          positionMm: 1000,
        ),
        throwsArgumentError,
      );
    });
  });

  group('ManualCuttingController', () {
    test('supports execute, undo, redo and reset', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final controller = container.read(
        manualCuttingControllerProvider.notifier,
      );
      controller.setPosition(1000);
      controller.executeCut();

      expect(
        container.read(manualCuttingControllerProvider).layout.regions,
        hasLength(2),
      );

      controller.undo();
      expect(
        container.read(manualCuttingControllerProvider).layout.regions,
        hasLength(1),
      );

      controller.redo();
      expect(
        container.read(manualCuttingControllerProvider).layout.regions,
        hasLength(2),
      );

      controller.reset();
      expect(
        container.read(manualCuttingControllerProvider).layout.regions,
        hasLength(1),
      );
    });
  });
}
