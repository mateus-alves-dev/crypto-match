import 'package:crypto_match/core/di/injection.dart';
import 'package:crypto_match/core/router/go_router_refresh_stream.dart';
import 'package:crypto_match/core/router/main_shell.dart';
import 'package:crypto_match/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:crypto_match/features/auth/presentation/cubit/auth_state.dart';
import 'package:crypto_match/features/auth/presentation/pages/login_page.dart';
import 'package:crypto_match/features/auth/presentation/pages/register_page.dart';
import 'package:crypto_match/features/chat/domain/entities/message.dart';
import 'package:crypto_match/features/chat/presentation/cubit/messages_cubit.dart';
import 'package:crypto_match/features/chat/presentation/pages/chat_page.dart';
import 'package:crypto_match/features/chat/presentation/pages/conversations_page.dart';
import 'package:crypto_match/features/match/presentation/pages/feed_page.dart';
import 'package:crypto_match/features/match/presentation/pages/matches_page.dart';
import 'package:crypto_match/features/profile/domain/entities/profile.dart';
import 'package:crypto_match/features/profile/presentation/pages/profile_edit_page.dart';
import 'package:crypto_match/features/profile/presentation/pages/profile_page.dart';
import 'package:crypto_match/features/settings/presentation/pages/settings_page.dart';
import 'package:crypto_match/features/token/presentation/pages/daily_missions_page.dart';
import 'package:crypto_match/features/token/presentation/pages/leaderboard_page.dart';
import 'package:crypto_match/features/token/presentation/pages/reward_actions_page.dart';
import 'package:crypto_match/features/token/presentation/pages/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

abstract final class AppRoutes {
  static const login = '/login';
  static const register = '/register';
  static const feed = '/feed';
  static const matches = '/matches';
  static const conversations = '/conversations';
  static const profile = '/profile';
  static const profileEdit = '/profile/edit';
  static const settings = '/profile/settings';
  static const wallet = '/wallet';
  static const rewards = '/wallet/rewards';
  static const leaderboard = '/wallet/leaderboard';
  static const missions = '/wallet/missions';

  static String chat(String conversationId) =>
      '/conversations/chat/$conversationId';
}

@singleton
class AppRouter {
  AppRouter(this._authCubit);

  final AuthCubit _authCubit;

  GoRouter get router => _router;

  late final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.login,
    debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshStream(_authCubit.stream),
    redirect: (context, state) {
      final location = state.matchedLocation;
      final isOnAuthRoute =
          location == AppRoutes.login || location == AppRoutes.register;

      return _authCubit.state.when(
        initial: () => null,
        loading: () => null,
        authenticated: (_) => isOnAuthRoute ? AppRoutes.feed : null,
        unauthenticated: () => isOnAuthRoute ? null : AppRoutes.login,
        failure: (_) => isOnAuthRoute ? null : AppRoutes.login,
      );
    },
    routes: [
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (BuildContext context, GoRouterState state) =>
            const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.register,
        name: 'register',
        builder: (BuildContext context, GoRouterState state) =>
            const RegisterPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) =>
            MainShell(
          navigationShell: navigationShell,
        ),
        branches: [
          // Branch 0 — Descobrir (Feed)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.feed,
                name: 'feed',
                builder: (BuildContext context, GoRouterState state) =>
                    const FeedPage(),
              ),
            ],
          ),
          // Branch 1 — Matches
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.matches,
                name: 'matches',
                builder: (BuildContext context, GoRouterState state) =>
                    const MatchesPage(),
              ),
            ],
          ),
          // Branch 2 — Mensagens (Conversations + Chat)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.conversations,
                name: 'conversations',
                builder: (BuildContext context, GoRouterState state) =>
                    const ConversationsPage(),
                routes: [
                  GoRoute(
                    path: 'chat/:conversationId',
                    name: 'chat',
                    builder: (BuildContext context, GoRouterState state) {
                      final conversation = state.extra as Conversation;
                      return BlocProvider(
                        create: (_) => getIt<MessagesCubit>(),
                        child: ChatPage(conversation: conversation),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          // Branch 3 — Wallet + Rewards
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.wallet,
                name: 'wallet',
                builder: (BuildContext context, GoRouterState state) =>
                    const WalletPage(),
                routes: [
                  GoRoute(
                    path: 'rewards',
                    name: 'rewards',
                    builder: (BuildContext context, GoRouterState state) =>
                        const RewardActionsPage(),
                  ),
                  GoRoute(
                    path: 'leaderboard',
                    name: 'leaderboard',
                    builder: (BuildContext context, GoRouterState state) =>
                        const LeaderboardPage(),
                  ),
                  GoRoute(
                    path: 'missions',
                    name: 'missions',
                    builder: (BuildContext context, GoRouterState state) =>
                        const DailyMissionsPage(),
                  ),
                ],
              ),
            ],
          ),
          // Branch 4 — Perfil + Edição
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                name: 'profile',
                builder: (BuildContext context, GoRouterState state) =>
                    const ProfilePage(),
                routes: [
                  GoRoute(
                    path: 'edit',
                    name: 'profile-edit',
                    builder: (BuildContext context, GoRouterState state) {
                      final profile = state.extra as Profile;
                      return ProfileEditPage(profile: profile);
                    },
                  ),
                  GoRoute(
                    path: 'settings',
                    name: 'settings',
                    builder: (BuildContext context, GoRouterState state) =>
                        const SettingsPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
