import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// Presentation form for user registration with field validations.
class RegisterForm extends StatefulWidget {
  final bool isSubmitting;
  final String? errorMessage;
  final Future<void> Function({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) onSubmit;
  final VoidCallback onNavigateToLogin;

  const RegisterForm({
    super.key,
    required this.isSubmitting,
    this.errorMessage,
    required this.onSubmit,
    required this.onNavigateToLogin,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Register Screen',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Gap(24),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
            validator: _requiredValidator,
          ),
          const Gap(12),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            validator: _requiredValidator,
          ),
          const Gap(12),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            validator: _requiredValidator,
          ),
          const Gap(12),
          TextFormField(
            controller: _passwordConfirmationController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Confirm password',
              border: OutlineInputBorder(),
            ),
            validator: _passwordConfirmationValidator,
          ),
          if (widget.errorMessage != null) ...[
            const Gap(12),
            Text(
              widget.errorMessage!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ],
          const Gap(20),
          ElevatedButton(
            onPressed: widget.isSubmitting ? null : _submit,
            child: widget.isSubmitting
                ? const SizedBox.square(
                    dimension: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Register'),
          ),
          TextButton(
            onPressed: widget.isSubmitting ? null : widget.onNavigateToLogin,
            child: const Text('Back to login'),
          ),
        ],
      ),
    );
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Required';
    }
    return null;
  }

  String? _passwordConfirmationValidator(String? value) {
    final requiredError = _requiredValidator(value);
    if (requiredError != null) {
      return requiredError;
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    await widget.onSubmit(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      passwordConfirmation: _passwordConfirmationController.text,
    );
  }
}
