import 'package:crypto_match/features/token/domain/entities/leaderboard_entry.dart';
import 'package:flutter/material.dart';

class LeaderboardPodiumWidget extends StatelessWidget {
  const LeaderboardPodiumWidget({required this.top3, super.key});

  final List<LeaderboardEntry> top3;

  @override
  Widget build(BuildContext context) {
    // Order: 2nd | 1st | 3rd
    final ordered = <LeaderboardEntry?>[
      top3.length > 1 ? top3[1] : null,
      top3.isNotEmpty ? top3[0] : null,
      top3.length > 2 ? top3[2] : null,
    ];
    final heights = [72.0, 100.0, 56.0];
    final colors = [
      const Color(0xFF9E9E9E), // silver
      const Color(0xFFFFD700), // gold
      const Color(0xFFCD7F32), // bronze
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(3, (i) {
          final entry = ordered[i];
          if (entry == null) return const SizedBox(width: 100);
          return _PodiumColumn(
            entry: entry,
            podiumHeight: heights[i],
            accentColor: colors[i],
          );
        }),
      ),
    );
  }
}

class _PodiumColumn extends StatelessWidget {
  const _PodiumColumn({
    required this.entry,
    required this.podiumHeight,
    required this.accentColor,
  });

  final LeaderboardEntry entry;
  final double podiumHeight;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (entry.hasWeeklyBadge)
            Icon(Icons.emoji_events_rounded, color: accentColor, size: 20),
          const SizedBox(height: 4),
          CircleAvatar(
            radius: 28,
            backgroundColor: accentColor.withValues(alpha: 0.2),
            backgroundImage:
                entry.avatarUrl != null ? NetworkImage(entry.avatarUrl!) : null,
            child: entry.avatarUrl == null
                ? Text(
                    entry.displayName.isNotEmpty
                        ? entry.displayName[0].toUpperCase()
                        : '?',
                    style: TextStyle(
                      color: accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                : null,
          ),
          const SizedBox(height: 6),
          Text(
            entry.displayName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '${entry.weeklyTokens.toStringAsFixed(0)} CMT',
            style: TextStyle(fontSize: 11, color: accentColor),
          ),
          const SizedBox(height: 6),
          Container(
            height: podiumHeight,
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.15),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
              border: Border.all(color: accentColor.withValues(alpha: 0.4)),
            ),
            alignment: Alignment.center,
            child: Text(
              '#${entry.rank}',
              style: TextStyle(
                color: accentColor,
                fontWeight: FontWeight.w900,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
