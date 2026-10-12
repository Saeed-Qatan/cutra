import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../view_models/auth_view_model.dart';
import '../widgets/register/register_form.dart';

/// Top-level Register screen coordinating ViewModel actions and rendering RegisterForm.
class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider).valueOrNull;
    final isSubmitting = authState?.isSubmitting ?? false;
    final errorMessage = authState?.failure?.message;

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: RegisterForm(
                isSubmitting: isSubmitting,
                errorMessage: errorMessage,
                onSubmit: ({
                  required name,
                  required email,
                  required password,
                  required passwordConfirmation,
                }) {
                  return ref.read(authViewModelProvider.notifier).register(
                        name: name,
                        email: email,
                        password: password,
                        passwordConfirmation: passwordConfirmation,
                      );
                },
                onNavigateToLogin: () => context.go(AppRoutes.login),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
