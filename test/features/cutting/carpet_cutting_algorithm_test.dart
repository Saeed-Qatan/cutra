import 'package:cutra/features/cutting/data/models/cutting_models.dart';
import 'package:cutra/features/cutting/domain/algorithms/carpet_cutting_algorithm.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CarpetCuttingAlgorithm', () {
    const algorithm = CarpetCuttingAlgorithm();

    test('rejects a piece wider than the roll when rotation is disabled', () {
      final plan = algorithm.createPlan(
        stock: const CarpetRollStock(rollWidthMm: 1000),
        settings: const CutSettings(),
        pieces: const [
          CarpetPiece(
            id: 'P1',
            label: 'wide carpet',
            widthMm: 1200,
            heightMm: 800,
          ),
        ],
      );

      expect(plan.placements, isEmpty);
      expect(plan.unplacedPieces, hasLength(1));
      expect(plan.unplacedPieces.single.reason, contains('أكبر من عرض الرول'));
    });

    test('rotates a piece when rotation makes it fit the roll width', () {
      final plan = algorithm.createPlan(
        stock: const CarpetRollStock(rollWidthMm: 1000),
        settings: const CutSettings(),
        pieces: const [
          CarpetPiece(
            id: 'P1',
            label: 'rotatable carpet',
            widthMm: 1200,
            heightMm: 800,
            canRotate: true,
          ),
        ],
      );

      expect(plan.unplacedPieces, isEmpty);
      expect(plan.placements.single.rotated, isTrue);
      expect(plan.placements.single.widthMm, 800);
      expect(plan.placements.single.heightMm, 1200);
    });

    test('includes kerf in used roll length', () {
      final plan = algorithm.createPlan(
        stock: const CarpetRollStock(rollWidthMm: 2000),
        settings: const CutSettings(kerfMm: 5),
        pieces: const [
          CarpetPiece(id: 'P1', label: 'one', widthMm: 1000, heightMm: 500),
        ],
      );

      expect(plan.usedLengthMm, 505);
      expect(plan.usedAreaMm, 500000);
      expect(plan.wasteAreaMm, 510000);
    });

    test('respects an available roll length limit', () {
      final plan = algorithm.createPlan(
        stock: const CarpetRollStock(rollWidthMm: 1000, availableLengthMm: 700),
        settings: const CutSettings(),
        pieces: const [
          CarpetPiece(id: 'P1', label: 'first', widthMm: 1000, heightMm: 600),
          CarpetPiece(id: 'P2', label: 'second', widthMm: 1000, heightMm: 600),
        ],
      );

      expect(plan.placements, hasLength(1));
      expect(plan.unplacedPieces, hasLength(1));
      expect(plan.unplacedPieces.single.reason, contains('الطول المتاح'));
    });

    test('calculates utilization and waste percentages', () {
      final plan = algorithm.createPlan(
        stock: const CarpetRollStock(rollWidthMm: 1000),
        settings: const CutSettings(),
        pieces: const [
          CarpetPiece(id: 'P1', label: 'half', widthMm: 500, heightMm: 1000),
        ],
      );

      expect(plan.usedLengthMm, 1000);
      expect(plan.utilizationPercent, 50);
      expect(plan.wastePercent, 50);
    });
  });
}
