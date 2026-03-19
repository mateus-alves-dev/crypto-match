import 'dart:math';

import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/token/domain/entities/daily_mission.dart';
import 'package:crypto_match/features/token/domain/entities/leaderboard_entry.dart';
import 'package:crypto_match/features/token/domain/entities/streak_info.dart';
import 'package:crypto_match/features/token/domain/entities/token_action.dart';
import 'package:crypto_match/features/token/domain/entities/token_balance.dart';
import 'package:crypto_match/features/token/domain/repositories/token_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TokenRepository)
class MockTokenRepositoryImpl implements TokenRepository {
  MockTokenRepositoryImpl() {
    _initHistory();
  }

  static const _userId = 'mock-user-1';

  double _balance = 135;

  late final List<TokenTransaction> _history;

  // Track which actions have been performed
  bool _dailyCheckinDone = false;
  bool _completeProfileDone = true; // already done in initial history
  bool _inviteFriendDone = true; // already done in initial history

  // Streak state
  final int _currentStreak = 7;
  bool _streakAtRisk = true; // true so the shield dialog is shown on first load
  bool _shieldUsed = false;

  void _initHistory() {
    final now = DateTime.now();

    _history = [
      TokenTransaction(
        id: 'tx-001',
        userId: _userId,
        type: TokenTransactionType.credit,
        amount: 100,
        reason: 'Convite aceito',
        createdAt: now.subtract(const Duration(days: 12)),
        metadata: {'referralCode': 'CRYPTO123'},
      ),
      TokenTransaction(
        id: 'tx-002',
        userId: _userId,
        type: TokenTransactionType.credit,
        amount: 50,
        reason: 'Perfil completo',
        createdAt: now.subtract(const Duration(days: 10)),
      ),
      TokenTransaction(
        id: 'tx-003',
        userId: _userId,
        type: TokenTransactionType.credit,
        amount: 10,
        reason: 'Check-in diário',
        createdAt: now.subtract(const Duration(days: 7)),
      ),
      TokenTransaction(
        id: 'tx-004',
        userId: _userId,
        type: TokenTransactionType.debit,
        amount: 25,
        reason: 'Presente enviado para Camila',
        createdAt: now.subtract(const Duration(days: 6)),
        metadata: {'targetUserId': 'mock-1', 'giftType': 'rose'},
      ),
      TokenTransaction(
        id: 'tx-005',
        userId: _userId,
        type: TokenTransactionType.credit,
        amount: 10,
        reason: 'Check-in diário',
        createdAt: now.subtract(const Duration(days: 5)),
      ),
      TokenTransaction(
        id: 'tx-006',
        userId: _userId,
        type: TokenTransactionType.debit,
        amount: 15,
        reason: 'Presente enviado para Rafael',
        createdAt: now.subtract(const Duration(days: 4)),
        metadata: {'targetUserId': 'mock-2', 'giftType': 'bitcoin'},
      ),
      TokenTransaction(
        id: 'tx-007',
        userId: _userId,
        type: TokenTransactionType.credit,
        amount: 10,
        reason: 'Check-in diário',
        createdAt: now.subtract(const Duration(days: 2)),
      ),
      TokenTransaction(
        id: 'tx-008',
        userId: _userId,
        type: TokenTransactionType.debit,
        amount: 10,
        reason: 'super_like',
        createdAt: now.subtract(const Duration(days: 1)),
        metadata: {'targetUserId': 'mock-3'},
      ),
    ];
  }

  @override
  Future<Either<Failure, TokenBalance>> getBalance() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return Right(
      TokenBalance(
        userId: _userId,
        balance: _balance,
        updatedAt: DateTime.now(),
      ),
    );
  }

  @override
  Future<Either<Failure, List<TokenTransaction>>> getHistory() async {
    await Future<void>.delayed(const Duration(milliseconds: 600));
    // Return newest first
    final sorted = List<TokenTransaction>.from(_history)
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return Right(sorted);
  }

  @override
  Future<Either<Failure, List<TokenAction>>> getRewardActions() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return Right(_buildActions());
  }

  @override
  Future<Either<Failure, void>> dailyCheckin() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    const amount = 10.0;
    _balance += amount;
    _dailyCheckinDone = true;
    _history.add(
      TokenTransaction(
        id: 'tx-${Random().nextInt(99999)}',
        userId: _userId,
        type: TokenTransactionType.credit,
        amount: amount,
        reason: 'Check-in diário',
        createdAt: DateTime.now(),
      ),
    );
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> completeProfileAction() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    const amount = 50.0;
    _balance += amount;
    _completeProfileDone = true;
    _history.add(
      TokenTransaction(
        id: 'tx-${Random().nextInt(99999)}',
        userId: _userId,
        type: TokenTransactionType.credit,
        amount: amount,
        reason: 'Perfil completo',
        createdAt: DateTime.now(),
      ),
    );
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> inviteFriend({
    required String referralCode,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    const amount = 100.0;
    _balance += amount;
    _inviteFriendDone = true;
    _history.add(
      TokenTransaction(
        id: 'tx-${Random().nextInt(99999)}',
        userId: _userId,
        type: TokenTransactionType.credit,
        amount: amount,
        reason: 'Convite aceito',
        createdAt: DateTime.now(),
        metadata: {'referralCode': referralCode},
      ),
    );
    return const Right(null);
  }

  List<TokenAction> _buildActions() {
    final now = DateTime.now();
    final tomorrowMidnight = DateTime(now.year, now.month, now.day + 1);

    return [
      TokenAction(
        id: 'daily-checkin',
        type: TokenActionType.dailyCheckin,
        title: 'Check-in Diário',
        description: 'Faça login todo dia para ganhar tokens',
        reward: 10,
        isAvailable: !_dailyCheckinDone,
        nextAvailableAt: _dailyCheckinDone ? tomorrowMidnight : null,
      ),
      TokenAction(
        id: 'complete-profile',
        type: TokenActionType.completeProfile,
        title: 'Complete seu Perfil',
        description: 'Adicione foto, bio e interesses para ganhar tokens',
        reward: 50,
        isAvailable: !_completeProfileDone,
        completedAt: _completeProfileDone
            ? now.subtract(const Duration(days: 10))
            : null,
      ),
      TokenAction(
        id: 'invite-friend',
        type: TokenActionType.inviteFriend,
        title: 'Convide um Amigo',
        description:
            'Ganhe tokens quando seu amigo se cadastrar com seu código',
        reward: 100,
        isAvailable: !_inviteFriendDone,
        completedAt: _inviteFriendDone
            ? now.subtract(const Duration(days: 12))
            : null,
      ),
    ];
  }

  @override
  Future<Either<Failure, StreakInfo>> getStreakInfo() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return Right(
      StreakInfo(
        currentStreak: _currentStreak,
        longestStreak: _currentStreak > 14 ? _currentStreak : 14,
        streakAtRisk: _streakAtRisk && !_shieldUsed,
      ),
    );
  }

  @override
  Future<Either<Failure, void>> useStreakShield() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    const cost = 20.0;
    if (_balance < cost) {
      return const Left(
        Failure.server(
          statusCode: 422,
          message: 'Saldo insuficiente para usar o Streak Shield.',
        ),
      );
    }
    _balance -= cost;
    _shieldUsed = true;
    _streakAtRisk = false;
    _history.add(
      TokenTransaction(
        id: 'tx-${Random().nextInt(99999)}',
        userId: _userId,
        type: TokenTransactionType.debit,
        amount: cost,
        reason: 'Streak Shield usado',
        createdAt: DateTime.now(),
      ),
    );
    return const Right(null);
  }

  @override
  Future<Either<Failure, List<LeaderboardEntry>>> getLeaderboard() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return Right([
      const LeaderboardEntry(
        rank: 1,
        userId: 'mock-top-1',
        displayName: 'CryptoKing',
        weeklyTokens: 580,
        hasWeeklyBadge: true,
        isCurrentUser: false,
      ),
      const LeaderboardEntry(
        rank: 2,
        userId: 'mock-top-2',
        displayName: 'DeFiQueen',
        weeklyTokens: 420,
        hasWeeklyBadge: true,
        isCurrentUser: false,
      ),
      const LeaderboardEntry(
        rank: 3,
        userId: 'mock-top-3',
        displayName: 'Hodlr',
        weeklyTokens: 310,
        hasWeeklyBadge: true,
        isCurrentUser: false,
      ),
      const LeaderboardEntry(
        rank: 4,
        userId: 'mock-top-4',
        displayName: 'AltcoinAlex',
        weeklyTokens: 220,
        hasWeeklyBadge: false,
        isCurrentUser: false,
      ),
      const LeaderboardEntry(
        rank: 5,
        userId: 'mock-top-5',
        displayName: 'BlockBob',
        weeklyTokens: 180,
        hasWeeklyBadge: false,
        isCurrentUser: false,
      ),
      LeaderboardEntry(
        rank: 6,
        userId: _userId,
        displayName: 'Você',
        weeklyTokens: _balance,
        hasWeeklyBadge: false,
        isCurrentUser: true,
      ),
    ]);
  }

  // Daily missions mock state
  final int _likeProgress = 0;
  final int _chatProgress = 0;
  bool _likeRewarded = false;
  bool _chatRewarded = false;
  bool _streak7dRewarded = false;

  @override
  Future<Either<Failure, List<DailyMission>>> getDailyMissions() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day + 1);
    return Right([
      DailyMission(
        id: 'mission-like',
        type: DailyMissionType.like,
        title: 'Dar 3 likes hoje',
        description: 'Curta perfis para ganhar tokens',
        reward: 5,
        progress: _likeProgress,
        target: 3,
        isCompleted: _likeProgress >= 3,
        isRewarded: _likeRewarded,
        resetsAt: midnight,
      ),
      DailyMission(
        id: 'mission-chat',
        type: DailyMissionType.chat,
        title: 'Iniciar 1 conversa',
        description: 'Comece uma conversa para ganhar tokens',
        reward: 10,
        progress: _chatProgress,
        target: 1,
        isCompleted: _chatProgress >= 1,
        isRewarded: _chatRewarded,
        resetsAt: midnight,
      ),
      DailyMission(
        id: 'mission-streak7d',
        type: DailyMissionType.streak7d,
        title: 'Streak de 7 dias',
        description: 'Abra o app 7 dias seguidos',
        reward: 50,
        progress: _currentStreak.clamp(0, 7),
        target: 7,
        isCompleted: _currentStreak >= 7,
        isRewarded: _streak7dRewarded,
        resetsAt: midnight,
      ),
    ]);
  }

  @override
  Future<Either<Failure, double>> claimMissionReward({
    required String missionId,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    switch (missionId) {
      case 'mission-like':
        const amount = 5.0;
        _balance += amount;
        _likeRewarded = true;
        _history.add(
          TokenTransaction(
            id: 'tx-${Random().nextInt(99999)}',
            userId: _userId,
            type: TokenTransactionType.credit,
            amount: amount,
            reason: 'Missão: Dar 3 likes hoje',
            createdAt: DateTime.now(),
          ),
        );
        return const Right(amount);
      case 'mission-chat':
        const amount = 10.0;
        _balance += amount;
        _chatRewarded = true;
        _history.add(
          TokenTransaction(
            id: 'tx-${Random().nextInt(99999)}',
            userId: _userId,
            type: TokenTransactionType.credit,
            amount: amount,
            reason: 'Missão: Iniciar 1 conversa',
            createdAt: DateTime.now(),
          ),
        );
        return const Right(amount);
      case 'mission-streak7d':
        const amount = 50.0;
        _balance += amount;
        _streak7dRewarded = true;
        _history.add(
          TokenTransaction(
            id: 'tx-${Random().nextInt(99999)}',
            userId: _userId,
            type: TokenTransactionType.credit,
            amount: amount,
            reason: 'Missão: Streak de 7 dias',
            createdAt: DateTime.now(),
          ),
        );
        return const Right(amount);
      default:
        return const Left(
          Failure.server(statusCode: 404, message: 'Missão não encontrada.'),
        );
    }
  }
}
