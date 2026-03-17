import 'package:crypto_match/core/di/injection.dart';
import 'package:crypto_match/features/token/domain/entities/daily_mission.dart';
import 'package:crypto_match/features/token/presentation/cubit/daily_missions_cubit.dart';
import 'package:crypto_match/features/token/presentation/cubit/daily_missions_state.dart';
import 'package:crypto_match/features/token/presentation/cubit/token_cubit.dart';
import 'package:crypto_match/features/token/presentation/widgets/mission_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyMissionsPage extends StatelessWidget {
  const DailyMissionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<DailyMissionsCubit>()..loadMissions(),
      child: const _DailyMissionsView(),
    );
  }
}

class _DailyMissionsView extends StatelessWidget {
  const _DailyMissionsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Missões Diárias'),
      ),
      body: BlocConsumer<DailyMissionsCubit, DailyMissionsState>(
        listener: (BuildContext context, DailyMissionsState state) {
          state.whenOrNull(
            claimSuccess: (_, earnedAmount, __) {
              _showCelebrationSnackBar(context, earnedAmount);
              context.read<TokenCubit>().loadWallet();
            },
          );
        },
        builder: (BuildContext context, DailyMissionsState state) => state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (missions) => _MissionsList(missions: missions),
          claiming: (missions, claimingMissionId) => _MissionsList(
            missions: missions,
            claimingMissionId: claimingMissionId,
          ),
          claimSuccess: (missions, _, __) => _MissionsList(missions: missions),
          failure: (message, missions) {
            if (missions != null && missions.isNotEmpty) {
              return _MissionsList(
                missions: missions,
                errorMessage: message,
              );
            }
            return _ErrorView(
              message: message,
              onRetry: () => context.read<DailyMissionsCubit>().loadMissions(),
            );
          },
        ),
      ),
    );
  }

  void _showCelebrationSnackBar(BuildContext context, double earnedAmount) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: _CelebrationContent(earnedAmount: earnedAmount),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
  }
}

// ---------------------------------------------------------------------------
// Internal widgets
// ---------------------------------------------------------------------------

class _MissionsList extends StatelessWidget {
  const _MissionsList({
    required this.missions,
    this.claimingMissionId,
    this.errorMessage,
  });

  final List<DailyMission> missions;
  final String? claimingMissionId;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final resetsAt = missions.isNotEmpty ? missions.first.resetsAt : null;

    return RefreshIndicator(
      onRefresh: () => context.read<DailyMissionsCubit>().refresh(),
      child: CustomScrollView(
        slivers: [
          if (errorMessage != null)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: _ErrorBanner(message: errorMessage!),
              ),
            ),
          SliverList.builder(
            itemCount: missions.length,
            itemBuilder: (BuildContext context, int index) {
              final mission = missions[index];
              return MissionCard(
                mission: mission,
                isClaiming: claimingMissionId == mission.id,
              );
            },
          ),
          if (resetsAt != null)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: _ResetsAtFooter(resetsAt: resetsAt),
              ),
            ),
          // Bottom padding for comfortable scrolling
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}

class _ResetsAtFooter extends StatelessWidget {
  const _ResetsAtFooter({required this.resetsAt});

  final DateTime resetsAt;

  @override
  Widget build(BuildContext context) {
    final local = resetsAt.toLocal();
    final day = local.day.toString().padLeft(2, '0');
    final month = local.month.toString().padLeft(2, '0');
    final year = local.year;
    final hour = local.hour.toString().padLeft(2, '0');
    final minute = local.minute.toString().padLeft(2, '0');
    final formatted = '$day/$month/$year $hour:$minute';
    return Text(
      'Missões reiniciam em $formatted',
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
      textAlign: TextAlign.center,
    );
  }
}

class _CelebrationContent extends StatefulWidget {
  const _CelebrationContent({required this.earnedAmount});

  final double earnedAmount;

  @override
  State<_CelebrationContent> createState() => _CelebrationContentState();
}

class _CelebrationContentState extends State<_CelebrationContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _scale = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scale,
      child: Row(
        children: [
          const Icon(Icons.celebration_rounded, color: Colors.amber),
          const SizedBox(width: 8),
          Text(
            '+${widget.earnedAmount.toInt()} tokens ganhos! 🎉',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _ErrorBanner extends StatelessWidget {
  const _ErrorBanner({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: Theme.of(context).colorScheme.onErrorContainer,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onErrorContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
            Icon(
              Icons.error_outline_rounded,
              size: 48,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Tentar novamente'),
            ),
          ],
        ),
      ),
    );
  }
}
