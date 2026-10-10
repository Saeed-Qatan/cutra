import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/cutting_models.dart';
import '../../domain/algorithms/manual_cut_engine.dart';

final manualCutEngineProvider = Provider<ManualCutEngine>((ref) {
  return const ManualCutEngine();
});

final manualCuttingControllerProvider =
    NotifierProvider<ManualCuttingController, ManualCuttingState>(
      ManualCuttingController.new,
    );

class ManualCuttingState {
  final ManualCutLayout layout;
  final List<ManualCutLayout> undoStack;
  final List<ManualCutLayout> redoStack;
  final CutDirection direction;
  final int positionMm;
  final String? message;

  const ManualCuttingState({
    required this.layout,
    this.undoStack = const [],
    this.redoStack = const [],
    this.direction = CutDirection.vertical,
    this.positionMm = 1200,
    this.message,
  });

  factory ManualCuttingState.initial() {
    return ManualCuttingState(
      layout: ManualCutLayout.initial(
        const CarpetRollStock(rollWidthMm: 4000, availableLengthMm: 3000),
      ),
    );
  }

  ManualCuttingState copyWith({
    ManualCutLayout? layout,
    List<ManualCutLayout>? undoStack,
    List<ManualCutLayout>? redoStack,
    CutDirection? direction,
    int? positionMm,
    String? message,
    bool clearMessage = false,
  }) {
    return ManualCuttingState(
      layout: layout ?? this.layout,
      undoStack: undoStack ?? this.undoStack,
      redoStack: redoStack ?? this.redoStack,
      direction: direction ?? this.direction,
      positionMm: positionMm ?? this.positionMm,
      message: clearMessage ? null : message ?? this.message,
    );
  }
}

class ManualCuttingController extends Notifier<ManualCuttingState> {
  @override
  ManualCuttingState build() => ManualCuttingState.initial();

  void selectRegion(String regionId) {
    state = state.copyWith(
      layout: state.layout.copyWith(selectedRegionId: regionId),
      clearMessage: true,
    );
  }

  void setDirection(CutDirection direction) {
    state = state.copyWith(direction: direction, clearMessage: true);
  }

  void setPosition(int positionMm) {
    state = state.copyWith(positionMm: positionMm, clearMessage: true);
  }

  void executeCut() {
    try {
      final next = ref
          .read(manualCutEngineProvider)
          .splitSelected(
            layout: state.layout,
            direction: state.direction,
            positionMm: state.positionMm,
          );
      state = state.copyWith(
        layout: next,
        undoStack: [...state.undoStack, state.layout],
        redoStack: const [],
        message: 'تم تنفيذ القص بنجاح',
      );
    } catch (error) {
      state = state.copyWith(message: error.toString());
    }
  }

  void undo() {
    if (state.undoStack.isEmpty) return;
    final previous = state.undoStack.last;
    state = state.copyWith(
      layout: previous,
      undoStack: state.undoStack.sublist(0, state.undoStack.length - 1),
      redoStack: [...state.redoStack, state.layout],
      message: 'تم التراجع',
    );
  }

  void redo() {
    if (state.redoStack.isEmpty) return;
    final next = state.redoStack.last;
    state = state.copyWith(
      layout: next,
      undoStack: [...state.undoStack, state.layout],
      redoStack: state.redoStack.sublist(0, state.redoStack.length - 1),
      message: 'تمت الإعادة',
    );
  }

  void reset() {
    state = ManualCuttingState.initial().copyWith(message: 'تمت إعادة الضبط');
  }
}
