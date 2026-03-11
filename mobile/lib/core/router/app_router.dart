import 'package:crypto_match/core/di/injection.dart';
import 'package:crypto_match/features/auth/presentation/pages/login_page.dart';
import 'package:crypto_match/features/chat/domain/entities/message.dart';
import 'package:crypto_match/features/chat/presentation/cubit/messages_cubit.dart';
import 'package:crypto_match/features/chat/presentation/pages/chat_page.dart';
import 'package:crypto_match/features/chat/presentation/pages/conversations_page.dart';
import 'package:crypto_match/features/match/presentation/pages/feed_page.dart';
import 'package:crypto_match/features/match/presentation/pages/matches_page.dart';
import 'package:crypto_match/features/profile/domain/entities/profile.dart';
import 'package:crypto_match/features/profile/presentation/pages/profile_edit_page.dart';
import 'package:crypto_match/features/profile/presentation/pages/profile_page.dart';
import 'package:crypto_match/features/token/presentation/pages/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

abstract final class AppRoutes {
  static const login = '/login';
  static const feed = '/feed';
  static const matches = '/matches';
  static const conversations = '/conversations';
  static const _chatPath = '/chat/:conversationId';
  static const profile = '/profile';
  static const profileEdit = '/profile/edit';
  static const wallet = '/wallet';

  static String chat(String conversationId) => '/chat/$conversationId';
}

@singleton
class AppRouter {
  GoRouter get router => _router;

  final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.login,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (BuildContext context, GoRouterState state) =>
            const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.feed,
        name: 'feed',
        builder: (BuildContext context, GoRouterState state) =>
            const FeedPage(),
      ),
      GoRoute(
        path: AppRoutes.matches,
        name: 'matches',
        builder: (BuildContext context, GoRouterState state) =>
            const MatchesPage(),
      ),
      GoRoute(
        path: AppRoutes.conversations,
        name: 'conversations',
        builder: (BuildContext context, GoRouterState state) =>
            const ConversationsPage(),
      ),
      GoRoute(
        path: AppRoutes._chatPath,
        name: 'chat',
        builder: (BuildContext context, GoRouterState state) {
          final conversation = state.extra as Conversation;
          return BlocProvider(
            create: (_) => getIt<MessagesCubit>(),
            child: ChatPage(conversation: conversation),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.profile,
        name: 'profile',
        builder: (BuildContext context, GoRouterState state) =>
            const ProfilePage(),
      ),
      GoRoute(
        path: AppRoutes.profileEdit,
        name: 'profile-edit',
        builder: (BuildContext context, GoRouterState state) {
          final profile = state.extra as Profile;
          return ProfileEditPage(profile: profile);
        },
      ),
      GoRoute(
        path: AppRoutes.wallet,
        name: 'wallet',
        builder: (BuildContext context, GoRouterState state) =>
            const WalletPage(),
      ),
    ],
  );
}
