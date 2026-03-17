import 'package:crypto_match/features/token/domain/entities/daily_mission.dart';
import 'package:flutter/material.dart';

class MissionCard extends StatelessWidget {
  const MissionCard({
    super.key,
    required this.mission,
    this.isClaiming = false,
  });

  final DailyMission mission;
  final bool isClaiming;

  @override
  Widget build(BuildContext context) {
    final progress = mission.progress.clamp(0, mission.target);
    final progressValue = mission.target > 0 ? progress / mission.target : 0.0;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    mission.title,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                _RewardBadge(
                  reward: mission.reward,
                  isCompleted: mission.isCompleted,
                  isRewarded: mission.isRewarded,
                  isClaiming: isClaiming,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              mission.description,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: progressValue,
                      minHeight: 8,
                      backgroundColor: colorScheme.surfaceContainerHighest,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        mission.isCompleted
                            ? colorScheme.primary
                            : colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '$progress/${mission.target}',
                  style: textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _RewardBadge extends StatelessWidget {
  const _RewardBadge({
    required this.reward,
    required this.isCompleted,
    required this.isRewarded,
    required this.isClaiming,
  });

  final double reward;
  final bool isCompleted;
  final bool isRewarded;
  final bool isClaiming;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (isClaiming) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }

    if (isRewarded) {
      return Icon(
        Icons.check_circle_rounded,
        color: colorScheme.primary,
        size: 22,
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isCompleted
            ? colorScheme.primaryContainer
            : colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '+${reward.toInt()} tokens',
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: isCompleted
                  ? colorScheme.onPrimaryContainer
                  : colorScheme.onSecondaryContainer,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
