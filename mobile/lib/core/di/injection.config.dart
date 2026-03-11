// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:crypto_match/core/di/injection.dart' as _i324;
import 'package:crypto_match/core/network/api_client.dart' as _i53;
import 'package:crypto_match/core/router/app_router.dart' as _i446;
import 'package:crypto_match/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i156;
import 'package:crypto_match/features/auth/data/repositories/auth_repository_mock.dart'
    as _i698;
import 'package:crypto_match/features/auth/domain/repositories/auth_repository.dart'
    as _i197;
import 'package:crypto_match/features/auth/domain/use_cases/auth_use_cases.dart'
    as _i825;
import 'package:crypto_match/features/auth/presentation/cubit/auth_cubit.dart'
    as _i212;
import 'package:crypto_match/features/chat/data/datasources/chat_remote_data_source.dart'
    as _i173;
import 'package:crypto_match/features/chat/data/repositories/chat_repository_mock.dart'
    as _i74;
import 'package:crypto_match/features/chat/domain/repositories/chat_repository.dart'
    as _i269;
import 'package:crypto_match/features/chat/domain/use_cases/chat_use_cases.dart'
    as _i676;
import 'package:crypto_match/features/chat/presentation/cubit/conversations_cubit.dart'
    as _i698;
import 'package:crypto_match/features/chat/presentation/cubit/messages_cubit.dart'
    as _i293;
import 'package:crypto_match/features/match/data/datasources/match_remote_data_source.dart'
    as _i627;
import 'package:crypto_match/features/match/data/repositories/match_repository_mock.dart'
    as _i1067;
import 'package:crypto_match/features/match/domain/repositories/match_repository.dart'
    as _i1050;
import 'package:crypto_match/features/match/domain/use_cases/match_use_cases.dart'
    as _i1051;
import 'package:crypto_match/features/match/presentation/cubit/match_cubit.dart'
    as _i498;
import 'package:crypto_match/features/match/presentation/cubit/matches_list_cubit.dart'
    as _i12;
import 'package:crypto_match/features/profile/data/datasources/profile_remote_data_source.dart'
    as _i706;
import 'package:crypto_match/features/profile/data/repositories/profile_repository_mock.dart'
    as _i841;
import 'package:crypto_match/features/profile/domain/repositories/profile_repository.dart'
    as _i360;
import 'package:crypto_match/features/profile/domain/use_cases/profile_use_cases.dart'
    as _i722;
import 'package:crypto_match/features/profile/presentation/cubit/profile_cubit.dart'
    as _i41;
import 'package:crypto_match/features/token/data/datasources/token_remote_data_source.dart'
    as _i4;
import 'package:crypto_match/features/token/data/repositories/token_repository_impl.dart'
    as _i366;
import 'package:crypto_match/features/token/domain/repositories/token_repository.dart'
    as _i593;
import 'package:crypto_match/features/token/domain/use_cases/token_use_cases.dart'
    as _i833;
import 'package:crypto_match/features/token/presentation/cubit/token_cubit.dart'
    as _i947;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i558.FlutterSecureStorage>(
        () => registerModule.secureStorage);
    gh.singleton<_i446.AppRouter>(() => _i446.AppRouter());
    gh.lazySingleton<_i197.AuthRepository>(
        () => _i698.MockAuthRepositoryImpl());
    gh.lazySingleton<_i269.ChatRepository>(() => _i74.MockChatRepositoryImpl());
    gh.lazySingleton<_i1050.MatchRepository>(
        () => _i1067.MockMatchRepositoryImpl());
    gh.lazySingleton<_i360.ProfileRepository>(
        () => _i841.MockProfileRepositoryImpl());
    gh.factory<_i676.GetConversationsUseCase>(
        () => _i676.GetConversationsUseCase(gh<_i269.ChatRepository>()));
    gh.factory<_i676.GetMessagesUseCase>(
        () => _i676.GetMessagesUseCase(gh<_i269.ChatRepository>()));
    gh.factory<_i676.SendMessageUseCase>(
        () => _i676.SendMessageUseCase(gh<_i269.ChatRepository>()));
    gh.factory<_i825.LoginUseCase>(
        () => _i825.LoginUseCase(gh<_i197.AuthRepository>()));
    gh.factory<_i825.RegisterUseCase>(
        () => _i825.RegisterUseCase(gh<_i197.AuthRepository>()));
    gh.factory<_i825.GetMeUseCase>(
        () => _i825.GetMeUseCase(gh<_i197.AuthRepository>()));
    gh.factory<_i698.ConversationsCubit>(
        () => _i698.ConversationsCubit(gh<_i676.GetConversationsUseCase>()));
    gh.factory<_i722.GetMyProfileUseCase>(
        () => _i722.GetMyProfileUseCase(gh<_i360.ProfileRepository>()));
    gh.factory<_i722.UpdateMyProfileUseCase>(
        () => _i722.UpdateMyProfileUseCase(gh<_i360.ProfileRepository>()));
    gh.singleton<_i53.ApiClient>(
        () => _i53.ApiClient(gh<_i558.FlutterSecureStorage>()));
    gh.factory<_i41.ProfileCubit>(() => _i41.ProfileCubit(
          gh<_i722.GetMyProfileUseCase>(),
          gh<_i722.UpdateMyProfileUseCase>(),
        ));
    gh.factory<_i293.MessagesCubit>(() => _i293.MessagesCubit(
          gh<_i676.GetMessagesUseCase>(),
          gh<_i676.SendMessageUseCase>(),
        ));
    gh.factory<_i1051.GetMatchFeedUseCase>(
        () => _i1051.GetMatchFeedUseCase(gh<_i1050.MatchRepository>()));
    gh.factory<_i1051.SwipeUseCase>(
        () => _i1051.SwipeUseCase(gh<_i1050.MatchRepository>()));
    gh.factory<_i1051.GetMatchesUseCase>(
        () => _i1051.GetMatchesUseCase(gh<_i1050.MatchRepository>()));
    gh.factory<_i212.AuthCubit>(() => _i212.AuthCubit(
          gh<_i825.LoginUseCase>(),
          gh<_i825.RegisterUseCase>(),
          gh<_i825.GetMeUseCase>(),
        ));
    gh.factory<_i12.MatchesListCubit>(
        () => _i12.MatchesListCubit(gh<_i1051.GetMatchesUseCase>()));
    gh.factory<_i4.TokenRemoteDataSource>(
        () => _i4.TokenRemoteDataSource(gh<_i53.ApiClient>()));
    gh.factory<_i156.AuthRemoteDataSource>(
        () => _i156.AuthRemoteDataSource(gh<_i53.ApiClient>()));
    gh.factory<_i627.MatchRemoteDataSource>(
        () => _i627.MatchRemoteDataSource(gh<_i53.ApiClient>()));
    gh.factory<_i706.ProfileRemoteDataSource>(
        () => _i706.ProfileRemoteDataSource(gh<_i53.ApiClient>()));
    gh.factory<_i173.ChatRemoteDataSource>(
        () => _i173.ChatRemoteDataSource(gh<_i53.ApiClient>()));
    gh.factory<_i498.MatchCubit>(() => _i498.MatchCubit(
          gh<_i1051.GetMatchFeedUseCase>(),
          gh<_i1051.SwipeUseCase>(),
        ));
    gh.lazySingleton<_i593.TokenRepository>(
        () => _i366.TokenRepositoryImpl(gh<_i4.TokenRemoteDataSource>()));
    gh.factory<_i833.GetTokenBalanceUseCase>(
        () => _i833.GetTokenBalanceUseCase(gh<_i593.TokenRepository>()));
    gh.factory<_i833.GetTokenHistoryUseCase>(
        () => _i833.GetTokenHistoryUseCase(gh<_i593.TokenRepository>()));
    gh.factory<_i833.DailyCheckinUseCase>(
        () => _i833.DailyCheckinUseCase(gh<_i593.TokenRepository>()));
    gh.factory<_i947.TokenCubit>(() => _i947.TokenCubit(
          gh<_i833.GetTokenBalanceUseCase>(),
          gh<_i833.GetTokenHistoryUseCase>(),
          gh<_i833.DailyCheckinUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i324.RegisterModule {}
