// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cutting_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CarpetRollStock _$CarpetRollStockFromJson(Map<String, dynamic> json) {
  return _CarpetRollStock.fromJson(json);
}

/// @nodoc
mixin _$CarpetRollStock {
  int get rollWidthMm => throw _privateConstructorUsedError;
  int? get availableLengthMm => throw _privateConstructorUsedError;

  /// Serializes this CarpetRollStock to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarpetRollStock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarpetRollStockCopyWith<CarpetRollStock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarpetRollStockCopyWith<$Res> {
  factory $CarpetRollStockCopyWith(
    CarpetRollStock value,
    $Res Function(CarpetRollStock) then,
  ) = _$CarpetRollStockCopyWithImpl<$Res, CarpetRollStock>;
  @useResult
  $Res call({int rollWidthMm, int? availableLengthMm});
}

/// @nodoc
class _$CarpetRollStockCopyWithImpl<$Res, $Val extends CarpetRollStock>
    implements $CarpetRollStockCopyWith<$Res> {
  _$CarpetRollStockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarpetRollStock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rollWidthMm = null, Object? availableLengthMm = freezed}) {
    return _then(
      _value.copyWith(
            rollWidthMm: null == rollWidthMm
                ? _value.rollWidthMm
                : rollWidthMm // ignore: cast_nullable_to_non_nullable
                      as int,
            availableLengthMm: freezed == availableLengthMm
                ? _value.availableLengthMm
                : availableLengthMm // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CarpetRollStockImplCopyWith<$Res>
    implements $CarpetRollStockCopyWith<$Res> {
  factory _$$CarpetRollStockImplCopyWith(
    _$CarpetRollStockImpl value,
    $Res Function(_$CarpetRollStockImpl) then,
  ) = __$$CarpetRollStockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int rollWidthMm, int? availableLengthMm});
}

/// @nodoc
class __$$CarpetRollStockImplCopyWithImpl<$Res>
    extends _$CarpetRollStockCopyWithImpl<$Res, _$CarpetRollStockImpl>
    implements _$$CarpetRollStockImplCopyWith<$Res> {
  __$$CarpetRollStockImplCopyWithImpl(
    _$CarpetRollStockImpl _value,
    $Res Function(_$CarpetRollStockImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CarpetRollStock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rollWidthMm = null, Object? availableLengthMm = freezed}) {
    return _then(
      _$CarpetRollStockImpl(
        rollWidthMm: null == rollWidthMm
            ? _value.rollWidthMm
            : rollWidthMm // ignore: cast_nullable_to_non_nullable
                  as int,
        availableLengthMm: freezed == availableLengthMm
            ? _value.availableLengthMm
            : availableLengthMm // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CarpetRollStockImpl implements _CarpetRollStock {
  const _$CarpetRollStockImpl({
    required this.rollWidthMm,
    this.availableLengthMm,
  });

  factory _$CarpetRollStockImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarpetRollStockImplFromJson(json);

  @override
  final int rollWidthMm;
  @override
  final int? availableLengthMm;

  @override
  String toString() {
    return 'CarpetRollStock(rollWidthMm: $rollWidthMm, availableLengthMm: $availableLengthMm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarpetRollStockImpl &&
            (identical(other.rollWidthMm, rollWidthMm) ||
                other.rollWidthMm == rollWidthMm) &&
            (identical(other.availableLengthMm, availableLengthMm) ||
                other.availableLengthMm == availableLengthMm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rollWidthMm, availableLengthMm);

  /// Create a copy of CarpetRollStock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarpetRollStockImplCopyWith<_$CarpetRollStockImpl> get copyWith =>
      __$$CarpetRollStockImplCopyWithImpl<_$CarpetRollStockImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CarpetRollStockImplToJson(this);
  }
}

abstract class _CarpetRollStock implements CarpetRollStock {
  const factory _CarpetRollStock({
    required final int rollWidthMm,
    final int? availableLengthMm,
  }) = _$CarpetRollStockImpl;

  factory _CarpetRollStock.fromJson(Map<String, dynamic> json) =
      _$CarpetRollStockImpl.fromJson;

  @override
  int get rollWidthMm;
  @override
  int? get availableLengthMm;

  /// Create a copy of CarpetRollStock
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarpetRollStockImplCopyWith<_$CarpetRollStockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CarpetPiece _$CarpetPieceFromJson(Map<String, dynamic> json) {
  return _CarpetPiece.fromJson(json);
}

/// @nodoc
mixin _$CarpetPiece {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  int get widthMm => throw _privateConstructorUsedError;
  int get heightMm => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  bool get canRotate => throw _privateConstructorUsedError;

  /// Serializes this CarpetPiece to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarpetPiece
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarpetPieceCopyWith<CarpetPiece> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarpetPieceCopyWith<$Res> {
  factory $CarpetPieceCopyWith(
    CarpetPiece value,
    $Res Function(CarpetPiece) then,
  ) = _$CarpetPieceCopyWithImpl<$Res, CarpetPiece>;
  @useResult
  $Res call({
    String id,
    String label,
    int widthMm,
    int heightMm,
    int quantity,
    bool canRotate,
  });
}

/// @nodoc
class _$CarpetPieceCopyWithImpl<$Res, $Val extends CarpetPiece>
    implements $CarpetPieceCopyWith<$Res> {
  _$CarpetPieceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarpetPiece
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? widthMm = null,
    Object? heightMm = null,
    Object? quantity = null,
    Object? canRotate = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            widthMm: null == widthMm
                ? _value.widthMm
                : widthMm // ignore: cast_nullable_to_non_nullable
                      as int,
            heightMm: null == heightMm
                ? _value.heightMm
                : heightMm // ignore: cast_nullable_to_non_nullable
                      as int,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            canRotate: null == canRotate
                ? _value.canRotate
                : canRotate // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CarpetPieceImplCopyWith<$Res>
    implements $CarpetPieceCopyWith<$Res> {
  factory _$$CarpetPieceImplCopyWith(
    _$CarpetPieceImpl value,
    $Res Function(_$CarpetPieceImpl) then,
  ) = __$$CarpetPieceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String label,
    int widthMm,
    int heightMm,
    int quantity,
    bool canRotate,
  });
}

/// @nodoc
class __$$CarpetPieceImplCopyWithImpl<$Res>
    extends _$CarpetPieceCopyWithImpl<$Res, _$CarpetPieceImpl>
    implements _$$CarpetPieceImplCopyWith<$Res> {
  __$$CarpetPieceImplCopyWithImpl(
    _$CarpetPieceImpl _value,
    $Res Function(_$CarpetPieceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CarpetPiece
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? widthMm = null,
    Object? heightMm = null,
    Object? quantity = null,
    Object? canRotate = null,
  }) {
    return _then(
      _$CarpetPieceImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        widthMm: null == widthMm
            ? _value.widthMm
            : widthMm // ignore: cast_nullable_to_non_nullable
                  as int,
        heightMm: null == heightMm
            ? _value.heightMm
            : heightMm // ignore: cast_nullable_to_non_nullable
                  as int,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        canRotate: null == canRotate
            ? _value.canRotate
            : canRotate // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CarpetPieceImpl implements _CarpetPiece {
  const _$CarpetPieceImpl({
    required this.id,
    required this.label,
    required this.widthMm,
    required this.heightMm,
    this.quantity = 1,
    this.canRotate = false,
  });

  factory _$CarpetPieceImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarpetPieceImplFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  final int widthMm;
  @override
  final int heightMm;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final bool canRotate;

  @override
  String toString() {
    return 'CarpetPiece(id: $id, label: $label, widthMm: $widthMm, heightMm: $heightMm, quantity: $quantity, canRotate: $canRotate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarpetPieceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.widthMm, widthMm) || other.widthMm == widthMm) &&
            (identical(other.heightMm, heightMm) ||
                other.heightMm == heightMm) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.canRotate, canRotate) ||
                other.canRotate == canRotate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    label,
    widthMm,
    heightMm,
    quantity,
    canRotate,
  );

  /// Create a copy of CarpetPiece
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarpetPieceImplCopyWith<_$CarpetPieceImpl> get copyWith =>
      __$$CarpetPieceImplCopyWithImpl<_$CarpetPieceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarpetPieceImplToJson(this);
  }
}

abstract class _CarpetPiece implements CarpetPiece {
  const factory _CarpetPiece({
    required final String id,
    required final String label,
    required final int widthMm,
    required final int heightMm,
    final int quantity,
    final bool canRotate,
  }) = _$CarpetPieceImpl;

  factory _CarpetPiece.fromJson(Map<String, dynamic> json) =
      _$CarpetPieceImpl.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  int get widthMm;
  @override
  int get heightMm;
  @override
  int get quantity;
  @override
  bool get canRotate;

  /// Create a copy of CarpetPiece
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarpetPieceImplCopyWith<_$CarpetPieceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CutSettings _$CutSettingsFromJson(Map<String, dynamic> json) {
  return _CutSettings.fromJson(json);
}

/// @nodoc
mixin _$CutSettings {
  int get kerfMm => throw _privateConstructorUsedError;

  /// Serializes this CutSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CutSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CutSettingsCopyWith<CutSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CutSettingsCopyWith<$Res> {
  factory $CutSettingsCopyWith(
    CutSettings value,
    $Res Function(CutSettings) then,
  ) = _$CutSettingsCopyWithImpl<$Res, CutSettings>;
  @useResult
  $Res call({int kerfMm});
}

/// @nodoc
class _$CutSettingsCopyWithImpl<$Res, $Val extends CutSettings>
    implements $CutSettingsCopyWith<$Res> {
  _$CutSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CutSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? kerfMm = null}) {
    return _then(
      _value.copyWith(
            kerfMm: null == kerfMm
                ? _value.kerfMm
                : kerfMm // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CutSettingsImplCopyWith<$Res>
    implements $CutSettingsCopyWith<$Res> {
  factory _$$CutSettingsImplCopyWith(
    _$CutSettingsImpl value,
    $Res Function(_$CutSettingsImpl) then,
  ) = __$$CutSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int kerfMm});
}

/// @nodoc
class __$$CutSettingsImplCopyWithImpl<$Res>
    extends _$CutSettingsCopyWithImpl<$Res, _$CutSettingsImpl>
    implements _$$CutSettingsImplCopyWith<$Res> {
  __$$CutSettingsImplCopyWithImpl(
    _$CutSettingsImpl _value,
    $Res Function(_$CutSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CutSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? kerfMm = null}) {
    return _then(
      _$CutSettingsImpl(
        kerfMm: null == kerfMm
            ? _value.kerfMm
            : kerfMm // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CutSettingsImpl implements _CutSettings {
  const _$CutSettingsImpl({this.kerfMm = 0});

  factory _$CutSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CutSettingsImplFromJson(json);

  @override
  @JsonKey()
  final int kerfMm;

  @override
  String toString() {
    return 'CutSettings(kerfMm: $kerfMm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CutSettingsImpl &&
            (identical(other.kerfMm, kerfMm) || other.kerfMm == kerfMm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, kerfMm);

  /// Create a copy of CutSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CutSettingsImplCopyWith<_$CutSettingsImpl> get copyWith =>
      __$$CutSettingsImplCopyWithImpl<_$CutSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CutSettingsImplToJson(this);
  }
}

abstract class _CutSettings implements CutSettings {
  const factory _CutSettings({final int kerfMm}) = _$CutSettingsImpl;

  factory _CutSettings.fromJson(Map<String, dynamic> json) =
      _$CutSettingsImpl.fromJson;

  @override
  int get kerfMm;

  /// Create a copy of CutSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CutSettingsImplCopyWith<_$CutSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlacedCutPiece _$PlacedCutPieceFromJson(Map<String, dynamic> json) {
  return _PlacedCutPiece.fromJson(json);
}

/// @nodoc
mixin _$PlacedCutPiece {
  String get pieceId => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  int get copyIndex => throw _privateConstructorUsedError;
  int get xMm => throw _privateConstructorUsedError;
  int get yMm => throw _privateConstructorUsedError;
  int get widthMm => throw _privateConstructorUsedError;
  int get heightMm => throw _privateConstructorUsedError;
  bool get rotated => throw _privateConstructorUsedError;

  /// Serializes this PlacedCutPiece to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlacedCutPiece
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlacedCutPieceCopyWith<PlacedCutPiece> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacedCutPieceCopyWith<$Res> {
  factory $PlacedCutPieceCopyWith(
    PlacedCutPiece value,
    $Res Function(PlacedCutPiece) then,
  ) = _$PlacedCutPieceCopyWithImpl<$Res, PlacedCutPiece>;
  @useResult
  $Res call({
    String pieceId,
    String label,
    int copyIndex,
    int xMm,
    int yMm,
    int widthMm,
    int heightMm,
    bool rotated,
  });
}

/// @nodoc
class _$PlacedCutPieceCopyWithImpl<$Res, $Val extends PlacedCutPiece>
    implements $PlacedCutPieceCopyWith<$Res> {
  _$PlacedCutPieceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlacedCutPiece
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pieceId = null,
    Object? label = null,
    Object? copyIndex = null,
    Object? xMm = null,
    Object? yMm = null,
    Object? widthMm = null,
    Object? heightMm = null,
    Object? rotated = null,
  }) {
    return _then(
      _value.copyWith(
            pieceId: null == pieceId
                ? _value.pieceId
                : pieceId // ignore: cast_nullable_to_non_nullable
                      as String,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            copyIndex: null == copyIndex
                ? _value.copyIndex
                : copyIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            xMm: null == xMm
                ? _value.xMm
                : xMm // ignore: cast_nullable_to_non_nullable
                      as int,
            yMm: null == yMm
                ? _value.yMm
                : yMm // ignore: cast_nullable_to_non_nullable
                      as int,
            widthMm: null == widthMm
                ? _value.widthMm
                : widthMm // ignore: cast_nullable_to_non_nullable
                      as int,
            heightMm: null == heightMm
                ? _value.heightMm
                : heightMm // ignore: cast_nullable_to_non_nullable
                      as int,
            rotated: null == rotated
                ? _value.rotated
                : rotated // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlacedCutPieceImplCopyWith<$Res>
    implements $PlacedCutPieceCopyWith<$Res> {
  factory _$$PlacedCutPieceImplCopyWith(
    _$PlacedCutPieceImpl value,
    $Res Function(_$PlacedCutPieceImpl) then,
  ) = __$$PlacedCutPieceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String pieceId,
    String label,
    int copyIndex,
    int xMm,
    int yMm,
    int widthMm,
    int heightMm,
    bool rotated,
  });
}

/// @nodoc
class __$$PlacedCutPieceImplCopyWithImpl<$Res>
    extends _$PlacedCutPieceCopyWithImpl<$Res, _$PlacedCutPieceImpl>
    implements _$$PlacedCutPieceImplCopyWith<$Res> {
  __$$PlacedCutPieceImplCopyWithImpl(
    _$PlacedCutPieceImpl _value,
    $Res Function(_$PlacedCutPieceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlacedCutPiece
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pieceId = null,
    Object? label = null,
    Object? copyIndex = null,
    Object? xMm = null,
    Object? yMm = null,
    Object? widthMm = null,
    Object? heightMm = null,
    Object? rotated = null,
  }) {
    return _then(
      _$PlacedCutPieceImpl(
        pieceId: null == pieceId
            ? _value.pieceId
            : pieceId // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        copyIndex: null == copyIndex
            ? _value.copyIndex
            : copyIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        xMm: null == xMm
            ? _value.xMm
            : xMm // ignore: cast_nullable_to_non_nullable
                  as int,
        yMm: null == yMm
            ? _value.yMm
            : yMm // ignore: cast_nullable_to_non_nullable
                  as int,
        widthMm: null == widthMm
            ? _value.widthMm
            : widthMm // ignore: cast_nullable_to_non_nullable
                  as int,
        heightMm: null == heightMm
            ? _value.heightMm
            : heightMm // ignore: cast_nullable_to_non_nullable
                  as int,
        rotated: null == rotated
            ? _value.rotated
            : rotated // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlacedCutPieceImpl implements _PlacedCutPiece {
  const _$PlacedCutPieceImpl({
    required this.pieceId,
    required this.label,
    required this.copyIndex,
    required this.xMm,
    required this.yMm,
    required this.widthMm,
    required this.heightMm,
    this.rotated = false,
  });

  factory _$PlacedCutPieceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlacedCutPieceImplFromJson(json);

  @override
  final String pieceId;
  @override
  final String label;
  @override
  final int copyIndex;
  @override
  final int xMm;
  @override
  final int yMm;
  @override
  final int widthMm;
  @override
  final int heightMm;
  @override
  @JsonKey()
  final bool rotated;

  @override
  String toString() {
    return 'PlacedCutPiece(pieceId: $pieceId, label: $label, copyIndex: $copyIndex, xMm: $xMm, yMm: $yMm, widthMm: $widthMm, heightMm: $heightMm, rotated: $rotated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlacedCutPieceImpl &&
            (identical(other.pieceId, pieceId) || other.pieceId == pieceId) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.copyIndex, copyIndex) ||
                other.copyIndex == copyIndex) &&
            (identical(other.xMm, xMm) || other.xMm == xMm) &&
            (identical(other.yMm, yMm) || other.yMm == yMm) &&
            (identical(other.widthMm, widthMm) || other.widthMm == widthMm) &&
            (identical(other.heightMm, heightMm) ||
                other.heightMm == heightMm) &&
            (identical(other.rotated, rotated) || other.rotated == rotated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    pieceId,
    label,
    copyIndex,
    xMm,
    yMm,
    widthMm,
    heightMm,
    rotated,
  );

  /// Create a copy of PlacedCutPiece
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlacedCutPieceImplCopyWith<_$PlacedCutPieceImpl> get copyWith =>
      __$$PlacedCutPieceImplCopyWithImpl<_$PlacedCutPieceImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PlacedCutPieceImplToJson(this);
  }
}

abstract class _PlacedCutPiece implements PlacedCutPiece {
  const factory _PlacedCutPiece({
    required final String pieceId,
    required final String label,
    required final int copyIndex,
    required final int xMm,
    required final int yMm,
    required final int widthMm,
    required final int heightMm,
    final bool rotated,
  }) = _$PlacedCutPieceImpl;

  factory _PlacedCutPiece.fromJson(Map<String, dynamic> json) =
      _$PlacedCutPieceImpl.fromJson;

  @override
  String get pieceId;
  @override
  String get label;
  @override
  int get copyIndex;
  @override
  int get xMm;
  @override
  int get yMm;
  @override
  int get widthMm;
  @override
  int get heightMm;
  @override
  bool get rotated;

  /// Create a copy of PlacedCutPiece
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlacedCutPieceImplCopyWith<_$PlacedCutPieceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UnplacedCutPiece _$UnplacedCutPieceFromJson(Map<String, dynamic> json) {
  return _UnplacedCutPiece.fromJson(json);
}

/// @nodoc
mixin _$UnplacedCutPiece {
  CarpetPiece get piece => throw _privateConstructorUsedError;
  int get copyIndex => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;

  /// Serializes this UnplacedCutPiece to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UnplacedCutPiece
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnplacedCutPieceCopyWith<UnplacedCutPiece> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnplacedCutPieceCopyWith<$Res> {
  factory $UnplacedCutPieceCopyWith(
    UnplacedCutPiece value,
    $Res Function(UnplacedCutPiece) then,
  ) = _$UnplacedCutPieceCopyWithImpl<$Res, UnplacedCutPiece>;
  @useResult
  $Res call({CarpetPiece piece, int copyIndex, String reason});

  $CarpetPieceCopyWith<$Res> get piece;
}

/// @nodoc
class _$UnplacedCutPieceCopyWithImpl<$Res, $Val extends UnplacedCutPiece>
    implements $UnplacedCutPieceCopyWith<$Res> {
  _$UnplacedCutPieceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnplacedCutPiece
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? piece = null,
    Object? copyIndex = null,
    Object? reason = null,
  }) {
    return _then(
      _value.copyWith(
            piece: null == piece
                ? _value.piece
                : piece // ignore: cast_nullable_to_non_nullable
                      as CarpetPiece,
            copyIndex: null == copyIndex
                ? _value.copyIndex
                : copyIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            reason: null == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of UnplacedCutPiece
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CarpetPieceCopyWith<$Res> get piece {
    return $CarpetPieceCopyWith<$Res>(_value.piece, (value) {
      return _then(_value.copyWith(piece: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UnplacedCutPieceImplCopyWith<$Res>
    implements $UnplacedCutPieceCopyWith<$Res> {
  factory _$$UnplacedCutPieceImplCopyWith(
    _$UnplacedCutPieceImpl value,
    $Res Function(_$UnplacedCutPieceImpl) then,
  ) = __$$UnplacedCutPieceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CarpetPiece piece, int copyIndex, String reason});

  @override
  $CarpetPieceCopyWith<$Res> get piece;
}

/// @nodoc
class __$$UnplacedCutPieceImplCopyWithImpl<$Res>
    extends _$UnplacedCutPieceCopyWithImpl<$Res, _$UnplacedCutPieceImpl>
    implements _$$UnplacedCutPieceImplCopyWith<$Res> {
  __$$UnplacedCutPieceImplCopyWithImpl(
    _$UnplacedCutPieceImpl _value,
    $Res Function(_$UnplacedCutPieceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UnplacedCutPiece
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? piece = null,
    Object? copyIndex = null,
    Object? reason = null,
  }) {
    return _then(
      _$UnplacedCutPieceImpl(
        piece: null == piece
            ? _value.piece
            : piece // ignore: cast_nullable_to_non_nullable
                  as CarpetPiece,
        copyIndex: null == copyIndex
            ? _value.copyIndex
            : copyIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        reason: null == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UnplacedCutPieceImpl implements _UnplacedCutPiece {
  const _$UnplacedCutPieceImpl({
    required this.piece,
    required this.copyIndex,
    required this.reason,
  });

  factory _$UnplacedCutPieceImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnplacedCutPieceImplFromJson(json);

  @override
  final CarpetPiece piece;
  @override
  final int copyIndex;
  @override
  final String reason;

  @override
  String toString() {
    return 'UnplacedCutPiece(piece: $piece, copyIndex: $copyIndex, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnplacedCutPieceImpl &&
            (identical(other.piece, piece) || other.piece == piece) &&
            (identical(other.copyIndex, copyIndex) ||
                other.copyIndex == copyIndex) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, piece, copyIndex, reason);

  /// Create a copy of UnplacedCutPiece
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnplacedCutPieceImplCopyWith<_$UnplacedCutPieceImpl> get copyWith =>
      __$$UnplacedCutPieceImplCopyWithImpl<_$UnplacedCutPieceImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UnplacedCutPieceImplToJson(this);
  }
}

abstract class _UnplacedCutPiece implements UnplacedCutPiece {
  const factory _UnplacedCutPiece({
    required final CarpetPiece piece,
    required final int copyIndex,
    required final String reason,
  }) = _$UnplacedCutPieceImpl;

  factory _UnplacedCutPiece.fromJson(Map<String, dynamic> json) =
      _$UnplacedCutPieceImpl.fromJson;

  @override
  CarpetPiece get piece;
  @override
  int get copyIndex;
  @override
  String get reason;

  /// Create a copy of UnplacedCutPiece
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnplacedCutPieceImplCopyWith<_$UnplacedCutPieceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CuttingPlan _$CuttingPlanFromJson(Map<String, dynamic> json) {
  return _CuttingPlan.fromJson(json);
}

/// @nodoc
mixin _$CuttingPlan {
  CarpetRollStock get stock => throw _privateConstructorUsedError;
  CutSettings get settings => throw _privateConstructorUsedError;
  List<PlacedCutPiece> get placements => throw _privateConstructorUsedError;
  List<UnplacedCutPiece> get unplacedPieces =>
      throw _privateConstructorUsedError;
  int get usedLengthMm => throw _privateConstructorUsedError;
  int get usedAreaMm => throw _privateConstructorUsedError;
  int get wasteAreaMm => throw _privateConstructorUsedError;
  double get utilizationPercent => throw _privateConstructorUsedError;
  double get wastePercent => throw _privateConstructorUsedError;

  /// Serializes this CuttingPlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CuttingPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CuttingPlanCopyWith<CuttingPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CuttingPlanCopyWith<$Res> {
  factory $CuttingPlanCopyWith(
    CuttingPlan value,
    $Res Function(CuttingPlan) then,
  ) = _$CuttingPlanCopyWithImpl<$Res, CuttingPlan>;
  @useResult
  $Res call({
    CarpetRollStock stock,
    CutSettings settings,
    List<PlacedCutPiece> placements,
    List<UnplacedCutPiece> unplacedPieces,
    int usedLengthMm,
    int usedAreaMm,
    int wasteAreaMm,
    double utilizationPercent,
    double wastePercent,
  });

  $CarpetRollStockCopyWith<$Res> get stock;
  $CutSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$CuttingPlanCopyWithImpl<$Res, $Val extends CuttingPlan>
    implements $CuttingPlanCopyWith<$Res> {
  _$CuttingPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CuttingPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stock = null,
    Object? settings = null,
    Object? placements = null,
    Object? unplacedPieces = null,
    Object? usedLengthMm = null,
    Object? usedAreaMm = null,
    Object? wasteAreaMm = null,
    Object? utilizationPercent = null,
    Object? wastePercent = null,
  }) {
    return _then(
      _value.copyWith(
            stock: null == stock
                ? _value.stock
                : stock // ignore: cast_nullable_to_non_nullable
                      as CarpetRollStock,
            settings: null == settings
                ? _value.settings
                : settings // ignore: cast_nullable_to_non_nullable
                      as CutSettings,
            placements: null == placements
                ? _value.placements
                : placements // ignore: cast_nullable_to_non_nullable
                      as List<PlacedCutPiece>,
            unplacedPieces: null == unplacedPieces
                ? _value.unplacedPieces
                : unplacedPieces // ignore: cast_nullable_to_non_nullable
                      as List<UnplacedCutPiece>,
            usedLengthMm: null == usedLengthMm
                ? _value.usedLengthMm
                : usedLengthMm // ignore: cast_nullable_to_non_nullable
                      as int,
            usedAreaMm: null == usedAreaMm
                ? _value.usedAreaMm
                : usedAreaMm // ignore: cast_nullable_to_non_nullable
                      as int,
            wasteAreaMm: null == wasteAreaMm
                ? _value.wasteAreaMm
                : wasteAreaMm // ignore: cast_nullable_to_non_nullable
                      as int,
            utilizationPercent: null == utilizationPercent
                ? _value.utilizationPercent
                : utilizationPercent // ignore: cast_nullable_to_non_nullable
                      as double,
            wastePercent: null == wastePercent
                ? _value.wastePercent
                : wastePercent // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }

  /// Create a copy of CuttingPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CarpetRollStockCopyWith<$Res> get stock {
    return $CarpetRollStockCopyWith<$Res>(_value.stock, (value) {
      return _then(_value.copyWith(stock: value) as $Val);
    });
  }

  /// Create a copy of CuttingPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CutSettingsCopyWith<$Res> get settings {
    return $CutSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CuttingPlanImplCopyWith<$Res>
    implements $CuttingPlanCopyWith<$Res> {
  factory _$$CuttingPlanImplCopyWith(
    _$CuttingPlanImpl value,
    $Res Function(_$CuttingPlanImpl) then,
  ) = __$$CuttingPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CarpetRollStock stock,
    CutSettings settings,
    List<PlacedCutPiece> placements,
    List<UnplacedCutPiece> unplacedPieces,
    int usedLengthMm,
    int usedAreaMm,
    int wasteAreaMm,
    double utilizationPercent,
    double wastePercent,
  });

  @override
  $CarpetRollStockCopyWith<$Res> get stock;
  @override
  $CutSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$CuttingPlanImplCopyWithImpl<$Res>
    extends _$CuttingPlanCopyWithImpl<$Res, _$CuttingPlanImpl>
    implements _$$CuttingPlanImplCopyWith<$Res> {
  __$$CuttingPlanImplCopyWithImpl(
    _$CuttingPlanImpl _value,
    $Res Function(_$CuttingPlanImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CuttingPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stock = null,
    Object? settings = null,
    Object? placements = null,
    Object? unplacedPieces = null,
    Object? usedLengthMm = null,
    Object? usedAreaMm = null,
    Object? wasteAreaMm = null,
    Object? utilizationPercent = null,
    Object? wastePercent = null,
  }) {
    return _then(
      _$CuttingPlanImpl(
        stock: null == stock
            ? _value.stock
            : stock // ignore: cast_nullable_to_non_nullable
                  as CarpetRollStock,
        settings: null == settings
            ? _value.settings
            : settings // ignore: cast_nullable_to_non_nullable
                  as CutSettings,
        placements: null == placements
            ? _value._placements
            : placements // ignore: cast_nullable_to_non_nullable
                  as List<PlacedCutPiece>,
        unplacedPieces: null == unplacedPieces
            ? _value._unplacedPieces
            : unplacedPieces // ignore: cast_nullable_to_non_nullable
                  as List<UnplacedCutPiece>,
        usedLengthMm: null == usedLengthMm
            ? _value.usedLengthMm
            : usedLengthMm // ignore: cast_nullable_to_non_nullable
                  as int,
        usedAreaMm: null == usedAreaMm
            ? _value.usedAreaMm
            : usedAreaMm // ignore: cast_nullable_to_non_nullable
                  as int,
        wasteAreaMm: null == wasteAreaMm
            ? _value.wasteAreaMm
            : wasteAreaMm // ignore: cast_nullable_to_non_nullable
                  as int,
        utilizationPercent: null == utilizationPercent
            ? _value.utilizationPercent
            : utilizationPercent // ignore: cast_nullable_to_non_nullable
                  as double,
        wastePercent: null == wastePercent
            ? _value.wastePercent
            : wastePercent // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CuttingPlanImpl implements _CuttingPlan {
  const _$CuttingPlanImpl({
    required this.stock,
    required this.settings,
    required final List<PlacedCutPiece> placements,
    required final List<UnplacedCutPiece> unplacedPieces,
    required this.usedLengthMm,
    required this.usedAreaMm,
    required this.wasteAreaMm,
    required this.utilizationPercent,
    required this.wastePercent,
  }) : _placements = placements,
       _unplacedPieces = unplacedPieces;

  factory _$CuttingPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$CuttingPlanImplFromJson(json);

  @override
  final CarpetRollStock stock;
  @override
  final CutSettings settings;
  final List<PlacedCutPiece> _placements;
  @override
  List<PlacedCutPiece> get placements {
    if (_placements is EqualUnmodifiableListView) return _placements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_placements);
  }

  final List<UnplacedCutPiece> _unplacedPieces;
  @override
  List<UnplacedCutPiece> get unplacedPieces {
    if (_unplacedPieces is EqualUnmodifiableListView) return _unplacedPieces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unplacedPieces);
  }

  @override
  final int usedLengthMm;
  @override
  final int usedAreaMm;
  @override
  final int wasteAreaMm;
  @override
  final double utilizationPercent;
  @override
  final double wastePercent;

  @override
  String toString() {
    return 'CuttingPlan(stock: $stock, settings: $settings, placements: $placements, unplacedPieces: $unplacedPieces, usedLengthMm: $usedLengthMm, usedAreaMm: $usedAreaMm, wasteAreaMm: $wasteAreaMm, utilizationPercent: $utilizationPercent, wastePercent: $wastePercent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CuttingPlanImpl &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            const DeepCollectionEquality().equals(
              other._placements,
              _placements,
            ) &&
            const DeepCollectionEquality().equals(
              other._unplacedPieces,
              _unplacedPieces,
            ) &&
            (identical(other.usedLengthMm, usedLengthMm) ||
                other.usedLengthMm == usedLengthMm) &&
            (identical(other.usedAreaMm, usedAreaMm) ||
                other.usedAreaMm == usedAreaMm) &&
            (identical(other.wasteAreaMm, wasteAreaMm) ||
                other.wasteAreaMm == wasteAreaMm) &&
            (identical(other.utilizationPercent, utilizationPercent) ||
                other.utilizationPercent == utilizationPercent) &&
            (identical(other.wastePercent, wastePercent) ||
                other.wastePercent == wastePercent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    stock,
    settings,
    const DeepCollectionEquality().hash(_placements),
    const DeepCollectionEquality().hash(_unplacedPieces),
    usedLengthMm,
    usedAreaMm,
    wasteAreaMm,
    utilizationPercent,
    wastePercent,
  );

  /// Create a copy of CuttingPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CuttingPlanImplCopyWith<_$CuttingPlanImpl> get copyWith =>
      __$$CuttingPlanImplCopyWithImpl<_$CuttingPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CuttingPlanImplToJson(this);
  }
}

abstract class _CuttingPlan implements CuttingPlan {
  const factory _CuttingPlan({
    required final CarpetRollStock stock,
    required final CutSettings settings,
    required final List<PlacedCutPiece> placements,
    required final List<UnplacedCutPiece> unplacedPieces,
    required final int usedLengthMm,
    required final int usedAreaMm,
    required final int wasteAreaMm,
    required final double utilizationPercent,
    required final double wastePercent,
  }) = _$CuttingPlanImpl;

  factory _CuttingPlan.fromJson(Map<String, dynamic> json) =
      _$CuttingPlanImpl.fromJson;

  @override
  CarpetRollStock get stock;
  @override
  CutSettings get settings;
  @override
  List<PlacedCutPiece> get placements;
  @override
  List<UnplacedCutPiece> get unplacedPieces;
  @override
  int get usedLengthMm;
  @override
  int get usedAreaMm;
  @override
  int get wasteAreaMm;
  @override
  double get utilizationPercent;
  @override
  double get wastePercent;

  /// Create a copy of CuttingPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CuttingPlanImplCopyWith<_$CuttingPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ManualCutRegion _$ManualCutRegionFromJson(Map<String, dynamic> json) {
  return _ManualCutRegion.fromJson(json);
}

/// @nodoc
mixin _$ManualCutRegion {
  String get id => throw _privateConstructorUsedError;
  int get xMm => throw _privateConstructorUsedError;
  int get yMm => throw _privateConstructorUsedError;
  int get widthMm => throw _privateConstructorUsedError;
  int get heightMm => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  /// Serializes this ManualCutRegion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ManualCutRegion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManualCutRegionCopyWith<ManualCutRegion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManualCutRegionCopyWith<$Res> {
  factory $ManualCutRegionCopyWith(
    ManualCutRegion value,
    $Res Function(ManualCutRegion) then,
  ) = _$ManualCutRegionCopyWithImpl<$Res, ManualCutRegion>;
  @useResult
  $Res call({
    String id,
    int xMm,
    int yMm,
    int widthMm,
    int heightMm,
    String label,
  });
}

/// @nodoc
class _$ManualCutRegionCopyWithImpl<$Res, $Val extends ManualCutRegion>
    implements $ManualCutRegionCopyWith<$Res> {
  _$ManualCutRegionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManualCutRegion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? xMm = null,
    Object? yMm = null,
    Object? widthMm = null,
    Object? heightMm = null,
    Object? label = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            xMm: null == xMm
                ? _value.xMm
                : xMm // ignore: cast_nullable_to_non_nullable
                      as int,
            yMm: null == yMm
                ? _value.yMm
                : yMm // ignore: cast_nullable_to_non_nullable
                      as int,
            widthMm: null == widthMm
                ? _value.widthMm
                : widthMm // ignore: cast_nullable_to_non_nullable
                      as int,
            heightMm: null == heightMm
                ? _value.heightMm
                : heightMm // ignore: cast_nullable_to_non_nullable
                      as int,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ManualCutRegionImplCopyWith<$Res>
    implements $ManualCutRegionCopyWith<$Res> {
  factory _$$ManualCutRegionImplCopyWith(
    _$ManualCutRegionImpl value,
    $Res Function(_$ManualCutRegionImpl) then,
  ) = __$$ManualCutRegionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    int xMm,
    int yMm,
    int widthMm,
    int heightMm,
    String label,
  });
}

/// @nodoc
class __$$ManualCutRegionImplCopyWithImpl<$Res>
    extends _$ManualCutRegionCopyWithImpl<$Res, _$ManualCutRegionImpl>
    implements _$$ManualCutRegionImplCopyWith<$Res> {
  __$$ManualCutRegionImplCopyWithImpl(
    _$ManualCutRegionImpl _value,
    $Res Function(_$ManualCutRegionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ManualCutRegion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? xMm = null,
    Object? yMm = null,
    Object? widthMm = null,
    Object? heightMm = null,
    Object? label = null,
  }) {
    return _then(
      _$ManualCutRegionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        xMm: null == xMm
            ? _value.xMm
            : xMm // ignore: cast_nullable_to_non_nullable
                  as int,
        yMm: null == yMm
            ? _value.yMm
            : yMm // ignore: cast_nullable_to_non_nullable
                  as int,
        widthMm: null == widthMm
            ? _value.widthMm
            : widthMm // ignore: cast_nullable_to_non_nullable
                  as int,
        heightMm: null == heightMm
            ? _value.heightMm
            : heightMm // ignore: cast_nullable_to_non_nullable
                  as int,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ManualCutRegionImpl implements _ManualCutRegion {
  const _$ManualCutRegionImpl({
    required this.id,
    required this.xMm,
    required this.yMm,
    required this.widthMm,
    required this.heightMm,
    this.label = 'متبقي',
  });

  factory _$ManualCutRegionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ManualCutRegionImplFromJson(json);

  @override
  final String id;
  @override
  final int xMm;
  @override
  final int yMm;
  @override
  final int widthMm;
  @override
  final int heightMm;
  @override
  @JsonKey()
  final String label;

  @override
  String toString() {
    return 'ManualCutRegion(id: $id, xMm: $xMm, yMm: $yMm, widthMm: $widthMm, heightMm: $heightMm, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManualCutRegionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.xMm, xMm) || other.xMm == xMm) &&
            (identical(other.yMm, yMm) || other.yMm == yMm) &&
            (identical(other.widthMm, widthMm) || other.widthMm == widthMm) &&
            (identical(other.heightMm, heightMm) ||
                other.heightMm == heightMm) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, xMm, yMm, widthMm, heightMm, label);

  /// Create a copy of ManualCutRegion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManualCutRegionImplCopyWith<_$ManualCutRegionImpl> get copyWith =>
      __$$ManualCutRegionImplCopyWithImpl<_$ManualCutRegionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ManualCutRegionImplToJson(this);
  }
}

abstract class _ManualCutRegion implements ManualCutRegion {
  const factory _ManualCutRegion({
    required final String id,
    required final int xMm,
    required final int yMm,
    required final int widthMm,
    required final int heightMm,
    final String label,
  }) = _$ManualCutRegionImpl;

  factory _ManualCutRegion.fromJson(Map<String, dynamic> json) =
      _$ManualCutRegionImpl.fromJson;

  @override
  String get id;
  @override
  int get xMm;
  @override
  int get yMm;
  @override
  int get widthMm;
  @override
  int get heightMm;
  @override
  String get label;

  /// Create a copy of ManualCutRegion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManualCutRegionImplCopyWith<_$ManualCutRegionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ManualCutLayout _$ManualCutLayoutFromJson(Map<String, dynamic> json) {
  return _ManualCutLayout.fromJson(json);
}

/// @nodoc
mixin _$ManualCutLayout {
  CarpetRollStock get stock => throw _privateConstructorUsedError;
  List<ManualCutRegion> get regions => throw _privateConstructorUsedError;
  String? get selectedRegionId => throw _privateConstructorUsedError;

  /// Serializes this ManualCutLayout to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ManualCutLayout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManualCutLayoutCopyWith<ManualCutLayout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManualCutLayoutCopyWith<$Res> {
  factory $ManualCutLayoutCopyWith(
    ManualCutLayout value,
    $Res Function(ManualCutLayout) then,
  ) = _$ManualCutLayoutCopyWithImpl<$Res, ManualCutLayout>;
  @useResult
  $Res call({
    CarpetRollStock stock,
    List<ManualCutRegion> regions,
    String? selectedRegionId,
  });

  $CarpetRollStockCopyWith<$Res> get stock;
}

/// @nodoc
class _$ManualCutLayoutCopyWithImpl<$Res, $Val extends ManualCutLayout>
    implements $ManualCutLayoutCopyWith<$Res> {
  _$ManualCutLayoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManualCutLayout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stock = null,
    Object? regions = null,
    Object? selectedRegionId = freezed,
  }) {
    return _then(
      _value.copyWith(
            stock: null == stock
                ? _value.stock
                : stock // ignore: cast_nullable_to_non_nullable
                      as CarpetRollStock,
            regions: null == regions
                ? _value.regions
                : regions // ignore: cast_nullable_to_non_nullable
                      as List<ManualCutRegion>,
            selectedRegionId: freezed == selectedRegionId
                ? _value.selectedRegionId
                : selectedRegionId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of ManualCutLayout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CarpetRollStockCopyWith<$Res> get stock {
    return $CarpetRollStockCopyWith<$Res>(_value.stock, (value) {
      return _then(_value.copyWith(stock: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ManualCutLayoutImplCopyWith<$Res>
    implements $ManualCutLayoutCopyWith<$Res> {
  factory _$$ManualCutLayoutImplCopyWith(
    _$ManualCutLayoutImpl value,
    $Res Function(_$ManualCutLayoutImpl) then,
  ) = __$$ManualCutLayoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CarpetRollStock stock,
    List<ManualCutRegion> regions,
    String? selectedRegionId,
  });

  @override
  $CarpetRollStockCopyWith<$Res> get stock;
}

/// @nodoc
class __$$ManualCutLayoutImplCopyWithImpl<$Res>
    extends _$ManualCutLayoutCopyWithImpl<$Res, _$ManualCutLayoutImpl>
    implements _$$ManualCutLayoutImplCopyWith<$Res> {
  __$$ManualCutLayoutImplCopyWithImpl(
    _$ManualCutLayoutImpl _value,
    $Res Function(_$ManualCutLayoutImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ManualCutLayout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stock = null,
    Object? regions = null,
    Object? selectedRegionId = freezed,
  }) {
    return _then(
      _$ManualCutLayoutImpl(
        stock: null == stock
            ? _value.stock
            : stock // ignore: cast_nullable_to_non_nullable
                  as CarpetRollStock,
        regions: null == regions
            ? _value._regions
            : regions // ignore: cast_nullable_to_non_nullable
                  as List<ManualCutRegion>,
        selectedRegionId: freezed == selectedRegionId
            ? _value.selectedRegionId
            : selectedRegionId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ManualCutLayoutImpl implements _ManualCutLayout {
  const _$ManualCutLayoutImpl({
    required this.stock,
    required final List<ManualCutRegion> regions,
    this.selectedRegionId,
  }) : _regions = regions;

  factory _$ManualCutLayoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$ManualCutLayoutImplFromJson(json);

  @override
  final CarpetRollStock stock;
  final List<ManualCutRegion> _regions;
  @override
  List<ManualCutRegion> get regions {
    if (_regions is EqualUnmodifiableListView) return _regions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_regions);
  }

  @override
  final String? selectedRegionId;

  @override
  String toString() {
    return 'ManualCutLayout(stock: $stock, regions: $regions, selectedRegionId: $selectedRegionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManualCutLayoutImpl &&
            (identical(other.stock, stock) || other.stock == stock) &&
            const DeepCollectionEquality().equals(other._regions, _regions) &&
            (identical(other.selectedRegionId, selectedRegionId) ||
                other.selectedRegionId == selectedRegionId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    stock,
    const DeepCollectionEquality().hash(_regions),
    selectedRegionId,
  );

  /// Create a copy of ManualCutLayout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManualCutLayoutImplCopyWith<_$ManualCutLayoutImpl> get copyWith =>
      __$$ManualCutLayoutImplCopyWithImpl<_$ManualCutLayoutImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ManualCutLayoutImplToJson(this);
  }
}

abstract class _ManualCutLayout implements ManualCutLayout {
  const factory _ManualCutLayout({
    required final CarpetRollStock stock,
    required final List<ManualCutRegion> regions,
    final String? selectedRegionId,
  }) = _$ManualCutLayoutImpl;

  factory _ManualCutLayout.fromJson(Map<String, dynamic> json) =
      _$ManualCutLayoutImpl.fromJson;

  @override
  CarpetRollStock get stock;
  @override
  List<ManualCutRegion> get regions;
  @override
  String? get selectedRegionId;

  /// Create a copy of ManualCutLayout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManualCutLayoutImplCopyWith<_$ManualCutLayoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
