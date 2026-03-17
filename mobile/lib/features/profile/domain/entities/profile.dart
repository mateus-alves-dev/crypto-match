import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    required String userId,
    required String displayName,
    required DateTime updatedAt,
    String? bio,
    String? avatarUrl,
    List<String>? cryptoInterests,
    List<String>? personaTags,
    int? age,
    String? location,
    List<String>? badges,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
