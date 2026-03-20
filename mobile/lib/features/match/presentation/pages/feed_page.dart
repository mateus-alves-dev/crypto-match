import 'package:crypto_match/core/router/app_router.dart';
import 'package:crypto_match/features/chat/domain/entities/message.dart';
import 'package:crypto_match/features/match/domain/entities/match.dart';
import 'package:crypto_match/features/match/presentation/cubit/match_cubit.dart';
import 'package:crypto_match/features/match/presentation/cubit/match_state.dart';
import 'package:crypto_match/features/match/presentation/widgets/insufficient_balance_sheet.dart';
import 'package:crypto_match/features/match/presentation/widgets/match_dialog.dart';
import 'package:crypto_match/features/match/presentation/widgets/swipe_card_deck.dart';
import 'package:crypto_match/features/settings/domain/entities/user_settings.dart';
import 'package:crypto_match/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:crypto_match/features/settings/presentation/cubit/settings_state.dart';
import 'package:crypto_match/features/token/presentation/cubit/token_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  /// Tracks the most recent swipe action so the listener can coordinate
  /// token debit rollback or balance refresh after the cubit responds.
  SwipeAction? _lastSwipeAction;

  @override
  void initState() {
    super.initState();
    context.read<MatchCubit>().loadFeed();
  }

  void _onSwipe(BuildContext context, SwipeAction action) {
    _lastSwipeAction = action;
    if (action == SwipeAction.superLike) {
      // Optimistically deduct 10 tokens so the balance widget updates instantly.
      context.read<TokenCubit>().applyOptimisticDebit(
        InsufficientBalanceSheet.superLikeCost,
      );
    }
    context.read<MatchCubit>().swipe(action: action);
  }

  void _showInsufficientBalanceSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF1A1A2E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => BlocProvider.value(
        value: context.read<TokenCubit>(),
        child: const InsufficientBalanceSheet(),
      ),
    );
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
            onPressed: () {
              final prefs =
                  context.read<SettingsCubit>().state.mapOrNull(
                    loaded: (s) => s.settings.matchPreferences,
                    updating: (s) => s.settings.matchPreferences,
                    updateSuccess: (s) => s.settings.matchPreferences,
                  ) ??
                  const MatchPreferences();

              if (!context.read<SettingsCubit>().state.maybeWhen(
                loaded: (_) => true,
                updating: (_) => true,
                updateSuccess: (_) => true,
                orElse: () => false,
              )) {
                context.read<SettingsCubit>().loadSettings();
              }

              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                backgroundColor: const Color(0xFF1A1A2E),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                builder: (_) => BlocProvider.value(
                  value: context.read<SettingsCubit>(),
                  child: _FeedFiltersSheet(initialPreferences: prefs),
                ),
              );
            },
            tooltip: 'Filtros',
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: BlocConsumer<MatchCubit, MatchState>(
        listener: (context, state) {
          state.whenOrNull(
            matched: (match, _) {
              _showMatchDialog(context, match);
              if (_lastSwipeAction == SwipeAction.superLike) {
                context.read<TokenCubit>().loadWallet();
              }
              _lastSwipeAction = null;
            },
            swiping: (_) {
              if (_lastSwipeAction == SwipeAction.superLike) {
                context.read<TokenCubit>().loadWallet();
              }
              _lastSwipeAction = null;
            },
            empty: () {
              if (_lastSwipeAction == SwipeAction.superLike) {
                context.read<TokenCubit>().loadWallet();
              }
              _lastSwipeAction = null;
            },
            insufficientBalance: (_) {
              context.read<TokenCubit>().revertOptimisticDebit(
                InsufficientBalanceSheet.superLikeCost,
              );
              _lastSwipeAction = null;
              _showInsufficientBalanceSheet(context);
            },
            swipeFailed: (message, _) {
              if (_lastSwipeAction == SwipeAction.superLike) {
                context.read<TokenCubit>().revertOptimisticDebit(
                  InsufficientBalanceSheet.superLikeCost,
                );
              }
              _lastSwipeAction = null;
              context.read<MatchCubit>().recoverFromSwipeFailed();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.red[700],
                ),
              );
            },
          );
        },
        builder: (context, state) => state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const _LoadingView(),
          swiping: (remaining) => _SwipingView(
            remaining: remaining,
            onSwiped: (a) => _onSwipe(context, a),
          ),
          matched: (_, remaining) => _SwipingView(
            remaining: remaining,
            onSwiped: (a) => _onSwipe(context, a),
          ),
          insufficientBalance: (remaining) => _SwipingView(
            remaining: remaining,
            onSwiped: (a) => _onSwipe(context, a),
          ),
          swipeFailed: (_, remaining) => _SwipingView(
            remaining: remaining,
            onSwiped: (a) => _onSwipe(context, a),
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
        pageBuilder: (_, _, _) => MatchDialog(
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

// ---------------------------------------------------------------------------
// Feed Filters Bottom Sheet
// ---------------------------------------------------------------------------

class _FeedFiltersSheet extends StatefulWidget {
  const _FeedFiltersSheet({required this.initialPreferences});

  final MatchPreferences initialPreferences;

  @override
  State<_FeedFiltersSheet> createState() => _FeedFiltersSheetState();
}

class _FeedFiltersSheetState extends State<_FeedFiltersSheet> {
  late double _maxDistance;
  late RangeValues _ageRange;
  late bool _filterByCrypto;

  @override
  void initState() {
    super.initState();
    _maxDistance = widget.initialPreferences.maxDistanceKm.toDouble();
    _ageRange = RangeValues(
      widget.initialPreferences.minAge.toDouble(),
      widget.initialPreferences.maxAge.toDouble(),
    );
    _filterByCrypto = widget.initialPreferences.filterByCryptoInterests;
  }

  void _apply(BuildContext context) {
    context.read<SettingsCubit>().updateMatchPreferences(
      MatchPreferences(
        maxDistanceKm: _maxDistance.round(),
        minAge: _ageRange.start.round(),
        maxAge: _ageRange.end.round(),
        filterByCryptoInterests: _filterByCrypto,
      ),
    );
    Navigator.of(context).pop();
  }

  void _reset() {
    setState(() {
      const defaults = MatchPreferences();
      _maxDistance = defaults.maxDistanceKm.toDouble();
      _ageRange = RangeValues(
        defaults.minAge.toDouble(),
        defaults.maxAge.toDouble(),
      );
      _filterByCrypto = defaults.filterByCryptoInterests;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 20,
          bottom: 24 + MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Filtros',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                TextButton(
                  onPressed: _reset,
                  child: const Text(
                    'Redefinir',
                    style: TextStyle(color: Color(0xFF6C63FF)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _Label('Distância máxima: ${_maxDistance.round()} km'),
            Slider(
              value: _maxDistance,
              min: 5,
              max: 200,
              divisions: 39,
              label: '${_maxDistance.round()} km',
              activeColor: const Color(0xFF6C63FF),
              onChanged: (v) => setState(() => _maxDistance = v),
            ),
            const SizedBox(height: 12),
            _Label(
              'Faixa etária: ${_ageRange.start.round()} – ${_ageRange.end.round()} anos',
            ),
            RangeSlider(
              values: _ageRange,
              min: 18,
              max: 70,
              divisions: 52,
              labels: RangeLabels(
                '${_ageRange.start.round()}',
                '${_ageRange.end.round()}',
              ),
              activeColor: const Color(0xFF6C63FF),
              onChanged: (v) => setState(() => _ageRange = v),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Label('Filtrar por interesses em cripto'),
                      Text(
                        'Mostrar apenas perfis com interesses similares',
                        style: TextStyle(color: Colors.white38, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: _filterByCrypto,
                  onChanged: (v) => setState(() => _filterByCrypto = v),
                  activeThumbColor: const Color(0xFF6C63FF),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _apply(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C63FF),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Aplicar',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
    );
  }
}
