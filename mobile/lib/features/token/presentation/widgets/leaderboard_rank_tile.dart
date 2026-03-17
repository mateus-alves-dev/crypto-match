import 'package:crypto_match/features/token/domain/entities/leaderboard_entry.dart';
import 'package:flutter/material.dart';

class LeaderboardRankTile extends StatelessWidget {
  const LeaderboardRankTile({required this.entry, super.key});

  final LeaderboardEntry entry;

  @override
  Widget build(BuildContext context) {
    final isHighlighted = entry.isCurrentUser;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: isHighlighted
            ? const Color(0xFFFFB74D).withValues(alpha: 0.1)
            : const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(12),
        border: isHighlighted
            ? Border.all(color: const Color(0xFFFFB74D).withValues(alpha: 0.5))
            : null,
      ),
      child: ListTile(
        leading: SizedBox(
          width: 32,
          child: Text(
            '#${entry.rank}',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: isHighlighted ? const Color(0xFFFFB74D) : Colors.white54,
            ),
          ),
        ),
        title: Text(
          entry.displayName,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        trailing: Text(
          '${entry.weeklyTokens.toStringAsFixed(0)} CMT',
          style: const TextStyle(
            color: Color(0xFFFFB74D),
            fontWeight: FontWeight.w600,
          ),
        ),
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}
