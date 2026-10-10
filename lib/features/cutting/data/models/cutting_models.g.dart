// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cutting_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarpetRollStockImpl _$$CarpetRollStockImplFromJson(
  Map<String, dynamic> json,
) => _$CarpetRollStockImpl(
  rollWidthMm: (json['rollWidthMm'] as num).toInt(),
  availableLengthMm: (json['availableLengthMm'] as num?)?.toInt(),
);

Map<String, dynamic> _$$CarpetRollStockImplToJson(
  _$CarpetRollStockImpl instance,
) => <String, dynamic>{
  'rollWidthMm': instance.rollWidthMm,
  'availableLengthMm': instance.availableLengthMm,
};

_$CarpetPieceImpl _$$CarpetPieceImplFromJson(Map<String, dynamic> json) =>
    _$CarpetPieceImpl(
      id: json['id'] as String,
      label: json['label'] as String,
      widthMm: (json['widthMm'] as num).toInt(),
      heightMm: (json['heightMm'] as num).toInt(),
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
      canRotate: json['canRotate'] as bool? ?? false,
    );

Map<String, dynamic> _$$CarpetPieceImplToJson(_$CarpetPieceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'widthMm': instance.widthMm,
      'heightMm': instance.heightMm,
      'quantity': instance.quantity,
      'canRotate': instance.canRotate,
    };

_$CutSettingsImpl _$$CutSettingsImplFromJson(Map<String, dynamic> json) =>
    _$CutSettingsImpl(kerfMm: (json['kerfMm'] as num?)?.toInt() ?? 0);

Map<String, dynamic> _$$CutSettingsImplToJson(_$CutSettingsImpl instance) =>
    <String, dynamic>{'kerfMm': instance.kerfMm};

_$PlacedCutPieceImpl _$$PlacedCutPieceImplFromJson(Map<String, dynamic> json) =>
    _$PlacedCutPieceImpl(
      pieceId: json['pieceId'] as String,
      label: json['label'] as String,
      copyIndex: (json['copyIndex'] as num).toInt(),
      xMm: (json['xMm'] as num).toInt(),
      yMm: (json['yMm'] as num).toInt(),
      widthMm: (json['widthMm'] as num).toInt(),
      heightMm: (json['heightMm'] as num).toInt(),
      rotated: json['rotated'] as bool? ?? false,
    );

Map<String, dynamic> _$$PlacedCutPieceImplToJson(
  _$PlacedCutPieceImpl instance,
) => <String, dynamic>{
  'pieceId': instance.pieceId,
  'label': instance.label,
  'copyIndex': instance.copyIndex,
  'xMm': instance.xMm,
  'yMm': instance.yMm,
  'widthMm': instance.widthMm,
  'heightMm': instance.heightMm,
  'rotated': instance.rotated,
};

_$UnplacedCutPieceImpl _$$UnplacedCutPieceImplFromJson(
  Map<String, dynamic> json,
) => _$UnplacedCutPieceImpl(
  piece: CarpetPiece.fromJson(json['piece'] as Map<String, dynamic>),
  copyIndex: (json['copyIndex'] as num).toInt(),
  reason: json['reason'] as String,
);

Map<String, dynamic> _$$UnplacedCutPieceImplToJson(
  _$UnplacedCutPieceImpl instance,
) => <String, dynamic>{
  'piece': instance.piece,
  'copyIndex': instance.copyIndex,
  'reason': instance.reason,
};

_$CuttingPlanImpl _$$CuttingPlanImplFromJson(Map<String, dynamic> json) =>
    _$CuttingPlanImpl(
      stock: CarpetRollStock.fromJson(json['stock'] as Map<String, dynamic>),
      settings: CutSettings.fromJson(json['settings'] as Map<String, dynamic>),
      placements: (json['placements'] as List<dynamic>)
          .map((e) => PlacedCutPiece.fromJson(e as Map<String, dynamic>))
          .toList(),
      unplacedPieces: (json['unplacedPieces'] as List<dynamic>)
          .map((e) => UnplacedCutPiece.fromJson(e as Map<String, dynamic>))
          .toList(),
      usedLengthMm: (json['usedLengthMm'] as num).toInt(),
      usedAreaMm: (json['usedAreaMm'] as num).toInt(),
      wasteAreaMm: (json['wasteAreaMm'] as num).toInt(),
      utilizationPercent: (json['utilizationPercent'] as num).toDouble(),
      wastePercent: (json['wastePercent'] as num).toDouble(),
    );

Map<String, dynamic> _$$CuttingPlanImplToJson(_$CuttingPlanImpl instance) =>
    <String, dynamic>{
      'stock': instance.stock,
      'settings': instance.settings,
      'placements': instance.placements,
      'unplacedPieces': instance.unplacedPieces,
      'usedLengthMm': instance.usedLengthMm,
      'usedAreaMm': instance.usedAreaMm,
      'wasteAreaMm': instance.wasteAreaMm,
      'utilizationPercent': instance.utilizationPercent,
      'wastePercent': instance.wastePercent,
    };

_$ManualCutRegionImpl _$$ManualCutRegionImplFromJson(
  Map<String, dynamic> json,
) => _$ManualCutRegionImpl(
  id: json['id'] as String,
  xMm: (json['xMm'] as num).toInt(),
  yMm: (json['yMm'] as num).toInt(),
  widthMm: (json['widthMm'] as num).toInt(),
  heightMm: (json['heightMm'] as num).toInt(),
  label: json['label'] as String? ?? 'متبقي',
);

Map<String, dynamic> _$$ManualCutRegionImplToJson(
  _$ManualCutRegionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'xMm': instance.xMm,
  'yMm': instance.yMm,
  'widthMm': instance.widthMm,
  'heightMm': instance.heightMm,
  'label': instance.label,
};

_$ManualCutLayoutImpl _$$ManualCutLayoutImplFromJson(
  Map<String, dynamic> json,
) => _$ManualCutLayoutImpl(
  stock: CarpetRollStock.fromJson(json['stock'] as Map<String, dynamic>),
  regions: (json['regions'] as List<dynamic>)
      .map((e) => ManualCutRegion.fromJson(e as Map<String, dynamic>))
      .toList(),
  selectedRegionId: json['selectedRegionId'] as String?,
);

Map<String, dynamic> _$$ManualCutLayoutImplToJson(
  _$ManualCutLayoutImpl instance,
) => <String, dynamic>{
  'stock': instance.stock,
  'regions': instance.regions,
  'selectedRegionId': instance.selectedRegionId,
};
