import 'package:crypto_match/core/router/app_router.dart';
import 'package:crypto_match/features/chat/domain/entities/message.dart';
import 'package:crypto_match/features/match/domain/entities/match.dart';
import 'package:crypto_match/features/match/presentation/cubit/matches_list_cubit.dart';
import 'package:crypto_match/features/match/presentation/cubit/matches_list_state.dart';
import 'package:crypto_match/features/match/presentation/widgets/match_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  @override
  void initState() {
    super.initState();
    context.read<MatchesListCubit>().loadMatches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Seus Matches',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        leading: const BackButton(),
      ),
      body: BlocBuilder<MatchesListCubit, MatchesListState>(
        builder: (context, state) => state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const _LoadingView(),
          loaded: (matches) => matches.isEmpty
              ? const _EmptyView()
              : _MatchesList(matches: matches),
          failure: (message) => _ErrorView(
            message: message,
            onRetry: () => context.read<MatchesListCubit>().loadMatches(),
          ),
        ),
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Carregando matches...'),
        ],
      ),
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('💫', style: TextStyle(fontSize: 64)),
          const SizedBox(height: 16),
          Text(
            'Nenhum match ainda',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          const Text(
            'Continue deslizando no feed para encontrar sua match cripto!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white54),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 12),
          Text(message),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Tentar novamente'),
          ),
        ],
      ),
    );
  }
}

class _MatchesList extends StatelessWidget {
  const _MatchesList({required this.matches});

  final List<Match> matches;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            '${matches.length} ${matches.length == 1 ? 'match' : 'matches'}',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Colors.white38,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const Divider(height: 1, color: Color(0xFF1A1A2E)),
        Expanded(
          child: ListView.separated(
            itemCount: matches.length,
            separatorBuilder: (_, _) =>
                const Divider(height: 1, color: Color(0xFF1A1A2E)),
            itemBuilder: (context, index) {
              final match = matches[index];
              return MatchListItem(
                match: match,
                onTap: () {
                  final conversation = Conversation(
                    id: 'conv-${match.matchedUserId}',
                    participantId: match.matchedUserId,
                    participantName: match.matchedUserName,
                    participantAvatarUrl: match.matchedUserAvatarUrl,
                  );
                  context.push(
                    AppRoutes.chat(conversation.id),
                    extra: conversation,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
