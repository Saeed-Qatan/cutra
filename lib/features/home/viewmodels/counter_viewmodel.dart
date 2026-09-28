import 'package:flutter/foundation.dart';
import '../data/models/counter_model.dart';
import '../data/repositories/counter_repository.dart';

/// ViewModel managing state and logic for Counter feature
class CounterViewModel extends ChangeNotifier {
  final CounterRepository _repository;

  CounterModel _counterModel = const CounterModel(count: 0);
  bool _isLoading = false;

  CounterViewModel(this._repository) {
    loadCounter();
  }

  /// Current count value getter
  int get count => _counterModel.count;

  /// Loading state getter
  bool get isLoading => _isLoading;

  /// Load counter value from repository
  Future<void> loadCounter() async {
    _isLoading = true;
    notifyListeners();

    _counterModel = await _repository.getCounter();
    _isLoading = false;
    notifyListeners();
  }

  /// Increment counter business logic
  Future<void> incrementCounter() async {
    final updatedModel = _counterModel.copyWith(
      count: _counterModel.count + 1,
    );
    _counterModel = updatedModel;
    notifyListeners();

    await _repository.saveCounter(updatedModel);
  }
}
