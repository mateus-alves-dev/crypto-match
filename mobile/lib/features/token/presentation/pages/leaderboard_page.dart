import 'package:crypto_match/features/token/presentation/cubit/leaderboard_cubit.dart';
import 'package:crypto_match/features/token/presentation/cubit/leaderboard_state.dart';
import 'package:crypto_match/features/token/presentation/widgets/leaderboard_podium_widget.dart';
import 'package:crypto_match/features/token/presentation/widgets/leaderboard_rank_tile.dart';
import 'package:crypto_match/features/token/presentation/widgets/user_rank_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  @override
  void initState() {
    super.initState();
    context.read<LeaderboardCubit>().loadLeaderboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Earners da Semana'),
        centerTitle: true,
      ),
      body: BlocBuilder<LeaderboardCubit, LeaderboardState>(
        builder: (context, state) => state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          failure: (message) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(message, style: const TextStyle(color: Colors.white70)),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () =>
                      context.read<LeaderboardCubit>().loadLeaderboard(),
                  child: const Text('Tentar novamente'),
                ),
              ],
            ),
          ),
          loaded: (entries, userRank) {
            final top3 = entries.where((e) => e.rank <= 3).toList()
              ..sort((a, b) => a.rank.compareTo(b.rank));
            final rest = entries.where((e) => e.rank > 3).toList()
              ..sort((a, b) => a.rank.compareTo(b.rank));

            return Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: LeaderboardPodiumWidget(top3: top3),
                      ),
                      if (rest.isNotEmpty)
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: Text(
                              'Top 10',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: Colors.white54),
                            ),
                          ),
                        ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) =>
                              LeaderboardRankTile(entry: rest[index]),
                          childCount: rest.length,
                        ),
                      ),
                      const SliverPadding(
                        padding: EdgeInsets.only(bottom: 8),
                      ),
                    ],
                  ),
                ),
                if (userRank != null) UserRankCard(rank: userRank),
              ],
            );
          },
        ),
      ),
    );
  }
}
