// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TokenAction {
  String get id;
  TokenActionType get type;
  String get title;
  String get description;
  double get reward;
  bool get isAvailable;
  DateTime? get nextAvailableAt;
  DateTime? get completedAt;

  /// Create a copy of TokenAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TokenActionCopyWith<TokenAction> get copyWith =>
      _$TokenActionCopyWithImpl<TokenAction>(this as TokenAction, _$identity);

  /// Serializes this TokenAction to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TokenAction &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.reward, reward) || other.reward == reward) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.nextAvailableAt, nextAvailableAt) ||
                other.nextAvailableAt == nextAvailableAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, title, description,
      reward, isAvailable, nextAvailableAt, completedAt);

  @override
  String toString() {
    return 'TokenAction(id: $id, type: $type, title: $title, description: $description, reward: $reward, isAvailable: $isAvailable, nextAvailableAt: $nextAvailableAt, completedAt: $completedAt)';
  }
}

/// @nodoc
abstract mixin class $TokenActionCopyWith<$Res> {
  factory $TokenActionCopyWith(
          TokenAction value, $Res Function(TokenAction) _then) =
      _$TokenActionCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      TokenActionType type,
      String title,
      String description,
      double reward,
      bool isAvailable,
      DateTime? nextAvailableAt,
      DateTime? completedAt});
}

/// @nodoc
class _$TokenActionCopyWithImpl<$Res> implements $TokenActionCopyWith<$Res> {
  _$TokenActionCopyWithImpl(this._self, this._then);

  final TokenAction _self;
  final $Res Function(TokenAction) _then;

  /// Create a copy of TokenAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? reward = null,
    Object? isAvailable = null,
    Object? nextAvailableAt = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as TokenActionType,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      reward: null == reward
          ? _self.reward
          : reward // ignore: cast_nullable_to_non_nullable
              as double,
      isAvailable: null == isAvailable
          ? _self.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      nextAvailableAt: freezed == nextAvailableAt
          ? _self.nextAvailableAt
          : nextAvailableAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [TokenAction].
extension TokenActionPatterns on TokenAction {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TokenAction value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TokenAction() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TokenAction value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TokenAction():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TokenAction value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TokenAction() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            TokenActionType type,
            String title,
            String description,
            double reward,
            bool isAvailable,
            DateTime? nextAvailableAt,
            DateTime? completedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TokenAction() when $default != null:
        return $default(
            _that.id,
            _that.type,
            _that.title,
            _that.description,
            _that.reward,
            _that.isAvailable,
            _that.nextAvailableAt,
            _that.completedAt);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            TokenActionType type,
            String title,
            String description,
            double reward,
            bool isAvailable,
            DateTime? nextAvailableAt,
            DateTime? completedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TokenAction():
        return $default(
            _that.id,
            _that.type,
            _that.title,
            _that.description,
            _that.reward,
            _that.isAvailable,
            _that.nextAvailableAt,
            _that.completedAt);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            TokenActionType type,
            String title,
            String description,
            double reward,
            bool isAvailable,
            DateTime? nextAvailableAt,
            DateTime? completedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TokenAction() when $default != null:
        return $default(
            _that.id,
            _that.type,
            _that.title,
            _that.description,
            _that.reward,
            _that.isAvailable,
            _that.nextAvailableAt,
            _that.completedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TokenAction implements TokenAction {
  const _TokenAction(
      {required this.id,
      required this.type,
      required this.title,
      required this.description,
      required this.reward,
      required this.isAvailable,
      this.nextAvailableAt,
      this.completedAt});
  factory _TokenAction.fromJson(Map<String, dynamic> json) =>
      _$TokenActionFromJson(json);

  @override
  final String id;
  @override
  final TokenActionType type;
  @override
  final String title;
  @override
  final String description;
  @override
  final double reward;
  @override
  final bool isAvailable;
  @override
  final DateTime? nextAvailableAt;
  @override
  final DateTime? completedAt;

  /// Create a copy of TokenAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TokenActionCopyWith<_TokenAction> get copyWith =>
      __$TokenActionCopyWithImpl<_TokenAction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TokenActionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TokenAction &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.reward, reward) || other.reward == reward) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.nextAvailableAt, nextAvailableAt) ||
                other.nextAvailableAt == nextAvailableAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, title, description,
      reward, isAvailable, nextAvailableAt, completedAt);

  @override
  String toString() {
    return 'TokenAction(id: $id, type: $type, title: $title, description: $description, reward: $reward, isAvailable: $isAvailable, nextAvailableAt: $nextAvailableAt, completedAt: $completedAt)';
  }
}

/// @nodoc
abstract mixin class _$TokenActionCopyWith<$Res>
    implements $TokenActionCopyWith<$Res> {
  factory _$TokenActionCopyWith(
          _TokenAction value, $Res Function(_TokenAction) _then) =
      __$TokenActionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      TokenActionType type,
      String title,
      String description,
      double reward,
      bool isAvailable,
      DateTime? nextAvailableAt,
      DateTime? completedAt});
}

/// @nodoc
class __$TokenActionCopyWithImpl<$Res> implements _$TokenActionCopyWith<$Res> {
  __$TokenActionCopyWithImpl(this._self, this._then);

  final _TokenAction _self;
  final $Res Function(_TokenAction) _then;

  /// Create a copy of TokenAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? reward = null,
    Object? isAvailable = null,
    Object? nextAvailableAt = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_TokenAction(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as TokenActionType,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      reward: null == reward
          ? _self.reward
          : reward // ignore: cast_nullable_to_non_nullable
              as double,
      isAvailable: null == isAvailable
          ? _self.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      nextAvailableAt: freezed == nextAvailableAt
          ? _self.nextAvailableAt
          : nextAvailableAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
