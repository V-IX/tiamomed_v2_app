import 'dart:async';

import 'package:flutter/material.dart';

class AuthListener extends ChangeNotifier {
  AuthListener(Stream<dynamic> authStream) {
    _authSubscription = authStream.asBroadcastStream().listen(
      (dynamic _) {
        return notifyListeners();
      }
    );
    notifyListeners();
  }

  late final StreamSubscription<dynamic> _authSubscription;

  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  }

}
