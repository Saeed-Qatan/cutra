import 'package:freezed_annotation/freezed_annotation.dart';

part 'cutting_models.freezed.dart';
part 'cutting_models.g.dart';

enum CutDirection {
  @JsonValue('vertical')
  vertical,
  @JsonValue('horizontal')
  horizontal,
}

@freezed
class CarpetRollStock with _$CarpetRollStock {
  const factory CarpetRollStock({
    required int rollWidthMm,
    int? availableLengthMm,
  }) = _CarpetRollStock;

  factory CarpetRollStock.fromJson(Map<String, dynamic> json) =>
      _$CarpetRollStockFromJson(json);
}

@freezed
class CarpetPiece with _$CarpetPiece {
  const factory CarpetPiece({
    required String id,
    required String label,
    required int widthMm,
    required int heightMm,
    @Default(1) int quantity,
    @Default(false) bool canRotate,
  }) = _CarpetPiece;

  factory CarpetPiece.fromJson(Map<String, dynamic> json) =>
      _$CarpetPieceFromJson(json);
}

@freezed
class CutSettings with _$CutSettings {
  const factory CutSettings({@Default(0) int kerfMm}) = _CutSettings;

  factory CutSettings.fromJson(Map<String, dynamic> json) =>
      _$CutSettingsFromJson(json);
}

@freezed
class PlacedCutPiece with _$PlacedCutPiece {
  const factory PlacedCutPiece({
    required String pieceId,
    required String label,
    required int copyIndex,
    required int xMm,
    required int yMm,
    required int widthMm,
    required int heightMm,
    @Default(false) bool rotated,
  }) = _PlacedCutPiece;

  factory PlacedCutPiece.fromJson(Map<String, dynamic> json) =>
      _$PlacedCutPieceFromJson(json);
}

@freezed
class UnplacedCutPiece with _$UnplacedCutPiece {
  const factory UnplacedCutPiece({
    required CarpetPiece piece,
    required int copyIndex,
    required String reason,
  }) = _UnplacedCutPiece;

  factory UnplacedCutPiece.fromJson(Map<String, dynamic> json) =>
      _$UnplacedCutPieceFromJson(json);
}

@freezed
class CuttingPlan with _$CuttingPlan {
  const factory CuttingPlan({
    required CarpetRollStock stock,
    required CutSettings settings,
    required List<PlacedCutPiece> placements,
    required List<UnplacedCutPiece> unplacedPieces,
    required int usedLengthMm,
    required int usedAreaMm,
    required int wasteAreaMm,
    required double utilizationPercent,
    required double wastePercent,
  }) = _CuttingPlan;

  factory CuttingPlan.fromJson(Map<String, dynamic> json) =>
      _$CuttingPlanFromJson(json);
}

@freezed
class ManualCutRegion with _$ManualCutRegion {
  const factory ManualCutRegion({
    required String id,
    required int xMm,
    required int yMm,
    required int widthMm,
    required int heightMm,
    @Default('متبقي') String label,
  }) = _ManualCutRegion;

  factory ManualCutRegion.fromJson(Map<String, dynamic> json) =>
      _$ManualCutRegionFromJson(json);
}

@freezed
class ManualCutLayout with _$ManualCutLayout {
  const factory ManualCutLayout({
    required CarpetRollStock stock,
    required List<ManualCutRegion> regions,
    String? selectedRegionId,
  }) = _ManualCutLayout;

  factory ManualCutLayout.initial(CarpetRollStock stock) {
    return ManualCutLayout(
      stock: stock,
      selectedRegionId: 'R1',
      regions: [
        ManualCutRegion(
          id: 'R1',
          xMm: 0,
          yMm: 0,
          widthMm: stock.rollWidthMm,
          heightMm: stock.availableLengthMm ?? stock.rollWidthMm,
          label: 'منطقة 1',
        ),
      ],
    );
  }

  factory ManualCutLayout.fromJson(Map<String, dynamic> json) =>
      _$ManualCutLayoutFromJson(json);
}
