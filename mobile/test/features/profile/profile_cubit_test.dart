import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/profile/domain/entities/profile.dart';
import 'package:crypto_match/features/profile/domain/repositories/avatar_repository.dart';
import 'package:crypto_match/features/profile/domain/use_cases/profile_use_cases.dart';
import 'package:crypto_match/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:crypto_match/features/profile/presentation/cubit/profile_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';

// ---------------------------------------------------------------------------
// Mocks
// ---------------------------------------------------------------------------

class MockGetMyProfileUseCase extends Mock implements GetMyProfileUseCase {}

class MockUpdateMyProfileUseCase extends Mock
    implements UpdateMyProfileUseCase {}

class MockAvatarRepository extends Mock implements AvatarRepository {}

// ---------------------------------------------------------------------------
// Fake data helpers
// ---------------------------------------------------------------------------

Profile _profile({String? avatarUrl}) => Profile(
  userId: 'user-1',
  displayName: 'Satoshi',
  updatedAt: DateTime(2026, 3, 18),
  avatarUrl: avatarUrl,
);

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  late MockGetMyProfileUseCase mockGetProfile;
  late MockUpdateMyProfileUseCase mockUpdateProfile;
  late MockAvatarRepository mockAvatarRepo;

  setUpAll(() {
    registerFallbackValue(XFile('/fallback.jpg'));
  });

  setUp(() {
    mockGetProfile = MockGetMyProfileUseCase();
    mockUpdateProfile = MockUpdateMyProfileUseCase();
    mockAvatarRepo = MockAvatarRepository();
  });

  ProfileCubit buildCubit() =>
      ProfileCubit(mockGetProfile, mockUpdateProfile, mockAvatarRepo);

  // Convenience: stub updateProfile to succeed with a given profile.
  void stubUpdateSuccess({Profile? returns}) {
    when(
      () => mockUpdateProfile(
        displayName: any(named: 'displayName'),
        bio: any(named: 'bio'),
        cryptoInterests: any(named: 'cryptoInterests'),
        personaTags: any(named: 'personaTags'),
        age: any(named: 'age'),
        location: any(named: 'location'),
        avatarUrl: any(named: 'avatarUrl'),
      ),
    ).thenAnswer((_) async => Right(returns ?? _profile()));
  }

  group('ProfileCubit', () {
    // -----------------------------------------------------------------------
    // loadProfile
    // -----------------------------------------------------------------------
    group('loadProfile', () {
      blocTest<ProfileCubit, ProfileState>(
        'emits [loading, loaded] when use-case succeeds',
        setUp: () => when(
          mockGetProfile.call,
        ).thenAnswer((_) async => Right(_profile())),
        build: buildCubit,
        act: (cubit) => cubit.loadProfile(),
        expect: () => [
          const ProfileState.loading(),
          ProfileState.loaded(profile: _profile()),
        ],
      );

      blocTest<ProfileCubit, ProfileState>(
        'emits [loading, failure] when use-case returns NetworkFailure',
        setUp: () => when(mockGetProfile.call).thenAnswer(
          (_) async =>
              const Left(Failure.network(message: 'Sem conexão com internet')),
        ),
        build: buildCubit,
        act: (cubit) => cubit.loadProfile(),
        expect: () => [
          const ProfileState.loading(),
          const ProfileState.failure(message: 'Sem conexão com internet'),
        ],
      );
    });

    // -----------------------------------------------------------------------
    // uploadAndSaveProfile — no avatar file (regression)
    // -----------------------------------------------------------------------
    group('uploadAndSaveProfile without avatar', () {
      blocTest<ProfileCubit, ProfileState>(
        'emits [updating, updateSuccess] when no avatar file provided',
        seed: () => ProfileState.loaded(profile: _profile()),
        setUp: stubUpdateSuccess,
        build: buildCubit,
        act: (cubit) => cubit.uploadAndSaveProfile(displayName: 'Satoshi'),
        expect: () => [
          ProfileState.updating(profile: _profile()),
          ProfileState.updateSuccess(profile: _profile()),
        ],
        verify: (_) =>
            verifyNever(() => mockAvatarRepo.uploadAvatar(any(), any())),
      );

      blocTest<ProfileCubit, ProfileState>(
        'emits [updating, failure] when backend update fails with no avatar',
        seed: () => ProfileState.loaded(profile: _profile()),
        setUp: () {
          when(
            () => mockUpdateProfile(
              displayName: any(named: 'displayName'),
              bio: any(named: 'bio'),
              cryptoInterests: any(named: 'cryptoInterests'),
              personaTags: any(named: 'personaTags'),
              age: any(named: 'age'),
              location: any(named: 'location'),
              avatarUrl: any(named: 'avatarUrl'),
            ),
          ).thenAnswer(
            (_) async => const Left(Failure.network(message: 'Timeout')),
          );
        },
        build: buildCubit,
        act: (cubit) => cubit.uploadAndSaveProfile(displayName: 'Satoshi'),
        expect: () => [
          ProfileState.updating(profile: _profile()),
          const ProfileState.failure(message: 'Timeout'),
        ],
      );
    });

    // -----------------------------------------------------------------------
    // uploadAndSaveProfile — with avatar file
    // -----------------------------------------------------------------------
    group('uploadAndSaveProfile with avatar file', () {
      final fakeFile = XFile('/tmp/photo.jpg');
      final profileWithAvatar = _profile(
        avatarUrl: 'https://cdn.example.com/avatar.jpg',
      );

      blocTest<ProfileCubit, ProfileState>(
        'emits [uploadingAvatar, updating, updateSuccess] on happy path',
        seed: () => ProfileState.loaded(profile: _profile()),
        setUp: () {
          when(() => mockAvatarRepo.uploadAvatar(any(), any())).thenAnswer(
            (_) async => const Right('https://cdn.example.com/avatar.jpg'),
          );
          stubUpdateSuccess(returns: profileWithAvatar);
        },
        build: buildCubit,
        act: (cubit) => cubit.uploadAndSaveProfile(
          avatarFile: fakeFile,
          displayName: 'Satoshi',
        ),
        expect: () => [
          ProfileState.uploadingAvatar(profile: _profile()),
          ProfileState.updating(profile: _profile()),
          ProfileState.updateSuccess(profile: profileWithAvatar),
        ],
        verify: (_) {
          verify(
            () => mockAvatarRepo.uploadAvatar(fakeFile, 'user-1'),
          ).called(1);
        },
      );

      blocTest<ProfileCubit, ProfileState>(
        'emits [uploadingAvatar, failure] when Firebase upload fails',
        seed: () => ProfileState.loaded(profile: _profile()),
        setUp: () {
          when(() => mockAvatarRepo.uploadAvatar(any(), any())).thenAnswer(
            (_) async =>
                const Left(Failure.unknown(message: 'Falha ao enviar a foto.')),
          );
        },
        build: buildCubit,
        act: (cubit) => cubit.uploadAndSaveProfile(
          avatarFile: fakeFile,
          displayName: 'Satoshi',
        ),
        expect: () => [
          ProfileState.uploadingAvatar(profile: _profile()),
          const ProfileState.failure(message: 'Falha ao enviar a foto.'),
        ],
        verify: (_) => verifyNever(
          () => mockUpdateProfile(
            displayName: any(named: 'displayName'),
            bio: any(named: 'bio'),
            cryptoInterests: any(named: 'cryptoInterests'),
            personaTags: any(named: 'personaTags'),
            age: any(named: 'age'),
            location: any(named: 'location'),
            avatarUrl: any(named: 'avatarUrl'),
          ),
        ),
      );

      blocTest<ProfileCubit, ProfileState>(
        'emits [uploadingAvatar, updating, failure] when backend update fails after upload',
        seed: () => ProfileState.loaded(profile: _profile()),
        setUp: () {
          when(() => mockAvatarRepo.uploadAvatar(any(), any())).thenAnswer(
            (_) async => const Right('https://cdn.example.com/avatar.jpg'),
          );
          when(
            () => mockUpdateProfile(
              displayName: any(named: 'displayName'),
              bio: any(named: 'bio'),
              cryptoInterests: any(named: 'cryptoInterests'),
              personaTags: any(named: 'personaTags'),
              age: any(named: 'age'),
              location: any(named: 'location'),
              avatarUrl: any(named: 'avatarUrl'),
            ),
          ).thenAnswer(
            (_) async => const Left(
              Failure.server(statusCode: 500, message: 'Erro interno'),
            ),
          );
        },
        build: buildCubit,
        act: (cubit) => cubit.uploadAndSaveProfile(
          avatarFile: fakeFile,
          displayName: 'Satoshi',
        ),
        expect: () => [
          ProfileState.uploadingAvatar(profile: _profile()),
          ProfileState.updating(profile: _profile()),
          const ProfileState.failure(message: 'Erro interno'),
        ],
      );

      blocTest<ProfileCubit, ProfileState>(
        'does nothing when state is not loaded or updateSuccess',
        build: buildCubit,
        // state is initial — no current profile
        act: (cubit) => cubit.uploadAndSaveProfile(avatarFile: fakeFile),
        expect: () => <ProfileState>[],
        verify: (_) {
          verifyNever(() => mockAvatarRepo.uploadAvatar(any(), any()));
          verifyNever(
            () => mockUpdateProfile(
              displayName: any(named: 'displayName'),
              bio: any(named: 'bio'),
              cryptoInterests: any(named: 'cryptoInterests'),
              personaTags: any(named: 'personaTags'),
              age: any(named: 'age'),
              location: any(named: 'location'),
              avatarUrl: any(named: 'avatarUrl'),
            ),
          );
        },
      );
    });
  });
}
