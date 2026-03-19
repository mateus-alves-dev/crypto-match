import 'dart:io';

import 'package:crypto_match/core/notifications/notification_payload.dart';
import 'package:crypto_match/core/router/app_router.dart';
import 'package:crypto_match/features/settings/domain/entities/user_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart'
    hide NotificationSettings;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

const _fcmTokenKey = 'fcm_token';
const _androidChannelId = 'crypto_match_channel';
const _androidChannelName = 'CryptoMatch Notifications';

@lazySingleton
class NotificationHandler {
  NotificationHandler(
    this._messaging,
    this._localNotifications,
    this._secureStorage,
    this._appRouter,
  );

  final FirebaseMessaging _messaging;
  final FlutterLocalNotificationsPlugin _localNotifications;
  final FlutterSecureStorage _secureStorage;
  final AppRouter _appRouter;

  NotificationSettings _settings = const NotificationSettings();
  bool _initialized = false;

  /// Call once after the user is authenticated. Idempotent.
  Future<void> initialize() async {
    if (_initialized) return;
    _initialized = true;

    await _requestPermission();
    await _setupLocalNotifications();
    await _saveToken();
    _listenToTokenRefresh();
    _listenToForegroundMessages();
    _listenToMessageOpenedApp();
    await _handleInitialMessage();
  }

  /// Keep in sync with the user's notification preferences.
  void updateSettings(NotificationSettings settings) {
    _settings = settings;
  }

  // ──────────────────────────── Setup ────────────────────────────────────────

  Future<void> _requestPermission() async {
    await _messaging.requestPermission();
  }

  Future<void> _setupLocalNotifications() async {
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
    );

    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onLocalNotificationTap,
    );

    // Create Android notification channel
    const channel = AndroidNotificationChannel(
      _androidChannelId,
      _androidChannelName,
      importance: Importance.high,
    );
    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
  }

  Future<void> _saveToken() async {
    // On iOS, getToken() requires the APNs token to be registered first.
    // APNs registration is async; poll briefly before giving up.
    if (Platform.isIOS) {
      String? apnsToken;
      for (var i = 0; i < 5 && apnsToken == null; i++) {
        apnsToken = await _messaging.getAPNSToken();
        if (apnsToken == null) {
          await Future<void>.delayed(const Duration(seconds: 1));
        }
      }
      if (apnsToken == null) return; // APNs not ready — skip silently
    }

    final token = await _messaging.getToken();
    if (token != null) {
      await _secureStorage.write(key: _fcmTokenKey, value: token);
    }
  }

  void _listenToTokenRefresh() {
    _messaging.onTokenRefresh.listen((token) {
      _secureStorage.write(key: _fcmTokenKey, value: token);
    });
  }

  // ──────────────────────────── Message Listeners ────────────────────────────

  void _listenToForegroundMessages() {
    FirebaseMessaging.onMessage.listen((message) {
      _handleMessage(message, openedApp: false);
    });
  }

  void _listenToMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _handleMessage(message, openedApp: true);
    });
  }

  Future<void> _handleInitialMessage() async {
    final initial = await _messaging.getInitialMessage();
    if (initial != null) {
      _handleMessage(initial, openedApp: true);
    }
  }

  // ──────────────────────────── Message Processing ───────────────────────────

  void _handleMessage(RemoteMessage message, {required bool openedApp}) {
    final payload = NotificationPayload.fromRemoteMessage(message);

    if (openedApp) {
      _navigate(payload);
    } else if (_isEnabled(payload.type)) {
      _showLocalNotification(payload);
    }
  }

  bool _isEnabled(NotificationType type) {
    switch (type) {
      case NotificationType.newMatch:
        return _settings.newMatches;
      case NotificationType.newMessage:
        return _settings.newMessages;
      case NotificationType.tokenReward:
        return _settings.tokenRewards;
      case NotificationType.appUpdate:
        return _settings.appUpdates;
      case NotificationType.dailyStreak:
        return _settings.dailyStreak;
      case NotificationType.unknown:
        return true;
    }
  }

  Future<void> _showLocalNotification(NotificationPayload payload) async {
    const androidDetails = AndroidNotificationDetails(
      _androidChannelId,
      _androidChannelName,
      importance: Importance.high,
      priority: Priority.high,
    );
    const iosDetails = DarwinNotificationDetails();
    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotifications.show(
      payload.hashCode,
      payload.title,
      payload.body,
      details,
      payload:
          '${payload.type.name}:${payload.conversationId ?? ''}:${payload.matchId ?? ''}',
    );
  }

  void _onLocalNotificationTap(NotificationResponse response) {
    final raw = response.payload;
    if (raw == null || raw.isEmpty) return;

    final parts = raw.split(':');
    final typeName = parts.isNotEmpty ? parts[0] : '';
    final conversationId = parts.length > 1 && parts[1].isNotEmpty
        ? parts[1]
        : null;

    final type = NotificationType.values.firstWhere(
      (t) => t.name == typeName,
      orElse: () => NotificationType.unknown,
    );

    _navigate(
      NotificationPayload(
        type: type,
        title: '',
        body: '',
        conversationId: conversationId,
      ),
    );
  }

  // ──────────────────────────── Navigation ───────────────────────────────────

  void _navigate(NotificationPayload payload) {
    final router = _appRouter.router;

    switch (payload.type) {
      case NotificationType.newMatch:
        router.go(AppRoutes.matches);
      case NotificationType.newMessage:
        final conversationId = payload.conversationId;
        if (conversationId != null && conversationId.isNotEmpty) {
          router.go(AppRoutes.chat(conversationId));
        } else {
          router.go(AppRoutes.conversations);
        }
      case NotificationType.tokenReward:
        router.go(AppRoutes.wallet);
      case NotificationType.dailyStreak:
        router.go(AppRoutes.rewards);
      case NotificationType.appUpdate:
      case NotificationType.unknown:
        break;
    }
  }
}
