import '../../models/home_model.dart';

/// Repository interface for Home / Counter data operations
abstract class HomeRepository {
  /// Fetch current counter model
  Future<CounterModel> getCounter();

  /// Save counter model
  Future<void> saveCounter(CounterModel counter);
}

typedef CounterRepository = HomeRepository;
