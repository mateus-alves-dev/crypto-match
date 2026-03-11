import 'package:crypto_match/core/router/app_router.dart';
import 'package:crypto_match/features/chat/domain/entities/message.dart';
import 'package:crypto_match/features/match/domain/entities/match.dart';
import 'package:crypto_match/features/match/presentation/cubit/match_cubit.dart';
import 'package:crypto_match/features/match/presentation/cubit/match_state.dart';
import 'package:crypto_match/features/match/presentation/widgets/match_dialog.dart';
import 'package:crypto_match/features/match/presentation/widgets/swipe_card_deck.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  void initState() {
    super.initState();
    context.read<MatchCubit>().loadFeed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const _Logo(),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune_rounded),
            onPressed: () {},
            tooltip: 'Filtros',
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_rounded),
            color: Colors.white70,
            onPressed: () => context.push(AppRoutes.conversations),
            tooltip: 'Mensagens',
          ),
          IconButton(
            icon: const Icon(Icons.favorite_rounded),
            color: const Color(0xFF6C63FF),
            onPressed: () => context.push(AppRoutes.matches),
            tooltip: 'Seus matches',
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: BlocConsumer<MatchCubit, MatchState>(
        listener: (context, state) {
          state.whenOrNull(
            matched: (match, _) => _showMatchDialog(context, match),
          );
        },
        builder: (context, state) => state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const _LoadingView(),
          swiping: (remaining) => _SwipingView(
            remaining: remaining,
            onSwiped: (a) => context.read<MatchCubit>().swipe(action: a),
          ),
          matched: (_, remaining) => _SwipingView(
            remaining: remaining,
            onSwiped: (a) => context.read<MatchCubit>().swipe(action: a),
          ),
          empty: () => const _EmptyView(),
          failure: (message) => _ErrorView(message: message),
        ),
      ),
    );
  }

  void _showMatchDialog(BuildContext context, Match match) {
    Navigator.of(context).push<void>(
      PageRouteBuilder<void>(
        opaque: false,
        pageBuilder: (_, __, ___) => MatchDialog(
          match: match,
          onContinue: () {
            Navigator.of(context).pop();
            context.read<MatchCubit>().continueAfterMatch();
          },
          onSendMessage: () {
            Navigator.of(context).pop();
            context.read<MatchCubit>().continueAfterMatch();
            final conversation = Conversation(
              id: 'conv-${match.matchedUserId}',
              participantId: match.matchedUserId,
              participantName: match.matchedUserName,
              participantAvatarUrl: match.matchedUserAvatarUrl,
            );
            context.push(AppRoutes.chat(conversation.id), extra: conversation);
          },
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Crypto',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(
            text: 'Match',
            style: TextStyle(
              color: Color(0xFF6C63FF),
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
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
          Text('Carregando perfis...'),
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
          const Text('₿', style: TextStyle(fontSize: 64)),
          const SizedBox(height: 16),
          Text(
            'Você viu todos por hoje!',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          const Text(
            'Volte amanhã para novos perfis.',
            style: TextStyle(color: Colors.white54),
          ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message});
  final String message;

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
            onPressed: () => context.read<MatchCubit>().loadFeed(),
            child: const Text('Tentar novamente'),
          ),
        ],
      ),
    );
  }
}

class _SwipingView extends StatelessWidget {
  const _SwipingView({required this.remaining, required this.onSwiped});

  final List<MatchSuggestion> remaining;
  final void Function(SwipeAction) onSwiped;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: SwipeCardDeck(suggestions: remaining, onSwiped: onSwiped),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ActionButton(
                icon: Icons.close_rounded,
                color: Colors.red,
                size: 52,
                onTap: () => onSwiped(SwipeAction.dislike),
              ),
              const SizedBox(width: 16),
              _ActionButton(
                icon: Icons.star_rounded,
                color: Colors.blue,
                size: 44,
                onTap: () => onSwiped(SwipeAction.superLike),
              ),
              const SizedBox(width: 16),
              _ActionButton(
                icon: Icons.favorite_rounded,
                color: Colors.green,
                size: 52,
                onTap: () => onSwiped(SwipeAction.like),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.color,
    required this.size,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final double size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF1A1A2E),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.3),
              blurRadius: 12,
              spreadRadius: 2,
            ),
          ],
          border: Border.all(color: color.withValues(alpha: 0.6), width: 1.5),
        ),
        child: Icon(icon, color: color, size: size * 0.5),
      ),
    );
  }
}
