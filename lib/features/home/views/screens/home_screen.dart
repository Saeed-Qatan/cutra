import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/services/storage_service.dart';
import '../../data/local_home_repository.dart';
import '../../view_models/home_view_model.dart';
import '../widgets/counter_display_widget.dart';

/// Top-level screen for Home Feature
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    // Inject dependencies into ViewModel
    final storageService = InMemoryStorageService();
    final repository = LocalHomeRepository(storageService);
    _viewModel = HomeViewModel(repository);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.homeTitle),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListenableBuilder(
          listenable: _viewModel,
          builder: (context, _) {
            if (_viewModel.isLoading) {
              return const CircularProgressIndicator();
            }
            return CounterDisplayWidget(count: _viewModel.count);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _viewModel.incrementCounter,
        tooltip: AppStrings.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
