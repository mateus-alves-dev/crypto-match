import 'package:crypto_match/core/error/failure.dart';
import 'package:crypto_match/features/profile/domain/entities/profile.dart';
import 'package:crypto_match/features/profile/domain/repositories/avatar_repository.dart';
import 'package:crypto_match/features/profile/domain/use_cases/profile_use_cases.dart';
import 'package:crypto_match/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._getProfile, this._updateProfile, this._avatarRepository)
    : super(const ProfileState.initial());

  final GetMyProfileUseCase _getProfile;
  final UpdateMyProfileUseCase _updateProfile;
  final AvatarRepository _avatarRepository;

  String _failureMessage(Failure failure) => failure.when(
    server: (_, String message) => message,
    network: (String message) => message,
    unauthorized: () => 'Não autorizado',
    notFound: () => 'Perfil não encontrado',
    unknown: (String message) => message,
  );

  Future<void> loadProfile() async {
    emit(const ProfileState.loading());
    final result = await _getProfile();
    result.fold(
      (failure) =>
          emit(ProfileState.failure(message: _failureMessage(failure))),
      (profile) => emit(ProfileState.loaded(profile: profile)),
    );
  }

  Future<void> updateProfile({
    String? displayName,
    String? bio,
    List<String>? cryptoInterests,
    List<String>? personaTags,
    int? age,
    String? location,
    String? avatarUrl,
  }) async {
    final current = state.mapOrNull(
      loaded: (s) => s.profile,
      uploadingAvatar: (s) => s.profile,
      updateSuccess: (s) => s.profile,
    );
    if (current == null) return;

    emit(ProfileState.updating(profile: current));
    final result = await _updateProfile(
      displayName: displayName,
      bio: bio,
      cryptoInterests: cryptoInterests,
      personaTags: personaTags,
      age: age,
      location: location,
      avatarUrl: avatarUrl,
    );
    result.fold(
      (failure) =>
          emit(ProfileState.failure(message: _failureMessage(failure))),
      (profile) => emit(ProfileState.updateSuccess(profile: profile)),
    );
  }

  /// Optionally uploads [avatarFile] first, then saves profile fields.
  /// Emits [ProfileState.uploadingAvatar] while the upload is in progress.
  Future<void> uploadAndSaveProfile({
    XFile? avatarFile,
    String? displayName,
    String? bio,
    List<String>? cryptoInterests,
    List<String>? personaTags,
    int? age,
    String? location,
  }) async {
    final current = state.mapOrNull(
      loaded: (s) => s.profile,
      updateSuccess: (s) => s.profile,
    );
    if (current == null) return;

    String? uploadedUrl;

    if (avatarFile != null) {
      emit(ProfileState.uploadingAvatar(profile: current));
      final uploadResult = await _avatarRepository.uploadAvatar(
        avatarFile,
        current.userId,
      );
      final failure = uploadResult.fold<Failure?>((f) => f, (_) => null);
      if (failure != null) {
        emit(ProfileState.failure(message: _failureMessage(failure)));
        return;
      }
      uploadedUrl = uploadResult.getOrElse(() => '');
    }

    await updateProfile(
      displayName: displayName,
      bio: bio,
      cryptoInterests: cryptoInterests,
      personaTags: personaTags,
      age: age,
      location: location,
      avatarUrl: uploadedUrl,
    );
  }

  Profile? get currentProfile => state.mapOrNull(
    loaded: (s) => s.profile,
    updating: (s) => s.profile,
    uploadingAvatar: (s) => s.profile,
    updateSuccess: (s) => s.profile,
  );
}
