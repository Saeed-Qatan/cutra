import '../../../../core/services/storage_service.dart';
import '../models/counter_model.dart';

/// Repository interface for Counter data operations
abstract class CounterRepository {
  /// Fetch current counter model
  Future<CounterModel> getCounter();

  /// Save counter model
  Future<void> saveCounter(CounterModel counter);
}

/// Implementation of CounterRepository
class CounterRepositoryImpl implements CounterRepository {
  static const String _key = 'counter_val';
  final StorageService _storageService;

  CounterRepositoryImpl(this._storageService);

  @override
  Future<CounterModel> getCounter() async {
    final count = _storageService.getInt(_key) ?? 0;
    return CounterModel(count: count);
  }

  @override
  Future<void> saveCounter(CounterModel counter) async {
    await _storageService.setInt(_key, counter.count);
  }
}
