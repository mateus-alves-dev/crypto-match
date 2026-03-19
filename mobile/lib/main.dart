import 'package:crypto_match/app.dart';
import 'package:crypto_match/core/di/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

/// Top-level background message handler — must be a top-level function.
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Firebase must be initialized in the background isolate.
  await Firebase.initializeApp();
  // No-op: the message will be handled when the user taps the notification
  // and the app comes to foreground (onMessageOpenedApp / getInitialMessage).
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await configureDependencies();
  runApp(const App());
}
