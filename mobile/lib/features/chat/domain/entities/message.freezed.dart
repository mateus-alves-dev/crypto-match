// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Message {
  String get id;
  String get conversationId;
  String get senderId;
  String get content;
  DateTime get sentAt;
  bool? get isRead;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessageCopyWith<Message> get copyWith =>
      _$MessageCopyWithImpl<Message>(this as Message, _$identity);

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Message &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.isRead, isRead) || other.isRead == isRead));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, conversationId, senderId, content, sentAt, isRead);

  @override
  String toString() {
    return 'Message(id: $id, conversationId: $conversationId, senderId: $senderId, content: $content, sentAt: $sentAt, isRead: $isRead)';
  }
}

/// @nodoc
abstract mixin class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) _then) =
      _$MessageCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String conversationId,
      String senderId,
      String content,
      DateTime sentAt,
      bool? isRead});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res> implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._self, this._then);

  final Message _self;
  final $Res Function(Message) _then;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? conversationId = null,
    Object? senderId = null,
    Object? content = null,
    Object? sentAt = null,
    Object? isRead = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      conversationId: null == conversationId
          ? _self.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: null == sentAt
          ? _self.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: freezed == isRead
          ? _self.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Message].
extension MessagePatterns on Message {
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
    TResult Function(_Message value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Message() when $default != null:
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
    TResult Function(_Message value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Message():
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
    TResult? Function(_Message value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Message() when $default != null:
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
    TResult Function(String id, String conversationId, String senderId,
            String content, DateTime sentAt, bool? isRead)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Message() when $default != null:
        return $default(_that.id, _that.conversationId, _that.senderId,
            _that.content, _that.sentAt, _that.isRead);
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
    TResult Function(String id, String conversationId, String senderId,
            String content, DateTime sentAt, bool? isRead)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Message():
        return $default(_that.id, _that.conversationId, _that.senderId,
            _that.content, _that.sentAt, _that.isRead);
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
    TResult? Function(String id, String conversationId, String senderId,
            String content, DateTime sentAt, bool? isRead)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Message() when $default != null:
        return $default(_that.id, _that.conversationId, _that.senderId,
            _that.content, _that.sentAt, _that.isRead);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Message implements Message {
  const _Message(
      {required this.id,
      required this.conversationId,
      required this.senderId,
      required this.content,
      required this.sentAt,
      this.isRead});
  factory _Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  @override
  final String id;
  @override
  final String conversationId;
  @override
  final String senderId;
  @override
  final String content;
  @override
  final DateTime sentAt;
  @override
  final bool? isRead;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MessageCopyWith<_Message> get copyWith =>
      __$MessageCopyWithImpl<_Message>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Message &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.isRead, isRead) || other.isRead == isRead));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, conversationId, senderId, content, sentAt, isRead);

  @override
  String toString() {
    return 'Message(id: $id, conversationId: $conversationId, senderId: $senderId, content: $content, sentAt: $sentAt, isRead: $isRead)';
  }
}

/// @nodoc
abstract mixin class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) _then) =
      __$MessageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String conversationId,
      String senderId,
      String content,
      DateTime sentAt,
      bool? isRead});
}

/// @nodoc
class __$MessageCopyWithImpl<$Res> implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(this._self, this._then);

  final _Message _self;
  final $Res Function(_Message) _then;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? conversationId = null,
    Object? senderId = null,
    Object? content = null,
    Object? sentAt = null,
    Object? isRead = freezed,
  }) {
    return _then(_Message(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      conversationId: null == conversationId
          ? _self.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: null == sentAt
          ? _self.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: freezed == isRead
          ? _self.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
mixin _$Conversation {
  String get id;
  String get participantId;
  String get participantName;
  String? get participantAvatarUrl;
  String? get lastMessage;
  DateTime? get lastMessageAt;
  int? get unreadCount;

  /// Create a copy of Conversation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConversationCopyWith<Conversation> get copyWith =>
      _$ConversationCopyWithImpl<Conversation>(
          this as Conversation, _$identity);

  /// Serializes this Conversation to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Conversation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.participantId, participantId) ||
                other.participantId == participantId) &&
            (identical(other.participantName, participantName) ||
                other.participantName == participantName) &&
            (identical(other.participantAvatarUrl, participantAvatarUrl) ||
                other.participantAvatarUrl == participantAvatarUrl) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastMessageAt, lastMessageAt) ||
                other.lastMessageAt == lastMessageAt) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      participantId,
      participantName,
      participantAvatarUrl,
      lastMessage,
      lastMessageAt,
      unreadCount);

  @override
  String toString() {
    return 'Conversation(id: $id, participantId: $participantId, participantName: $participantName, participantAvatarUrl: $participantAvatarUrl, lastMessage: $lastMessage, lastMessageAt: $lastMessageAt, unreadCount: $unreadCount)';
  }
}

/// @nodoc
abstract mixin class $ConversationCopyWith<$Res> {
  factory $ConversationCopyWith(
          Conversation value, $Res Function(Conversation) _then) =
      _$ConversationCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String participantId,
      String participantName,
      String? participantAvatarUrl,
      String? lastMessage,
      DateTime? lastMessageAt,
      int? unreadCount});
}

/// @nodoc
class _$ConversationCopyWithImpl<$Res> implements $ConversationCopyWith<$Res> {
  _$ConversationCopyWithImpl(this._self, this._then);

  final Conversation _self;
  final $Res Function(Conversation) _then;

  /// Create a copy of Conversation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? participantId = null,
    Object? participantName = null,
    Object? participantAvatarUrl = freezed,
    Object? lastMessage = freezed,
    Object? lastMessageAt = freezed,
    Object? unreadCount = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      participantId: null == participantId
          ? _self.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as String,
      participantName: null == participantName
          ? _self.participantName
          : participantName // ignore: cast_nullable_to_non_nullable
              as String,
      participantAvatarUrl: freezed == participantAvatarUrl
          ? _self.participantAvatarUrl
          : participantAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _self.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageAt: freezed == lastMessageAt
          ? _self.lastMessageAt
          : lastMessageAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      unreadCount: freezed == unreadCount
          ? _self.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Conversation].
extension ConversationPatterns on Conversation {
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
    TResult Function(_Conversation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Conversation() when $default != null:
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
    TResult Function(_Conversation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Conversation():
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
    TResult? Function(_Conversation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Conversation() when $default != null:
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
            String participantId,
            String participantName,
            String? participantAvatarUrl,
            String? lastMessage,
            DateTime? lastMessageAt,
            int? unreadCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Conversation() when $default != null:
        return $default(
            _that.id,
            _that.participantId,
            _that.participantName,
            _that.participantAvatarUrl,
            _that.lastMessage,
            _that.lastMessageAt,
            _that.unreadCount);
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
            String participantId,
            String participantName,
            String? participantAvatarUrl,
            String? lastMessage,
            DateTime? lastMessageAt,
            int? unreadCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Conversation():
        return $default(
            _that.id,
            _that.participantId,
            _that.participantName,
            _that.participantAvatarUrl,
            _that.lastMessage,
            _that.lastMessageAt,
            _that.unreadCount);
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
            String participantId,
            String participantName,
            String? participantAvatarUrl,
            String? lastMessage,
            DateTime? lastMessageAt,
            int? unreadCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Conversation() when $default != null:
        return $default(
            _that.id,
            _that.participantId,
            _that.participantName,
            _that.participantAvatarUrl,
            _that.lastMessage,
            _that.lastMessageAt,
            _that.unreadCount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Conversation implements Conversation {
  const _Conversation(
      {required this.id,
      required this.participantId,
      required this.participantName,
      this.participantAvatarUrl,
      this.lastMessage,
      this.lastMessageAt,
      this.unreadCount});
  factory _Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  @override
  final String id;
  @override
  final String participantId;
  @override
  final String participantName;
  @override
  final String? participantAvatarUrl;
  @override
  final String? lastMessage;
  @override
  final DateTime? lastMessageAt;
  @override
  final int? unreadCount;

  /// Create a copy of Conversation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConversationCopyWith<_Conversation> get copyWith =>
      __$ConversationCopyWithImpl<_Conversation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ConversationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Conversation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.participantId, participantId) ||
                other.participantId == participantId) &&
            (identical(other.participantName, participantName) ||
                other.participantName == participantName) &&
            (identical(other.participantAvatarUrl, participantAvatarUrl) ||
                other.participantAvatarUrl == participantAvatarUrl) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastMessageAt, lastMessageAt) ||
                other.lastMessageAt == lastMessageAt) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      participantId,
      participantName,
      participantAvatarUrl,
      lastMessage,
      lastMessageAt,
      unreadCount);

  @override
  String toString() {
    return 'Conversation(id: $id, participantId: $participantId, participantName: $participantName, participantAvatarUrl: $participantAvatarUrl, lastMessage: $lastMessage, lastMessageAt: $lastMessageAt, unreadCount: $unreadCount)';
  }
}

/// @nodoc
abstract mixin class _$ConversationCopyWith<$Res>
    implements $ConversationCopyWith<$Res> {
  factory _$ConversationCopyWith(
          _Conversation value, $Res Function(_Conversation) _then) =
      __$ConversationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String participantId,
      String participantName,
      String? participantAvatarUrl,
      String? lastMessage,
      DateTime? lastMessageAt,
      int? unreadCount});
}

/// @nodoc
class __$ConversationCopyWithImpl<$Res>
    implements _$ConversationCopyWith<$Res> {
  __$ConversationCopyWithImpl(this._self, this._then);

  final _Conversation _self;
  final $Res Function(_Conversation) _then;

  /// Create a copy of Conversation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? participantId = null,
    Object? participantName = null,
    Object? participantAvatarUrl = freezed,
    Object? lastMessage = freezed,
    Object? lastMessageAt = freezed,
    Object? unreadCount = freezed,
  }) {
    return _then(_Conversation(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      participantId: null == participantId
          ? _self.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as String,
      participantName: null == participantName
          ? _self.participantName
          : participantName // ignore: cast_nullable_to_non_nullable
              as String,
      participantAvatarUrl: freezed == participantAvatarUrl
          ? _self.participantAvatarUrl
          : participantAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _self.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageAt: freezed == lastMessageAt
          ? _self.lastMessageAt
          : lastMessageAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      unreadCount: freezed == unreadCount
          ? _self.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
