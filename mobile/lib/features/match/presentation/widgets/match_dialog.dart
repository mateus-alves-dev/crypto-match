import 'package:crypto_match/features/match/domain/entities/match.dart';
import 'package:flutter/material.dart';

class MatchDialog extends StatelessWidget {
  const MatchDialog({
    required this.match,
    required this.onContinue,
    this.onSendMessage,
    super.key,
  });

  final Match match;
  final VoidCallback onContinue;
  final VoidCallback? onSendMessage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('🎉', style: TextStyle(fontSize: 64)),
            const SizedBox(height: 16),
            Text(
              'É um Match!',
              style: theme.textTheme.displayLarge?.copyWith(
                color: const Color(0xFF6C63FF),
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Você e ${match.matchedUserName} deram like um no outro.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 32),
            CircleAvatar(
              radius: 60,
              backgroundColor: const Color(0xFF1A1A2E),
              backgroundImage: match.matchedUserAvatarUrl != null
                  ? NetworkImage(match.matchedUserAvatarUrl!)
                  : null,
              child: match.matchedUserAvatarUrl == null
                  ? const Icon(Icons.person, size: 60, color: Colors.white30)
                  : null,
            ),
            const SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: onContinue,
                child: const Text('Continuar descobrindo'),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: onSendMessage ?? onContinue,
              child: const Text(
                'Enviar mensagem',
                style: TextStyle(color: Color(0xFF6C63FF)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
