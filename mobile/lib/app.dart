import 'package:crypto_match/core/di/injection.dart';
import 'package:crypto_match/core/router/app_router.dart';
import 'package:crypto_match/core/theme/app_theme.dart';
import 'package:crypto_match/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:crypto_match/features/chat/presentation/cubit/conversations_cubit.dart';
import 'package:crypto_match/features/match/presentation/cubit/match_cubit.dart';
import 'package:crypto_match/features/match/presentation/cubit/matches_list_cubit.dart';
import 'package:crypto_match/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:crypto_match/features/token/presentation/cubit/token_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>().router;

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => getIt<AuthCubit>()),
        BlocProvider<MatchCubit>(create: (_) => getIt<MatchCubit>()),
        BlocProvider<MatchesListCubit>(
          create: (_) => getIt<MatchesListCubit>(),
        ),
        BlocProvider<ConversationsCubit>(
          create: (_) => getIt<ConversationsCubit>(),
        ),
        BlocProvider<ProfileCubit>(create: (_) => getIt<ProfileCubit>()),
        BlocProvider<TokenCubit>(create: (_) => getIt<TokenCubit>()),
      ],
      child: MaterialApp.router(
        title: 'CryptoMatch',
        theme: AppTheme.dark,
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
