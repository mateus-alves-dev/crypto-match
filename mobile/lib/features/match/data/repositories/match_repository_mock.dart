import 'dart:math';

import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/match/domain/entities/match.dart';
import 'package:crypto_match/features/match/domain/entities/swipe_result.dart';
import 'package:crypto_match/features/match/domain/repositories/match_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MatchRepository)
class MockMatchRepositoryImpl implements MatchRepository {
  final _random = Random();

  static final List<MatchSuggestion> _mockProfiles = [
    const MatchSuggestion(
      userId: 'mock-1',
      name: 'Camila Souza',
      avatarUrl: 'https://i.pravatar.cc/400?img=47',
      bio:
          'Bitcoin maximalist ₿ · Day trader há 4 anos · Acredito na descentralização.',
      age: 27,
      cryptoInterests: ['Bitcoin', 'Lightning Network', 'Self-custody'],
    ),
    const MatchSuggestion(
      userId: 'mock-2',
      name: 'Rafael Lima',
      avatarUrl: 'https://i.pravatar.cc/400?img=11',
      bio: 'DeFi nerd · Dev Solidity · "Not your keys, not your coins."',
      age: 30,
      cryptoInterests: ['Ethereum', 'DeFi', 'NFTs', 'Solidity'],
    ),
    const MatchSuggestion(
      userId: 'mock-3',
      name: 'Isabela Torres',
      avatarUrl: 'https://i.pravatar.cc/400?img=45',
      bio:
          'Web3 designer · Interfaces para o futuro descentralizado · Arte generativa on-chain.',
      age: 25,
      cryptoInterests: ['Ethereum', 'NFTs', 'Generative Art', 'Base'],
    ),
    const MatchSuggestion(
      userId: 'mock-4',
      name: 'Pedro Henrique',
      avatarUrl: 'https://i.pravatar.cc/400?img=12',
      bio:
          'Altcoin explorer · Research analyst · Falo de tokenomics no jantar.',
      age: 29,
      cryptoInterests: ['Solana', 'Avalanche', 'Polkadot', 'Cosmos'],
    ),
    const MatchSuggestion(
      userId: 'mock-5',
      name: 'Larissa Mendes',
      avatarUrl: 'https://i.pravatar.cc/400?img=44',
      bio: 'Crypto trader · Portfolio: 60% BTC, 40% caos organizado.',
      age: 26,
      cryptoInterests: ['Bitcoin', 'Ethereum', 'Trading', 'On-chain analysis'],
    ),
    const MatchSuggestion(
      userId: 'mock-6',
      name: 'Lucas Ferreira',
      avatarUrl: 'https://i.pravatar.cc/400?img=13',
      bio: 'Layer 2 enjoyer · Engenheiro de infra · ETH vai escalar!',
      age: 31,
      cryptoInterests: ['Ethereum', 'Optimism', 'Arbitrum', 'ZK Rollups'],
    ),
    const MatchSuggestion(
      userId: 'mock-7',
      name: 'Mariana Costa',
      avatarUrl: 'https://i.pravatar.cc/400?img=48',
      bio: 'Economista que virou DeFi degen · Acumulo SATs todo mes.',
      age: 28,
      cryptoInterests: ['Bitcoin', 'Stablecoins', 'DeFi', 'Lightning Network'],
    ),
    const MatchSuggestion(
      userId: 'mock-8',
      name: 'Gabriel Santos',
      avatarUrl: 'https://i.pravatar.cc/400?img=15',
      bio: 'NFT artist & collector · Buscando alguem que entenda DAOs.',
      age: 24,
      cryptoInterests: ['Ethereum', 'NFTs', 'DAOs', 'Creator Economy'],
    ),
  ];

  @override
  Future<Either<Failure, List<MatchSuggestion>>> getFeed() async {
    await Future<void>.delayed(const Duration(milliseconds: 800));
    return Right(List.from(_mockProfiles));
  }

  @override
  Future<Either<Failure, SwipeResult>> swipe({
    required String targetUserId,
    required SwipeAction action,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (action != SwipeAction.dislike && _random.nextDouble() < 0.30) {
      final profile = _mockProfiles.firstWhere(
        (p) => p.userId == targetUserId,
        orElse: () => _mockProfiles.first,
      );
      return Right(
        SwipeResult(
          match: Match(
            id: 'match-${DateTime.now().millisecondsSinceEpoch}',
            userId: 'current-user',
            matchedUserId: targetUserId,
            matchedUserName: profile.name,
            matchedUserAvatarUrl: profile.avatarUrl,
            matchedAt: DateTime.now(),
          ),
        ),
      );
    }
    return const Right(SwipeResult());
  }

  static final List<Match> _mockMatches = [
    Match(
      id: 'match-001',
      userId: 'current-user',
      matchedUserId: 'mock-1',
      matchedUserName: 'Camila Souza',
      matchedUserAvatarUrl: 'https://i.pravatar.cc/400?img=47',
      matchedUserBio:
          'Bitcoin maximalist ₿ · Day trader há 4 anos · Acredito na descentralização.',
      matchedAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    Match(
      id: 'match-002',
      userId: 'current-user',
      matchedUserId: 'mock-2',
      matchedUserName: 'Rafael Lima',
      matchedUserAvatarUrl: 'https://i.pravatar.cc/400?img=11',
      matchedUserBio:
          'DeFi nerd · Dev Solidity · "Not your keys, not your coins."',
      matchedAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Match(
      id: 'match-003',
      userId: 'current-user',
      matchedUserId: 'mock-3',
      matchedUserName: 'Isabela Torres',
      matchedUserAvatarUrl: 'https://i.pravatar.cc/400?img=45',
      matchedUserBio:
          'Web3 designer · Interfaces para o futuro descentralizado · Arte generativa on-chain.',
      matchedAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
  ];

  @override
  Future<Either<Failure, List<Match>>> getMatches() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return Right(List.from(_mockMatches));
  }
}
