// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsState()';
}


}

/// @nodoc
class $SettingsStateCopyWith<$Res>  {
$SettingsStateCopyWith(SettingsState _, $Res Function(SettingsState) __);
}


/// Adds pattern-matching-related methods to [SettingsState].
extension SettingsStatePatterns on SettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Updating value)?  updating,TResult Function( _UpdateSuccess value)?  updateSuccess,TResult Function( _Failure value)?  failure,TResult Function( _AccountDeleted value)?  accountDeleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Updating() when updating != null:
return updating(_that);case _UpdateSuccess() when updateSuccess != null:
return updateSuccess(_that);case _Failure() when failure != null:
return failure(_that);case _AccountDeleted() when accountDeleted != null:
return accountDeleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Updating value)  updating,required TResult Function( _UpdateSuccess value)  updateSuccess,required TResult Function( _Failure value)  failure,required TResult Function( _AccountDeleted value)  accountDeleted,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Updating():
return updating(_that);case _UpdateSuccess():
return updateSuccess(_that);case _Failure():
return failure(_that);case _AccountDeleted():
return accountDeleted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Updating value)?  updating,TResult? Function( _UpdateSuccess value)?  updateSuccess,TResult? Function( _Failure value)?  failure,TResult? Function( _AccountDeleted value)?  accountDeleted,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Updating() when updating != null:
return updating(_that);case _UpdateSuccess() when updateSuccess != null:
return updateSuccess(_that);case _Failure() when failure != null:
return failure(_that);case _AccountDeleted() when accountDeleted != null:
return accountDeleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( UserSettings settings)?  loaded,TResult Function( UserSettings settings)?  updating,TResult Function( UserSettings settings)?  updateSuccess,TResult Function( String message)?  failure,TResult Function()?  accountDeleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.settings);case _Updating() when updating != null:
return updating(_that.settings);case _UpdateSuccess() when updateSuccess != null:
return updateSuccess(_that.settings);case _Failure() when failure != null:
return failure(_that.message);case _AccountDeleted() when accountDeleted != null:
return accountDeleted();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( UserSettings settings)  loaded,required TResult Function( UserSettings settings)  updating,required TResult Function( UserSettings settings)  updateSuccess,required TResult Function( String message)  failure,required TResult Function()  accountDeleted,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.settings);case _Updating():
return updating(_that.settings);case _UpdateSuccess():
return updateSuccess(_that.settings);case _Failure():
return failure(_that.message);case _AccountDeleted():
return accountDeleted();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( UserSettings settings)?  loaded,TResult? Function( UserSettings settings)?  updating,TResult? Function( UserSettings settings)?  updateSuccess,TResult? Function( String message)?  failure,TResult? Function()?  accountDeleted,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.settings);case _Updating() when updating != null:
return updating(_that.settings);case _UpdateSuccess() when updateSuccess != null:
return updateSuccess(_that.settings);case _Failure() when failure != null:
return failure(_that.message);case _AccountDeleted() when accountDeleted != null:
return accountDeleted();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SettingsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsState.initial()';
}


}




/// @nodoc


class _Loading implements SettingsState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsState.loading()';
}


}




/// @nodoc


class _Loaded implements SettingsState {
  const _Loaded({required this.settings});
  

 final  UserSettings settings;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.settings, settings) || other.settings == settings));
}


@override
int get hashCode => Object.hash(runtimeType,settings);

@override
String toString() {
  return 'SettingsState.loaded(settings: $settings)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 UserSettings settings
});


$UserSettingsCopyWith<$Res> get settings;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? settings = null,}) {
  return _then(_Loaded(
settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as UserSettings,
  ));
}

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSettingsCopyWith<$Res> get settings {
  
  return $UserSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}

/// @nodoc


class _Updating implements SettingsState {
  const _Updating({required this.settings});
  

 final  UserSettings settings;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatingCopyWith<_Updating> get copyWith => __$UpdatingCopyWithImpl<_Updating>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Updating&&(identical(other.settings, settings) || other.settings == settings));
}


@override
int get hashCode => Object.hash(runtimeType,settings);

@override
String toString() {
  return 'SettingsState.updating(settings: $settings)';
}


}

/// @nodoc
abstract mixin class _$UpdatingCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory _$UpdatingCopyWith(_Updating value, $Res Function(_Updating) _then) = __$UpdatingCopyWithImpl;
@useResult
$Res call({
 UserSettings settings
});


$UserSettingsCopyWith<$Res> get settings;

}
/// @nodoc
class __$UpdatingCopyWithImpl<$Res>
    implements _$UpdatingCopyWith<$Res> {
  __$UpdatingCopyWithImpl(this._self, this._then);

  final _Updating _self;
  final $Res Function(_Updating) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? settings = null,}) {
  return _then(_Updating(
settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as UserSettings,
  ));
}

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSettingsCopyWith<$Res> get settings {
  
  return $UserSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}

/// @nodoc


class _UpdateSuccess implements SettingsState {
  const _UpdateSuccess({required this.settings});
  

 final  UserSettings settings;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSuccessCopyWith<_UpdateSuccess> get copyWith => __$UpdateSuccessCopyWithImpl<_UpdateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSuccess&&(identical(other.settings, settings) || other.settings == settings));
}


@override
int get hashCode => Object.hash(runtimeType,settings);

@override
String toString() {
  return 'SettingsState.updateSuccess(settings: $settings)';
}


}

/// @nodoc
abstract mixin class _$UpdateSuccessCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory _$UpdateSuccessCopyWith(_UpdateSuccess value, $Res Function(_UpdateSuccess) _then) = __$UpdateSuccessCopyWithImpl;
@useResult
$Res call({
 UserSettings settings
});


$UserSettingsCopyWith<$Res> get settings;

}
/// @nodoc
class __$UpdateSuccessCopyWithImpl<$Res>
    implements _$UpdateSuccessCopyWith<$Res> {
  __$UpdateSuccessCopyWithImpl(this._self, this._then);

  final _UpdateSuccess _self;
  final $Res Function(_UpdateSuccess) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? settings = null,}) {
  return _then(_UpdateSuccess(
settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as UserSettings,
  ));
}

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSettingsCopyWith<$Res> get settings {
  
  return $UserSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}

/// @nodoc


class _Failure implements SettingsState {
  const _Failure({required this.message});
  

 final  String message;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SettingsState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AccountDeleted implements SettingsState {
  const _AccountDeleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountDeleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsState.accountDeleted()';
}


}




// dart format on
