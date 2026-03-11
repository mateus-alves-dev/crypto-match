import 'package:crypto_match/features/match/domain/entities/match.dart';
import 'package:flutter/material.dart';

enum SwipeIndicator { like, nope, superLike }

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    required this.suggestion,
    this.swipeIndicator,
    super.key,
  });

  final MatchSuggestion suggestion;
  final SwipeIndicator? swipeIndicator;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      elevation: 8,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _AvatarBackground(suggestion: suggestion),
          const _GradientOverlay(),
          if (swipeIndicator != null) _SwipeStamp(indicator: swipeIndicator!),
          _ProfileInfo(suggestion: suggestion),
        ],
      ),
    );
  }
}

class _AvatarBackground extends StatelessWidget {
  const _AvatarBackground({required this.suggestion});
  final MatchSuggestion suggestion;

  @override
  Widget build(BuildContext context) {
    if (suggestion.avatarUrl != null) {
      return Image.network(
        suggestion.avatarUrl!,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const _PlaceholderBg();
        },
        errorBuilder: (_, __, ___) => const _PlaceholderBg(),
      );
    }
    return const _PlaceholderBg();
  }
}

class _PlaceholderBg extends StatelessWidget {
  const _PlaceholderBg();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1A1A2E), Color(0xFF16213E), Color(0xFF0F3460)],
        ),
      ),
      child: const Center(
        child: Icon(Icons.person, size: 80, color: Colors.white30),
      ),
    );
  }
}

class _GradientOverlay extends StatelessWidget {
  const _GradientOverlay();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5, 1.0],
          colors: [Colors.transparent, Colors.black87],
        ),
      ),
    );
  }
}

class _ProfileInfo extends StatelessWidget {
  const _ProfileInfo({required this.suggestion});
  final MatchSuggestion suggestion;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                  suggestion.name,
                  style: theme.textTheme.displayLarge?.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (suggestion.age != null) ...[
                const SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    '${suggestion.age}',
                    style: theme.textTheme.titleLarge
                        ?.copyWith(color: Colors.white70),
                  ),
                ),
              ],
            ],
          ),
          if (suggestion.bio != null) ...[
            const SizedBox(height: 6),
            Text(
              suggestion.bio!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.white70,
                height: 1.4,
              ),
            ),
          ],
          if (suggestion.cryptoInterests?.isNotEmpty == true) ...[
            const SizedBox(height: 10),
            Wrap(
              spacing: 6,
              runSpacing: 4,
              children: suggestion.cryptoInterests!
                  .take(3)
                  .map((tag) => _CryptoChip(label: tag))
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }
}

class _CryptoChip extends StatelessWidget {
  const _CryptoChip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF6C63FF).withValues(alpha: 0.85),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _SwipeStamp extends StatelessWidget {
  const _SwipeStamp({required this.indicator});
  final SwipeIndicator indicator;

  @override
  Widget build(BuildContext context) {
    final (label, color, alignment, angle) = switch (indicator) {
      SwipeIndicator.like => ('LIKE', Colors.green, Alignment.topLeft, -0.4),
      SwipeIndicator.nope => ('NOPE', Colors.red, Alignment.topRight, 0.4),
      SwipeIndicator.superLike => (
          'SUPER\nLIKE',
          Colors.blue,
          Alignment.topCenter,
          0.0
        ),
    };

    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Transform.rotate(
          angle: angle,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: color, width: 3),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontSize: 28,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
