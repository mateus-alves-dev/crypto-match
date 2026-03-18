// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_mission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyMission {

 String get id; DailyMissionType get type; String get title; String get description; double get reward; int get progress; int get target; bool get isCompleted; bool get isRewarded; DateTime get resetsAt;
/// Create a copy of DailyMission
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyMissionCopyWith<DailyMission> get copyWith => _$DailyMissionCopyWithImpl<DailyMission>(this as DailyMission, _$identity);

  /// Serializes this DailyMission to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyMission&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.reward, reward) || other.reward == reward)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.target, target) || other.target == target)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.isRewarded, isRewarded) || other.isRewarded == isRewarded)&&(identical(other.resetsAt, resetsAt) || other.resetsAt == resetsAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,description,reward,progress,target,isCompleted,isRewarded,resetsAt);

@override
String toString() {
  return 'DailyMission(id: $id, type: $type, title: $title, description: $description, reward: $reward, progress: $progress, target: $target, isCompleted: $isCompleted, isRewarded: $isRewarded, resetsAt: $resetsAt)';
}


}

/// @nodoc
abstract mixin class $DailyMissionCopyWith<$Res>  {
  factory $DailyMissionCopyWith(DailyMission value, $Res Function(DailyMission) _then) = _$DailyMissionCopyWithImpl;
@useResult
$Res call({
 String id, DailyMissionType type, String title, String description, double reward, int progress, int target, bool isCompleted, bool isRewarded, DateTime resetsAt
});




}
/// @nodoc
class _$DailyMissionCopyWithImpl<$Res>
    implements $DailyMissionCopyWith<$Res> {
  _$DailyMissionCopyWithImpl(this._self, this._then);

  final DailyMission _self;
  final $Res Function(DailyMission) _then;

/// Create a copy of DailyMission
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? title = null,Object? description = null,Object? reward = null,Object? progress = null,Object? target = null,Object? isCompleted = null,Object? isRewarded = null,Object? resetsAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DailyMissionType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,reward: null == reward ? _self.reward : reward // ignore: cast_nullable_to_non_nullable
as double,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,isRewarded: null == isRewarded ? _self.isRewarded : isRewarded // ignore: cast_nullable_to_non_nullable
as bool,resetsAt: null == resetsAt ? _self.resetsAt : resetsAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyMission].
extension DailyMissionPatterns on DailyMission {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyMission value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyMission() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyMission value)  $default,){
final _that = this;
switch (_that) {
case _DailyMission():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyMission value)?  $default,){
final _that = this;
switch (_that) {
case _DailyMission() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DailyMissionType type,  String title,  String description,  double reward,  int progress,  int target,  bool isCompleted,  bool isRewarded,  DateTime resetsAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyMission() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.description,_that.reward,_that.progress,_that.target,_that.isCompleted,_that.isRewarded,_that.resetsAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DailyMissionType type,  String title,  String description,  double reward,  int progress,  int target,  bool isCompleted,  bool isRewarded,  DateTime resetsAt)  $default,) {final _that = this;
switch (_that) {
case _DailyMission():
return $default(_that.id,_that.type,_that.title,_that.description,_that.reward,_that.progress,_that.target,_that.isCompleted,_that.isRewarded,_that.resetsAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DailyMissionType type,  String title,  String description,  double reward,  int progress,  int target,  bool isCompleted,  bool isRewarded,  DateTime resetsAt)?  $default,) {final _that = this;
switch (_that) {
case _DailyMission() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.description,_that.reward,_that.progress,_that.target,_that.isCompleted,_that.isRewarded,_that.resetsAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyMission implements DailyMission {
  const _DailyMission({required this.id, required this.type, required this.title, required this.description, required this.reward, required this.progress, required this.target, required this.isCompleted, required this.isRewarded, required this.resetsAt});
  factory _DailyMission.fromJson(Map<String, dynamic> json) => _$DailyMissionFromJson(json);

@override final  String id;
@override final  DailyMissionType type;
@override final  String title;
@override final  String description;
@override final  double reward;
@override final  int progress;
@override final  int target;
@override final  bool isCompleted;
@override final  bool isRewarded;
@override final  DateTime resetsAt;

/// Create a copy of DailyMission
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyMissionCopyWith<_DailyMission> get copyWith => __$DailyMissionCopyWithImpl<_DailyMission>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyMissionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyMission&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.reward, reward) || other.reward == reward)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.target, target) || other.target == target)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.isRewarded, isRewarded) || other.isRewarded == isRewarded)&&(identical(other.resetsAt, resetsAt) || other.resetsAt == resetsAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,description,reward,progress,target,isCompleted,isRewarded,resetsAt);

@override
String toString() {
  return 'DailyMission(id: $id, type: $type, title: $title, description: $description, reward: $reward, progress: $progress, target: $target, isCompleted: $isCompleted, isRewarded: $isRewarded, resetsAt: $resetsAt)';
}


}

/// @nodoc
abstract mixin class _$DailyMissionCopyWith<$Res> implements $DailyMissionCopyWith<$Res> {
  factory _$DailyMissionCopyWith(_DailyMission value, $Res Function(_DailyMission) _then) = __$DailyMissionCopyWithImpl;
@override @useResult
$Res call({
 String id, DailyMissionType type, String title, String description, double reward, int progress, int target, bool isCompleted, bool isRewarded, DateTime resetsAt
});




}
/// @nodoc
class __$DailyMissionCopyWithImpl<$Res>
    implements _$DailyMissionCopyWith<$Res> {
  __$DailyMissionCopyWithImpl(this._self, this._then);

  final _DailyMission _self;
  final $Res Function(_DailyMission) _then;

/// Create a copy of DailyMission
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? title = null,Object? description = null,Object? reward = null,Object? progress = null,Object? target = null,Object? isCompleted = null,Object? isRewarded = null,Object? resetsAt = null,}) {
  return _then(_DailyMission(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DailyMissionType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,reward: null == reward ? _self.reward : reward // ignore: cast_nullable_to_non_nullable
as double,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,isRewarded: null == isRewarded ? _self.isRewarded : isRewarded // ignore: cast_nullable_to_non_nullable
as bool,resetsAt: null == resetsAt ? _self.resetsAt : resetsAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
