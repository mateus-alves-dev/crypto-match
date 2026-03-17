import 'package:crypto_match/features/token/presentation/cubit/streak_cubit.dart';
import 'package:crypto_match/features/token/presentation/cubit/streak_state.dart';
import 'package:crypto_match/features/token/presentation/cubit/token_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StreakShieldDialog extends StatelessWidget {
  const StreakShieldDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StreakCubit, StreakState>(
      listener: (context, state) {
        state.whenOrNull(
          shieldSuccess: (info) {
            Navigator.of(context).pop();
            context.read<TokenCubit>().loadWallet();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('🛡 Streak protegido! Seu streak continua.'),
                backgroundColor: Color(0xFF2E7D32),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          failure: (message, _) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.red.shade700,
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        );
      },
      builder: (context, state) {
        final info = context.read<StreakCubit>().currentInfo;
        final isShielding = state.maybeWhen(
          shielding: (_) => true,
          orElse: () => false,
        );

        return Padding(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom + 32,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 48,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              const Icon(
                Icons.local_fire_department_rounded,
                color: Colors.amber,
                size: 52,
              ),
              const SizedBox(height: 16),
              Text(
                info != null
                    ? 'Seu streak de ${info.currentStreak} dias está em risco!'
                    : 'Seu streak está em risco!',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'Você não fez check-in hoje. Use um Streak Shield para '
                'proteger seu progresso.',
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 14,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: isShielding
                      ? null
                      : () => context.read<StreakCubit>().useShield(),
                  icon: isShielding
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white54,
                          ),
                        )
                      : const Icon(Icons.shield_rounded),
                  label: Text(
                    isShielding
                        ? 'Protegendo...'
                        : 'Proteger por ${info?.shieldCost ?? 20} tokens',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(0xFF6C63FF),
                    disabledBackgroundColor:
                        const Color(0xFF6C63FF).withValues(alpha: 0.4),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed:
                      isShielding ? null : () => Navigator.of(context).pop(),
                  child: const Text(
                    'Deixar resetar',
                    style: TextStyle(color: Colors.white38),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
