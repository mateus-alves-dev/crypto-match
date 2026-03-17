import 'package:crypto_match/features/chat/domain/entities/message.dart';
import 'package:crypto_match/features/chat/presentation/cubit/conversations_cubit.dart';
import 'package:crypto_match/features/chat/presentation/cubit/conversations_state.dart';
import 'package:crypto_match/features/token/presentation/cubit/streak_cubit.dart';
import 'package:crypto_match/features/token/presentation/cubit/streak_state.dart';
import 'package:crypto_match/features/token/presentation/widgets/streak_shield_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainShell extends StatelessWidget {
  const MainShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BlocListener<StreakCubit, StreakState>(
      listener: (context, state) {
        state.whenOrNull(
          loaded: (info) {
            if (info.streakAtRisk) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (context.mounted) {
                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) => BlocProvider.value(
                      value: context.read<StreakCubit>(),
                      child: const StreakShieldDialog(),
                    ),
                  );
                }
              });
            }
          },
        );
      },
      child: Scaffold(
      body: navigationShell,
      bottomNavigationBar:
          BlocSelector<ConversationsCubit, ConversationsState, int>(
        selector: (state) =>
            state.whenOrNull(
              loaded: (List<Conversation> conversations) =>
                  conversations.fold<int>(
                0,
                (sum, c) => sum + (c.unreadCount ?? 0),
              ),
            ) ??
            0,
        builder: (context, unread) => NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: (index) => navigationShell.goBranch(
            index,
            // Re-tapping the active tab returns to its root location.
            initialLocation: index == navigationShell.currentIndex,
          ),
          destinations: [
            const NavigationDestination(
              icon: Icon(Icons.explore_outlined),
              selectedIcon: Icon(Icons.explore_rounded),
              label: 'Descobrir',
            ),
            const NavigationDestination(
              icon: Icon(Icons.favorite_outline_rounded),
              selectedIcon: Icon(Icons.favorite_rounded),
              label: 'Matches',
            ),
            NavigationDestination(
              icon: unread > 0
                  ? Badge(
                      label: Text(unread > 99 ? '99+' : '$unread'),
                      child: const Icon(Icons.chat_bubble_outline_rounded),
                    )
                  : const Icon(Icons.chat_bubble_outline_rounded),
              selectedIcon: unread > 0
                  ? Badge(
                      label: Text(unread > 99 ? '99+' : '$unread'),
                      child: const Icon(Icons.chat_bubble_rounded),
                    )
                  : const Icon(Icons.chat_bubble_rounded),
              label: 'Mensagens',
            ),
            const NavigationDestination(
              icon: Icon(Icons.account_balance_wallet_outlined),
              selectedIcon: Icon(Icons.account_balance_wallet_rounded),
              label: 'Wallet',
            ),
            const NavigationDestination(
              icon: Icon(Icons.person_outline_rounded),
              selectedIcon: Icon(Icons.person_rounded),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    ),
    );
  }
}
