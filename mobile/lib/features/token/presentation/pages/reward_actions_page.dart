import 'package:crypto_match/features/token/domain/entities/token_action.dart';
import 'package:crypto_match/features/token/presentation/cubit/reward_actions_cubit.dart';
import 'package:crypto_match/features/token/presentation/cubit/reward_actions_state.dart';
import 'package:crypto_match/features/token/presentation/cubit/streak_cubit.dart';
import 'package:crypto_match/features/token/presentation/cubit/streak_state.dart';
import 'package:crypto_match/features/token/presentation/widgets/streak_counter_widget.dart';
import 'package:crypto_match/features/token/presentation/widgets/streak_shield_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RewardActionsPage extends StatefulWidget {
  const RewardActionsPage({super.key});

  @override
  State<RewardActionsPage> createState() => _RewardActionsPageState();
}

class _RewardActionsPageState extends State<RewardActionsPage> {
  @override
  void initState() {
    super.initState();
    context.read<RewardActionsCubit>().loadActions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ganhar Tokens')),
      body: MultiBlocListener(
        listeners: [
          BlocListener<StreakCubit, StreakState>(
            listener: (context, state) {
              state.whenOrNull(
                loaded: (info) {
                  if (info.streakAtRisk) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (context.mounted) {
                        showModalBottomSheet<void>(
                          context: context,
                          isScrollControlled: true,
                          builder: (_) => BlocProvider.value(
                            value: context.read<StreakCubit>(),
                            child: const StreakShieldDialog(),
                          ),
                        );
                      }
                    });
                  }
                },
              );
            },
          ),
        ],
        child: BlocConsumer<RewardActionsCubit, RewardActionsState>(
          listener: (context, state) {
            state.whenOrNull(
              claimSuccess: (_, earnedAmount) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '🎉 +${earnedAmount.toStringAsFixed(0)} CMT ganhos! Saldo atualizado.',
                    ),
                    backgroundColor: Colors.green.shade700,
                  ),
                );
              },
              failure: (message, __) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.red.shade700,
                  ),
                );
              },
            );
          },
          builder: (context, state) => state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (actions) => _ActionsBody(actions: actions),
            claiming: (actions, claimingId) =>
                _ActionsBody(actions: actions, claimingActionId: claimingId),
            claimSuccess: (actions, _) => _ActionsBody(actions: actions),
            failure: (message, actions) => actions != null && actions.isNotEmpty
                ? _ActionsBody(actions: actions)
                : _ErrorView(
                    message: message,
                    onRetry: () =>
                        context.read<RewardActionsCubit>().loadActions(),
                  ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Actions body (streak banner + list)
// ---------------------------------------------------------------------------

class _ActionsBody extends StatelessWidget {
  const _ActionsBody({required this.actions, this.claimingActionId});

  final List<TokenAction> actions;
  final String? claimingActionId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const StreakCounterWidget(),
        Expanded(
          child: _ActionsList(
            actions: actions,
            claimingActionId: claimingActionId,
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Actions list
// ---------------------------------------------------------------------------

class _ActionsList extends StatelessWidget {
  const _ActionsList({required this.actions, this.claimingActionId});

  final List<TokenAction> actions;
  final String? claimingActionId;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: actions.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final action = actions[index];
        return _ActionCard(
          action: action,
          isClaiming: claimingActionId == action.id,
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Single action card
// ---------------------------------------------------------------------------

class _ActionCard extends StatelessWidget {
  const _ActionCard({required this.action, this.isClaiming = false});

  final TokenAction action;
  final bool isClaiming;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final canClaim = action.isAvailable && !isClaiming;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Row(
          children: [
            // Icon
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                _iconFor(action.type),
                color: theme.colorScheme.primary,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(action.title, style: theme.textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(
                    action.description,
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.white54),
                  ),
                  const SizedBox(height: 8),
                  _statusBadge(context),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Reward chip + button
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '+${action.reward.toStringAsFixed(0)} CMT',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 36,
                  child: isClaiming
                      ? const SizedBox(
                          width: 36,
                          height: 36,
                          child: CircularProgressIndicator(strokeWidth: 2.5),
                        )
                      : FilledButton(
                          onPressed: canClaim ? () => _onClaim(context) : null,
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                          ),
                          child: Text(
                            canClaim ? 'Resgatar' : _unavailableLabel(),
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _statusBadge(BuildContext context) {
    if (action.isAvailable) {
      return Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Colors.greenAccent,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            'Disponível',
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: Colors.greenAccent),
          ),
        ],
      );
    }

    final label = _unavailableDetailLabel();
    return Text(
      label,
      style: Theme.of(context)
          .textTheme
          .labelSmall
          ?.copyWith(color: Colors.white38),
    );
  }

  String _unavailableLabel() {
    if (action.nextAvailableAt != null) return 'Aguardar';
    return 'Concluído';
  }

  String _unavailableDetailLabel() {
    if (action.nextAvailableAt != null) {
      final diff = action.nextAvailableAt!.difference(DateTime.now());
      if (diff.inHours > 0) return 'Disponível em ${diff.inHours}h';
      if (diff.inMinutes > 0) return 'Disponível em ${diff.inMinutes}min';
      return 'Disponível em breve';
    }
    return 'Já concluído';
  }

  IconData _iconFor(TokenActionType type) => switch (type) {
        TokenActionType.dailyCheckin => Icons.calendar_today_rounded,
        TokenActionType.completeProfile => Icons.person_rounded,
        TokenActionType.inviteFriend => Icons.group_add_rounded,
        TokenActionType.streakShield => Icons.shield_rounded,
        TokenActionType.weeklyRank1st ||
        TokenActionType.weeklyRank2nd ||
        TokenActionType.weeklyRank3rd =>
          Icons.emoji_events_rounded,
      };

  void _onClaim(BuildContext context) {
    final cubit = context.read<RewardActionsCubit>();
    switch (action.type) {
      case TokenActionType.dailyCheckin:
        cubit.claimDailyCheckin();
      case TokenActionType.completeProfile:
        cubit.claimCompleteProfile();
      case TokenActionType.inviteFriend:
        _showInviteDialog(context, cubit);
      case TokenActionType.streakShield:
        break; // managed by StreakCubit, not RewardActionsCubit
      case TokenActionType.weeklyRank1st:
      case TokenActionType.weeklyRank2nd:
      case TokenActionType.weeklyRank3rd:
        break; // distributed automatically by backend at week end
    }
  }

  void _showInviteDialog(BuildContext context, RewardActionsCubit cubit) {
    final controller = TextEditingController();
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Convidar amigo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Insira o código de convite que seu amigo forneceu:'),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Código de convite',
                hintText: 'ex.: ABC123',
              ),
              textCapitalization: TextCapitalization.characters,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              final code = controller.text.trim();
              if (code.isNotEmpty) {
                Navigator.of(ctx).pop();
                cubit.claimInviteFriend(referralCode: code);
              }
            },
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Error view
// ---------------------------------------------------------------------------

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.redAccent),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: onRetry,
              child: const Text('Tentar novamente'),
            ),
          ],
        ),
      ),
    );
  }
}
