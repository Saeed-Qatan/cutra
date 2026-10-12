import '../../../../../core/services/storage_service.dart';
import '../../models/home_model.dart';
import 'home_repository.dart';

/// Implementation of HomeRepository using local storage
class LocalHomeRepository implements HomeRepository {
  static const String _key = 'counter_val';
  final StorageService _storageService;

  LocalHomeRepository(this._storageService);

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

typedef CounterRepositoryImpl = LocalHomeRepository;
