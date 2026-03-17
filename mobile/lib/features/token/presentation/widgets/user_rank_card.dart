import 'package:flutter/material.dart';

class UserRankCard extends StatelessWidget {
  const UserRankCard({super.key, required this.rank});

  final int rank;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFFFFB74D).withValues(alpha: 0.2),
            const Color(0xFFFF8C00).withValues(alpha: 0.15),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border:
            Border.all(color: const Color(0xFFFFB74D).withValues(alpha: 0.6)),
      ),
      child: Row(
        children: [
          const Icon(Icons.person_rounded, color: Color(0xFFFFB74D), size: 20),
          const SizedBox(width: 10),
          const Text(
            'Sua posição',
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            '#$rank',
            style: const TextStyle(
              color: Color(0xFFFFB74D),
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
