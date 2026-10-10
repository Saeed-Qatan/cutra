import '../../data/models/cutting_models.dart';

class CarpetCuttingAlgorithm {
  const CarpetCuttingAlgorithm();

  CuttingPlan createPlan({
    required CarpetRollStock stock,
    required List<CarpetPiece> pieces,
    required CutSettings settings,
  }) {
    _validateStock(stock);
    _validateSettings(settings);

    final pending = _expandPieces(pieces);
    pending.sort((a, b) {
      final heightCompare = b.maxHeight.compareTo(a.maxHeight);
      if (heightCompare != 0) return heightCompare;
      return b.maxWidth.compareTo(a.maxWidth);
    });

    final shelves = <_Shelf>[];
    final placements = <PlacedCutPiece>[];
    final unplaced = <UnplacedCutPiece>[];

    for (final item in pending) {
      final oriented = _chooseOrientation(
        item,
        stock.rollWidthMm,
        settings.kerfMm,
      );
      if (oriented == null) {
        unplaced.add(
          UnplacedCutPiece(
            piece: item.piece,
            copyIndex: item.copyIndex,
            reason: 'القطعة أكبر من عرض الرول ولا يمكن وضعها بالاتجاه الحالي',
          ),
        );
        continue;
      }

      final packedWidth = oriented.widthMm + settings.kerfMm;
      final packedHeight = oriented.heightMm + settings.kerfMm;
      _Shelf? shelf;

      for (final candidate in shelves) {
        if (candidate.remainingWidth >= packedWidth &&
            candidate.heightMm >= packedHeight) {
          shelf = candidate;
          break;
        }
      }

      if (shelf == null) {
        final nextY = shelves.fold<int>(
          0,
          (total, current) => total + current.heightMm,
        );
        final projectedLength = nextY + packedHeight;
        final availableLength = stock.availableLengthMm;
        if (availableLength != null && projectedLength > availableLength) {
          unplaced.add(
            UnplacedCutPiece(
              piece: item.piece,
              copyIndex: item.copyIndex,
              reason: 'القطعة تتجاوز الطول المتاح للرول',
            ),
          );
          continue;
        }
        shelf = _Shelf(
          yMm: nextY,
          heightMm: packedHeight,
          rollWidthMm: stock.rollWidthMm,
        );
        shelves.add(shelf);
      }

      final placement = PlacedCutPiece(
        pieceId: item.piece.id,
        label: item.piece.label,
        copyIndex: item.copyIndex,
        xMm: shelf.usedWidth,
        yMm: shelf.yMm,
        widthMm: oriented.widthMm,
        heightMm: oriented.heightMm,
        rotated: oriented.rotated,
      );
      shelf.usedWidth += packedWidth;
      placements.add(placement);
    }

    final usedLength = shelves.fold<int>(
      0,
      (total, shelf) => total + shelf.heightMm,
    );
    final materialArea = stock.rollWidthMm * usedLength;
    final usedArea = placements.fold<int>(
      0,
      (total, item) => total + (item.widthMm * item.heightMm),
    );
    final wasteArea = (materialArea - usedArea).clamp(0, materialArea);
    final utilization = materialArea == 0 ? 0.0 : usedArea * 100 / materialArea;
    final waste = materialArea == 0 ? 0.0 : wasteArea * 100 / materialArea;

    return CuttingPlan(
      stock: stock,
      settings: settings,
      placements: placements,
      unplacedPieces: unplaced,
      usedLengthMm: usedLength,
      usedAreaMm: usedArea,
      wasteAreaMm: wasteArea,
      utilizationPercent: _roundPercent(utilization),
      wastePercent: _roundPercent(waste),
    );
  }

  List<_PendingPiece> _expandPieces(List<CarpetPiece> pieces) {
    final expanded = <_PendingPiece>[];
    for (final piece in pieces) {
      _validatePiece(piece);
      for (var i = 1; i <= piece.quantity; i++) {
        expanded.add(_PendingPiece(piece: piece, copyIndex: i));
      }
    }
    return expanded;
  }

  _OrientedPiece? _chooseOrientation(
    _PendingPiece item,
    int rollWidthMm,
    int kerfMm,
  ) {
    final normal = _OrientedPiece(
      widthMm: item.piece.widthMm,
      heightMm: item.piece.heightMm,
      rotated: false,
    );
    final normalFits = normal.widthMm + kerfMm <= rollWidthMm;

    if (!item.piece.canRotate) {
      return normalFits ? normal : null;
    }

    final rotated = _OrientedPiece(
      widthMm: item.piece.heightMm,
      heightMm: item.piece.widthMm,
      rotated: true,
    );
    final rotatedFits = rotated.widthMm + kerfMm <= rollWidthMm;

    if (normalFits && rotatedFits) {
      return normal.heightMm <= rotated.heightMm ? normal : rotated;
    }
    if (normalFits) return normal;
    if (rotatedFits) return rotated;
    return null;
  }

  void _validateStock(CarpetRollStock stock) {
    if (stock.rollWidthMm <= 0) {
      throw ArgumentError.value(
        stock.rollWidthMm,
        'rollWidthMm',
        'must be positive',
      );
    }
    final length = stock.availableLengthMm;
    if (length != null && length <= 0) {
      throw ArgumentError.value(
        length,
        'availableLengthMm',
        'must be positive',
      );
    }
  }

  void _validatePiece(CarpetPiece piece) {
    if (piece.widthMm <= 0 || piece.heightMm <= 0 || piece.quantity <= 0) {
      throw ArgumentError('Piece dimensions and quantity must be positive');
    }
  }

  void _validateSettings(CutSettings settings) {
    if (settings.kerfMm < 0) {
      throw ArgumentError.value(
        settings.kerfMm,
        'kerfMm',
        'must not be negative',
      );
    }
  }

  double _roundPercent(double value) => double.parse(value.toStringAsFixed(2));
}

class _PendingPiece {
  final CarpetPiece piece;
  final int copyIndex;

  const _PendingPiece({required this.piece, required this.copyIndex});

  int get maxWidth =>
      piece.canRotate ? _max(piece.widthMm, piece.heightMm) : piece.widthMm;

  int get maxHeight =>
      piece.canRotate ? _max(piece.widthMm, piece.heightMm) : piece.heightMm;

  int _max(int a, int b) => a > b ? a : b;
}

class _OrientedPiece {
  final int widthMm;
  final int heightMm;
  final bool rotated;

  const _OrientedPiece({
    required this.widthMm,
    required this.heightMm,
    required this.rotated,
  });
}

class _Shelf {
  final int yMm;
  final int heightMm;
  final int rollWidthMm;
  int usedWidth = 0;

  _Shelf({
    required this.yMm,
    required this.heightMm,
    required this.rollWidthMm,
  });

  int get remainingWidth => rollWidthMm - usedWidth;
}
