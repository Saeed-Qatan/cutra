import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../view_models/auth_view_model.dart';
import '../widgets/login/login_form.dart';

/// Top-level Login screen coordinating ViewModel actions and rendering LoginForm.
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider).valueOrNull;
    final isSubmitting = authState?.isSubmitting ?? false;
    final errorMessage = authState?.failure?.message;

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: LoginForm(
                isSubmitting: isSubmitting,
                errorMessage: errorMessage,
                onSubmit: ({required email, required password}) {
                  return ref
                      .read(authViewModelProvider.notifier)
                      .login(email: email, password: password);
                },
                onNavigateToRegister: () => context.go(AppRoutes.register),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
