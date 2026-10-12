import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// Presentation form for user login with validation and submission feedback.
class LoginForm extends StatefulWidget {
  final bool isSubmitting;
  final String? errorMessage;
  final Future<void> Function({required String email, required String password}) onSubmit;
  final VoidCallback onNavigateToRegister;

  const LoginForm({
    super.key,
    required this.isSubmitting,
    this.errorMessage,
    required this.onSubmit,
    required this.onNavigateToRegister,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
            'Login Screen',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Gap(24),
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
                : const Text('Login'),
          ),
          TextButton(
            onPressed: widget.isSubmitting ? null : widget.onNavigateToRegister,
            child: const Text('Create account'),
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

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    await widget.onSubmit(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }
}
