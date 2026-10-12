// ──────────────────────────────────────────────────────────
// Enums
// ──────────────────────────────────────────────────────────

enum CutDirection {
  vertical,
  horizontal;

  String toJson() => name;

  static CutDirection fromJson(String value) {
    return CutDirection.values.firstWhere(
      (e) => e.name == value,
      orElse: () => CutDirection.vertical,
    );
  }
}

// ──────────────────────────────────────────────────────────
// CarpetRollStock
// ──────────────────────────────────────────────────────────

class CarpetRollStock {
  final int rollWidthMm;
  final int? availableLengthMm;

  const CarpetRollStock({
    required this.rollWidthMm,
    this.availableLengthMm,
  });

  factory CarpetRollStock.fromJson(Map<String, dynamic> json) {
    return CarpetRollStock(
      rollWidthMm: json['rollWidthMm'] as int,
      availableLengthMm: json['availableLengthMm'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'rollWidthMm': rollWidthMm,
        if (availableLengthMm != null) 'availableLengthMm': availableLengthMm,
      };

  CarpetRollStock copyWith({int? rollWidthMm, int? availableLengthMm}) {
    return CarpetRollStock(
      rollWidthMm: rollWidthMm ?? this.rollWidthMm,
      availableLengthMm: availableLengthMm ?? this.availableLengthMm,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarpetRollStock &&
          rollWidthMm == other.rollWidthMm &&
          availableLengthMm == other.availableLengthMm;

  @override
  int get hashCode => Object.hash(rollWidthMm, availableLengthMm);

  @override
  String toString() =>
      'CarpetRollStock(rollWidthMm: $rollWidthMm, availableLengthMm: $availableLengthMm)';
}

// ──────────────────────────────────────────────────────────
// CarpetPiece
// ──────────────────────────────────────────────────────────

class CarpetPiece {
  final String id;
  final String label;
  final int widthMm;
  final int heightMm;
  final int quantity;
  final bool canRotate;

  const CarpetPiece({
    required this.id,
    required this.label,
    required this.widthMm,
    required this.heightMm,
    this.quantity = 1,
    this.canRotate = false,
  });

  factory CarpetPiece.fromJson(Map<String, dynamic> json) {
    return CarpetPiece(
      id: json['id'] as String,
      label: json['label'] as String,
      widthMm: json['widthMm'] as int,
      heightMm: json['heightMm'] as int,
      quantity: (json['quantity'] as int?) ?? 1,
      canRotate: (json['canRotate'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'widthMm': widthMm,
        'heightMm': heightMm,
        'quantity': quantity,
        'canRotate': canRotate,
      };

  CarpetPiece copyWith({
    String? id,
    String? label,
    int? widthMm,
    int? heightMm,
    int? quantity,
    bool? canRotate,
  }) {
    return CarpetPiece(
      id: id ?? this.id,
      label: label ?? this.label,
      widthMm: widthMm ?? this.widthMm,
      heightMm: heightMm ?? this.heightMm,
      quantity: quantity ?? this.quantity,
      canRotate: canRotate ?? this.canRotate,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarpetPiece &&
          id == other.id &&
          label == other.label &&
          widthMm == other.widthMm &&
          heightMm == other.heightMm &&
          quantity == other.quantity &&
          canRotate == other.canRotate;

  @override
  int get hashCode => Object.hash(id, label, widthMm, heightMm, quantity, canRotate);

  @override
  String toString() =>
      'CarpetPiece(id: $id, label: $label, ${widthMm}x${heightMm}mm, qty: $quantity)';
}

// ──────────────────────────────────────────────────────────
// CutSettings
// ──────────────────────────────────────────────────────────

class CutSettings {
  final int kerfMm;

  const CutSettings({this.kerfMm = 0});

  factory CutSettings.fromJson(Map<String, dynamic> json) {
    return CutSettings(kerfMm: (json['kerfMm'] as int?) ?? 0);
  }

  Map<String, dynamic> toJson() => {'kerfMm': kerfMm};

  CutSettings copyWith({int? kerfMm}) {
    return CutSettings(kerfMm: kerfMm ?? this.kerfMm);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is CutSettings && kerfMm == other.kerfMm;

  @override
  int get hashCode => kerfMm.hashCode;

  @override
  String toString() => 'CutSettings(kerfMm: $kerfMm)';
}

// ──────────────────────────────────────────────────────────
// PlacedCutPiece
// ──────────────────────────────────────────────────────────

class PlacedCutPiece {
  final String pieceId;
  final String label;
  final int copyIndex;
  final int xMm;
  final int yMm;
  final int widthMm;
  final int heightMm;
  final bool rotated;

  const PlacedCutPiece({
    required this.pieceId,
    required this.label,
    required this.copyIndex,
    required this.xMm,
    required this.yMm,
    required this.widthMm,
    required this.heightMm,
    this.rotated = false,
  });

  factory PlacedCutPiece.fromJson(Map<String, dynamic> json) {
    return PlacedCutPiece(
      pieceId: json['pieceId'] as String,
      label: json['label'] as String,
      copyIndex: json['copyIndex'] as int,
      xMm: json['xMm'] as int,
      yMm: json['yMm'] as int,
      widthMm: json['widthMm'] as int,
      heightMm: json['heightMm'] as int,
      rotated: (json['rotated'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'pieceId': pieceId,
        'label': label,
        'copyIndex': copyIndex,
        'xMm': xMm,
        'yMm': yMm,
        'widthMm': widthMm,
        'heightMm': heightMm,
        'rotated': rotated,
      };

  PlacedCutPiece copyWith({
    String? pieceId,
    String? label,
    int? copyIndex,
    int? xMm,
    int? yMm,
    int? widthMm,
    int? heightMm,
    bool? rotated,
  }) {
    return PlacedCutPiece(
      pieceId: pieceId ?? this.pieceId,
      label: label ?? this.label,
      copyIndex: copyIndex ?? this.copyIndex,
      xMm: xMm ?? this.xMm,
      yMm: yMm ?? this.yMm,
      widthMm: widthMm ?? this.widthMm,
      heightMm: heightMm ?? this.heightMm,
      rotated: rotated ?? this.rotated,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlacedCutPiece &&
          pieceId == other.pieceId &&
          copyIndex == other.copyIndex &&
          xMm == other.xMm &&
          yMm == other.yMm;

  @override
  int get hashCode => Object.hash(pieceId, copyIndex, xMm, yMm);

  @override
  String toString() =>
      'PlacedCutPiece($label #$copyIndex at ($xMm,$yMm) ${widthMm}x${heightMm}mm)';
}

// ──────────────────────────────────────────────────────────
// UnplacedCutPiece
// ──────────────────────────────────────────────────────────

class UnplacedCutPiece {
  final CarpetPiece piece;
  final int copyIndex;
  final String reason;

  const UnplacedCutPiece({
    required this.piece,
    required this.copyIndex,
    required this.reason,
  });

  factory UnplacedCutPiece.fromJson(Map<String, dynamic> json) {
    return UnplacedCutPiece(
      piece: CarpetPiece.fromJson(json['piece'] as Map<String, dynamic>),
      copyIndex: json['copyIndex'] as int,
      reason: json['reason'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'piece': piece.toJson(),
        'copyIndex': copyIndex,
        'reason': reason,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnplacedCutPiece &&
          piece == other.piece &&
          copyIndex == other.copyIndex;

  @override
  int get hashCode => Object.hash(piece, copyIndex);

  @override
  String toString() => 'UnplacedCutPiece(${piece.label} #$copyIndex: $reason)';
}

// ──────────────────────────────────────────────────────────
// CuttingPlan
// ──────────────────────────────────────────────────────────

class CuttingPlan {
  final CarpetRollStock stock;
  final CutSettings settings;
  final List<PlacedCutPiece> placements;
  final List<UnplacedCutPiece> unplacedPieces;
  final int usedLengthMm;
  final int usedAreaMm;
  final int wasteAreaMm;
  final double utilizationPercent;
  final double wastePercent;

  const CuttingPlan({
    required this.stock,
    required this.settings,
    required this.placements,
    required this.unplacedPieces,
    required this.usedLengthMm,
    required this.usedAreaMm,
    required this.wasteAreaMm,
    required this.utilizationPercent,
    required this.wastePercent,
  });

  factory CuttingPlan.fromJson(Map<String, dynamic> json) {
    return CuttingPlan(
      stock: CarpetRollStock.fromJson(json['stock'] as Map<String, dynamic>),
      settings: CutSettings.fromJson(json['settings'] as Map<String, dynamic>),
      placements: (json['placements'] as List<dynamic>)
          .map((e) => PlacedCutPiece.fromJson(e as Map<String, dynamic>))
          .toList(),
      unplacedPieces: (json['unplacedPieces'] as List<dynamic>)
          .map((e) => UnplacedCutPiece.fromJson(e as Map<String, dynamic>))
          .toList(),
      usedLengthMm: json['usedLengthMm'] as int,
      usedAreaMm: json['usedAreaMm'] as int,
      wasteAreaMm: json['wasteAreaMm'] as int,
      utilizationPercent: (json['utilizationPercent'] as num).toDouble(),
      wastePercent: (json['wastePercent'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'stock': stock.toJson(),
        'settings': settings.toJson(),
        'placements': placements.map((e) => e.toJson()).toList(),
        'unplacedPieces': unplacedPieces.map((e) => e.toJson()).toList(),
        'usedLengthMm': usedLengthMm,
        'usedAreaMm': usedAreaMm,
        'wasteAreaMm': wasteAreaMm,
        'utilizationPercent': utilizationPercent,
        'wastePercent': wastePercent,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CuttingPlan &&
          stock == other.stock &&
          usedLengthMm == other.usedLengthMm;

  @override
  int get hashCode => Object.hash(stock, usedLengthMm);

  @override
  String toString() =>
      'CuttingPlan(${placements.length} placed, util: $utilizationPercent%)';
}

// ──────────────────────────────────────────────────────────
// ManualCutRegion
// ──────────────────────────────────────────────────────────

class ManualCutRegion {
  final String id;
  final int xMm;
  final int yMm;
  final int widthMm;
  final int heightMm;
  final String label;

  const ManualCutRegion({
    required this.id,
    required this.xMm,
    required this.yMm,
    required this.widthMm,
    required this.heightMm,
    this.label = 'متبقي',
  });

  factory ManualCutRegion.fromJson(Map<String, dynamic> json) {
    return ManualCutRegion(
      id: json['id'] as String,
      xMm: json['xMm'] as int,
      yMm: json['yMm'] as int,
      widthMm: json['widthMm'] as int,
      heightMm: json['heightMm'] as int,
      label: (json['label'] as String?) ?? 'متبقي',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'xMm': xMm,
        'yMm': yMm,
        'widthMm': widthMm,
        'heightMm': heightMm,
        'label': label,
      };

  ManualCutRegion copyWith({
    String? id,
    int? xMm,
    int? yMm,
    int? widthMm,
    int? heightMm,
    String? label,
  }) {
    return ManualCutRegion(
      id: id ?? this.id,
      xMm: xMm ?? this.xMm,
      yMm: yMm ?? this.yMm,
      widthMm: widthMm ?? this.widthMm,
      heightMm: heightMm ?? this.heightMm,
      label: label ?? this.label,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManualCutRegion && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'ManualCutRegion($id: $label at ($xMm,$yMm) ${widthMm}x${heightMm}mm)';
}

// ──────────────────────────────────────────────────────────
// ManualCutLayout
// ──────────────────────────────────────────────────────────

class ManualCutLayout {
  final CarpetRollStock stock;
  final List<ManualCutRegion> regions;
  final String? selectedRegionId;

  const ManualCutLayout({
    required this.stock,
    required this.regions,
    this.selectedRegionId,
  });

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

  factory ManualCutLayout.fromJson(Map<String, dynamic> json) {
    return ManualCutLayout(
      stock: CarpetRollStock.fromJson(json['stock'] as Map<String, dynamic>),
      regions: (json['regions'] as List<dynamic>)
          .map((e) => ManualCutRegion.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedRegionId: json['selectedRegionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'stock': stock.toJson(),
        'regions': regions.map((e) => e.toJson()).toList(),
        if (selectedRegionId != null) 'selectedRegionId': selectedRegionId,
      };

  ManualCutLayout copyWith({
    CarpetRollStock? stock,
    List<ManualCutRegion>? regions,
    String? selectedRegionId,
    bool clearSelectedRegionId = false,
  }) {
    return ManualCutLayout(
      stock: stock ?? this.stock,
      regions: regions ?? this.regions,
      selectedRegionId:
          clearSelectedRegionId ? null : selectedRegionId ?? this.selectedRegionId,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManualCutLayout &&
          stock == other.stock &&
          selectedRegionId == other.selectedRegionId;

  @override
  int get hashCode => Object.hash(stock, selectedRegionId);

  @override
  String toString() =>
      'ManualCutLayout(${regions.length} regions, selected: $selectedRegionId)';
}
