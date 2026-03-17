import 'dart:async';

import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/token/domain/use_cases/token_use_cases.dart';
import 'package:crypto_match/features/token/presentation/cubit/token_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class TokenCubit extends Cubit<TokenState> {
  TokenCubit(
    this._getBalance,
    this._getHistory,
    this._dailyCheckin,
  ) : super(const TokenState.initial());

  final GetTokenBalanceUseCase _getBalance;
  final GetTokenHistoryUseCase _getHistory;
  final DailyCheckinUseCase _dailyCheckin;

  Future<void> loadWallet() async {
    emit(const TokenState.loading());
    final balanceResult = await _getBalance();
    final historyResult = await _getHistory();

    balanceResult.fold(
      (failure) => emit(
        TokenState.failure(
          message: failure.map(
            server: (f) => f.message,
            network: (f) => f.message,
            unauthorized: (_) => 'Unauthorized',
            notFound: (_) => 'Not found',
            unknown: (f) => f.message,
          ),
        ),
      ),
      (balance) => historyResult.fold(
        (failure) => emit(
          TokenState.failure(
            message: failure.map(
              server: (f) => f.message,
              network: (f) => f.message,
              unauthorized: (_) => 'Unauthorized',
              notFound: (_) => 'Not found',
              unknown: (f) => f.message,
            ),
          ),
        ),
        (history) =>
            emit(TokenState.loaded(balance: balance, history: history)),
      ),
    );
  }

  Future<void> dailyCheckin() async {
    final result = await _dailyCheckin();
    result.fold(
      (failure) => null,
      (_) => unawaited(loadWallet()),
    );
  }
}
