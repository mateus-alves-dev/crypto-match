// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messages_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessagesState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MessagesState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MessagesState()';
  }
}

/// @nodoc
class $MessagesStateCopyWith<$Res> {
  $MessagesStateCopyWith(MessagesState _, $Res Function(MessagesState) __);
}

/// Adds pattern-matching-related methods to [MessagesState].
extension MessagesStatePatterns on MessagesState {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Sending value)? sending,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _Sending() when sending != null:
        return sending(_that);
      case _Failure() when failure != null:
        return failure(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Failure value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Loaded():
        return loaded(_that);
      case _Sending():
        return sending(_that);
      case _Failure():
        return failure(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Failure value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _Sending() when sending != null:
        return sending(_that);
      case _Failure() when failure != null:
        return failure(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Conversation conversation, List<Message> messages)? loaded,
    TResult Function(Conversation conversation, List<Message> messages)?
        sending,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Loaded() when loaded != null:
        return loaded(_that.conversation, _that.messages);
      case _Sending() when sending != null:
        return sending(_that.conversation, _that.messages);
      case _Failure() when failure != null:
        return failure(_that.message);
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
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Conversation conversation, List<Message> messages)
        loaded,
    required TResult Function(Conversation conversation, List<Message> messages)
        sending,
    required TResult Function(String message) failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Loaded():
        return loaded(_that.conversation, _that.messages);
      case _Sending():
        return sending(_that.conversation, _that.messages);
      case _Failure():
        return failure(_that.message);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Conversation conversation, List<Message> messages)?
        loaded,
    TResult? Function(Conversation conversation, List<Message> messages)?
        sending,
    TResult? Function(String message)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Loaded() when loaded != null:
        return loaded(_that.conversation, _that.messages);
      case _Sending() when sending != null:
        return sending(_that.conversation, _that.messages);
      case _Failure() when failure != null:
        return failure(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements MessagesState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MessagesState.initial()';
  }
}

/// @nodoc

class _Loading implements MessagesState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MessagesState.loading()';
  }
}

/// @nodoc

class _Loaded implements MessagesState {
  const _Loaded(
      {required this.conversation, required final List<Message> messages})
      : _messages = messages;

  final Conversation conversation;
  final List<Message> _messages;
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  /// Create a copy of MessagesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            (identical(other.conversation, conversation) ||
                other.conversation == conversation) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, conversation,
      const DeepCollectionEquality().hash(_messages));

  @override
  String toString() {
    return 'MessagesState.loaded(conversation: $conversation, messages: $messages)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $MessagesStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call({Conversation conversation, List<Message> messages});

  $ConversationCopyWith<$Res> get conversation;
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of MessagesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? conversation = null,
    Object? messages = null,
  }) {
    return _then(_Loaded(
      conversation: null == conversation
          ? _self.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as Conversation,
      messages: null == messages
          ? _self._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }

  /// Create a copy of MessagesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConversationCopyWith<$Res> get conversation {
    return $ConversationCopyWith<$Res>(_self.conversation, (value) {
      return _then(_self.copyWith(conversation: value));
    });
  }
}

/// @nodoc

class _Sending implements MessagesState {
  const _Sending(
      {required this.conversation, required final List<Message> messages})
      : _messages = messages;

  final Conversation conversation;
  final List<Message> _messages;
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  /// Create a copy of MessagesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SendingCopyWith<_Sending> get copyWith =>
      __$SendingCopyWithImpl<_Sending>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sending &&
            (identical(other.conversation, conversation) ||
                other.conversation == conversation) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, conversation,
      const DeepCollectionEquality().hash(_messages));

  @override
  String toString() {
    return 'MessagesState.sending(conversation: $conversation, messages: $messages)';
  }
}

/// @nodoc
abstract mixin class _$SendingCopyWith<$Res>
    implements $MessagesStateCopyWith<$Res> {
  factory _$SendingCopyWith(_Sending value, $Res Function(_Sending) _then) =
      __$SendingCopyWithImpl;
  @useResult
  $Res call({Conversation conversation, List<Message> messages});

  $ConversationCopyWith<$Res> get conversation;
}

/// @nodoc
class __$SendingCopyWithImpl<$Res> implements _$SendingCopyWith<$Res> {
  __$SendingCopyWithImpl(this._self, this._then);

  final _Sending _self;
  final $Res Function(_Sending) _then;

  /// Create a copy of MessagesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? conversation = null,
    Object? messages = null,
  }) {
    return _then(_Sending(
      conversation: null == conversation
          ? _self.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as Conversation,
      messages: null == messages
          ? _self._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }

  /// Create a copy of MessagesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConversationCopyWith<$Res> get conversation {
    return $ConversationCopyWith<$Res>(_self.conversation, (value) {
      return _then(_self.copyWith(conversation: value));
    });
  }
}

/// @nodoc

class _Failure implements MessagesState {
  const _Failure({required this.message});

  final String message;

  /// Create a copy of MessagesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FailureCopyWith<_Failure> get copyWith =>
      __$FailureCopyWithImpl<_Failure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Failure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'MessagesState.failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res>
    implements $MessagesStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) =
      __$FailureCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$FailureCopyWithImpl<$Res> implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

  /// Create a copy of MessagesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_Failure(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
