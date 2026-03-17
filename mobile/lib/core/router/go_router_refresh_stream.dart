import 'dart:async';

import 'package:flutter/material.dart';

/// Adapts a [Stream] to a [ChangeNotifier] so [GoRouter.refreshListenable]
/// can react to arbitrary stream events (e.g. AuthCubit state changes).
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
