import 'package:crypto_match/core/feature_flags/feature_flags_cubit.dart';
import 'package:crypto_match/core/feature_flags/feature_flags_state.dart';
import 'package:crypto_match/core/router/app_router.dart';
import 'package:crypto_match/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:crypto_match/features/auth/presentation/cubit/auth_state.dart';
import 'package:crypto_match/features/auth/presentation/widgets/auth_shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    return BlocListener<AuthCubit, AuthState>(
      listener: (BuildContext context, AuthState state) {
        state.whenOrNull(
          failure: (message) => ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message))),
        );
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'CryptoMatch',
                  style: Theme.of(context).textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                BlocBuilder<FeatureFlagsCubit, FeatureFlagsState>(
                  builder: (context, flagsState) {
                    final enableEmail = flagsState.maybeWhen(
                      loaded: (emailOn, _) => emailOn,
                      orElse: () => true, // safe default
                    );
                    final enableGoogle = flagsState.maybeWhen(
                      loaded: (_, googleOn) => googleOn,
                      orElse: () => false,
                    );

                    return BlocBuilder<AuthCubit, AuthState>(
                      builder: (BuildContext context, AuthState state) {
                        final isLoading = state.maybeWhen(
                          loading: () => true,
                          orElse: () => false,
                        );

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (enableEmail) ...[
                              TextField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const SizedBox(height: 16),
                              TextField(
                                controller: _passwordController,
                                decoration: const InputDecoration(
                                  labelText: 'Senha',
                                ),
                                obscureText: true,
                              ),
                              const SizedBox(height: 24),
                              ElevatedButton(
                                onPressed: isLoading
                                    ? null
                                    : () => context.read<AuthCubit>().login(
                                        email: _emailController.text.trim(),
                                        password: _passwordController.text,
                                      ),
                                child: isLoading
                                    ? const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : const Text('Entrar'),
                              ),
                              const SizedBox(height: 12),
                              TextButton(
                                onPressed: () =>
                                    context.push(AppRoutes.register),
                                child: const Text('Criar conta'),
                              ),
                            ],
                            if (enableEmail && enableGoogle)
                              const AuthOrDivider(),
                            if (enableGoogle) ...[
                              GoogleSignInButton(isLoading: isLoading),
                            ],
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
