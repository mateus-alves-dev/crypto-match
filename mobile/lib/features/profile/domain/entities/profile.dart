import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    required String userId,
    required String displayName,
    required DateTime updatedAt,
    String? bio,
    String? avatarUrl,
    List<String>? cryptoInterests,
    int? age,
    String? location,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
