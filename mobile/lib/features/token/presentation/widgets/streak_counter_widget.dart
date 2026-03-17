import 'package:crypto_match/features/token/presentation/cubit/streak_cubit.dart';
import 'package:crypto_match/features/token/presentation/cubit/streak_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StreakCounterWidget extends StatelessWidget {
  const StreakCounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StreakCubit, StreakState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (info) => _StreakBanner(
            days: info.currentStreak,
            atRisk: info.streakAtRisk,
          ),
          shielding: (info) => _StreakBanner(
            days: info.currentStreak,
            atRisk: false,
            isLoading: true,
          ),
          shieldSuccess: (info) => _StreakBanner(
            days: info.currentStreak,
            atRisk: false,
          ),
          failure: (_, info) => info != null
              ? _StreakBanner(
                  days: info.currentStreak, atRisk: info.streakAtRisk)
              : const SizedBox.shrink(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}

class _StreakBanner extends StatelessWidget {
  const _StreakBanner({
    required this.days,
    required this.atRisk,
    this.isLoading = false,
  });

  final int days;
  final bool atRisk;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final color = atRisk ? Colors.amber : const Color(0xFFFFB74D);
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: [
          Icon(
            atRisk
                ? Icons.warning_amber_rounded
                : Icons.local_fire_department_rounded,
            color: color,
            size: 28,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$days ${days == 1 ? 'dia' : 'dias'} de streak',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                if (atRisk)
                  const Text(
                    'Seu streak está em risco! Use um Shield para protegê-lo.',
                    style: TextStyle(color: Colors.white60, fontSize: 12),
                  )
                else
                  const Text(
                    'Continue fazendo check-in diário!',
                    style: TextStyle(color: Colors.white54, fontSize: 12),
                  ),
              ],
            ),
          ),
          if (isLoading)
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
        ],
      ),
    );
  }
}
