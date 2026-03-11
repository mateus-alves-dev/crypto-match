import 'package:crypto_match/app.dart';
import 'package:crypto_match/core/di/injection.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const App());
}
