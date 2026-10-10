import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/cutting_models.dart';
import '../../domain/algorithms/carpet_cutting_algorithm.dart';

final carpetCuttingAlgorithmProvider = Provider<CarpetCuttingAlgorithm>((ref) {
  return const CarpetCuttingAlgorithm();
});

final automaticCuttingControllerProvider =
    NotifierProvider<AutomaticCuttingController, AutomaticCuttingState>(
      AutomaticCuttingController.new,
    );

class AutomaticCuttingState {
  final CarpetRollStock stock;
  final CutSettings settings;
  final List<CarpetPiece> pieces;
  final CuttingPlan? plan;
  final String? errorMessage;

  const AutomaticCuttingState({
    required this.stock,
    required this.settings,
    required this.pieces,
    this.plan,
    this.errorMessage,
  });

  factory AutomaticCuttingState.initial() {
    return const AutomaticCuttingState(
      stock: CarpetRollStock(rollWidthMm: 4000, availableLengthMm: 6000),
      settings: CutSettings(kerfMm: 5),
      pieces: [
        CarpetPiece(
          id: 'P1',
          label: 'مدخل المجلس',
          widthMm: 1200,
          heightMm: 800,
          quantity: 2,
        ),
        CarpetPiece(
          id: 'P2',
          label: 'ممر جانبي',
          widthMm: 900,
          heightMm: 600,
          quantity: 4,
          canRotate: true,
        ),
        CarpetPiece(
          id: 'P3',
          label: 'غرفة صغيرة',
          widthMm: 1500,
          heightMm: 500,
          quantity: 1,
        ),
      ],
    );
  }

  AutomaticCuttingState copyWith({
    CarpetRollStock? stock,
    CutSettings? settings,
    List<CarpetPiece>? pieces,
    CuttingPlan? plan,
    bool clearPlan = false,
    String? errorMessage,
    bool clearError = false,
  }) {
    return AutomaticCuttingState(
      stock: stock ?? this.stock,
      settings: settings ?? this.settings,
      pieces: pieces ?? this.pieces,
      plan: clearPlan ? null : plan ?? this.plan,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}

class AutomaticCuttingController extends Notifier<AutomaticCuttingState> {
  @override
  AutomaticCuttingState build() {
    final initial = AutomaticCuttingState.initial();
    return initial.copyWith(
      plan: ref
          .read(carpetCuttingAlgorithmProvider)
          .createPlan(
            stock: initial.stock,
            pieces: initial.pieces,
            settings: initial.settings,
          ),
    );
  }

  void updateRollWidth(int value) {
    state = state.copyWith(
      stock: state.stock.copyWith(rollWidthMm: value),
      clearPlan: true,
      clearError: true,
    );
  }

  void updateAvailableLength(int? value) {
    state = state.copyWith(
      stock: state.stock.copyWith(availableLengthMm: value),
      clearPlan: true,
      clearError: true,
    );
  }

  void updateKerf(int value) {
    state = state.copyWith(
      settings: state.settings.copyWith(kerfMm: value),
      clearPlan: true,
      clearError: true,
    );
  }

  void addPiece(CarpetPiece piece) {
    state = state.copyWith(
      pieces: [...state.pieces, piece],
      clearPlan: true,
      clearError: true,
    );
  }

  void removePiece(String pieceId) {
    state = state.copyWith(
      pieces: state.pieces.where((piece) => piece.id != pieceId).toList(),
      clearPlan: true,
      clearError: true,
    );
  }

  void toggleRotation(String pieceId) {
    state = state.copyWith(
      pieces: [
        for (final piece in state.pieces)
          if (piece.id == pieceId)
            piece.copyWith(canRotate: !piece.canRotate)
          else
            piece,
      ],
      clearPlan: true,
      clearError: true,
    );
  }

  void optimize() {
    try {
      final plan = ref
          .read(carpetCuttingAlgorithmProvider)
          .createPlan(
            stock: state.stock,
            pieces: state.pieces,
            settings: state.settings,
          );
      state = state.copyWith(plan: plan, clearError: true);
    } catch (error) {
      state = state.copyWith(errorMessage: error.toString(), clearPlan: true);
    }
  }
}
