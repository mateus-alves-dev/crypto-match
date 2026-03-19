import 'package:crypto_match/core/router/app_router.dart';
import 'package:crypto_match/features/token/presentation/cubit/token_cubit.dart';
import 'package:crypto_match/features/token/presentation/cubit/token_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// Bottom sheet shown when the user attempts a super-like without enough tokens.
class InsufficientBalanceSheet extends StatelessWidget {
  const InsufficientBalanceSheet({super.key});

  static const double superLikeCost = 10;

  @override
  Widget build(BuildContext context) {
    final balance = context.read<TokenCubit>().state.mapOrNull(
      loaded: (s) => s.balance.balance,
    );

    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: MediaQuery.viewInsetsOf(context).bottom + 32,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          const Text('⭐', style: TextStyle(fontSize: 48)),
          const SizedBox(height: 12),
          Text(
            'Tokens insuficientes',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'O super-like custa $superLikeCost tokens. '
            'Ganhe mais tokens completando missões diárias.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 20),
          _BalanceRow(currentBalance: balance, cost: superLikeCost),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.push(AppRoutes.rewards);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6C63FF),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Ganhar tokens',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Colors.white54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BalanceRow extends StatelessWidget {
  const _BalanceRow({required this.currentBalance, required this.cost});

  final double? currentBalance;
  final double cost;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Seu saldo',
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
                Text(
                  currentBalance != null
                      ? '${currentBalance!.toStringAsFixed(0)} tokens'
                      : '—',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(width: 1, height: 32, color: Colors.white12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Custo',
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
                Text(
                  '${cost.toStringAsFixed(0)} tokens',
                  style: const TextStyle(
                    color: Color(0xFF6C63FF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
