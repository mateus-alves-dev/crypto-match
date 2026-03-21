import 'package:crypto_match/core/feature_flags/feature_flags_service.dart';
import 'package:crypto_match/core/feature_flags/feature_flags_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FeatureFlagsCubit extends Cubit<FeatureFlagsState> {
  FeatureFlagsCubit(this._service) : super(const FeatureFlagsState.initial());

  final FeatureFlagsService _service;

  Future<void> loadFlags() async {
    emit(const FeatureFlagsState.loading());
    try {
      await _service.fetchAndActivate();
    } catch (_) {
      // Silently fall back to local defaults – app must still be usable offline
    }
    emit(
      FeatureFlagsState.loaded(
        enableEmailLogin: _service.enableEmailLogin,
        enableGoogleLogin: _service.enableGoogleLogin,
      ),
    );
  }
}
