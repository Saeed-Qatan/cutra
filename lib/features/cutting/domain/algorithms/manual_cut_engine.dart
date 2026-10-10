import '../../data/models/cutting_models.dart';

class ManualCutEngine {
  const ManualCutEngine();

  ManualCutLayout splitSelected({
    required ManualCutLayout layout,
    required CutDirection direction,
    required int positionMm,
  }) {
    final selectedId = layout.selectedRegionId;
    if (selectedId == null) {
      throw StateError('No selected region');
    }

    final index = layout.regions.indexWhere(
      (region) => region.id == selectedId,
    );
    if (index < 0) {
      throw StateError('Selected region does not exist');
    }

    final selected = layout.regions[index];
    _validatePosition(selected, direction, positionMm);

    final first = selected.copyWith(
      id: '${selected.id}A',
      widthMm: direction == CutDirection.vertical
          ? positionMm
          : selected.widthMm,
      heightMm: direction == CutDirection.horizontal
          ? positionMm
          : selected.heightMm,
      label: '${selected.label}.1',
    );
    final second = selected.copyWith(
      id: '${selected.id}B',
      xMm: direction == CutDirection.vertical
          ? selected.xMm + positionMm
          : selected.xMm,
      yMm: direction == CutDirection.horizontal
          ? selected.yMm + positionMm
          : selected.yMm,
      widthMm: direction == CutDirection.vertical
          ? selected.widthMm - positionMm
          : selected.widthMm,
      heightMm: direction == CutDirection.horizontal
          ? selected.heightMm - positionMm
          : selected.heightMm,
      label: '${selected.label}.2',
    );

    final nextRegions = [...layout.regions]
      ..replaceRange(index, index + 1, [first, second]);
    return layout.copyWith(regions: nextRegions, selectedRegionId: second.id);
  }

  void _validatePosition(
    ManualCutRegion region,
    CutDirection direction,
    int positionMm,
  ) {
    final limit = direction == CutDirection.vertical
        ? region.widthMm
        : region.heightMm;
    if (positionMm <= 0 || positionMm >= limit) {
      throw ArgumentError.value(
        positionMm,
        'positionMm',
        'must be inside selected region bounds',
      );
    }
  }
}
