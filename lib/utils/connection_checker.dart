import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../app/data/repositories/init_settings_repository.dart';
import 'general_helper.dart';

class ConnectionChecker {
  static late StreamSubscription? _subscription;

  static void init() {
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        GeneralHelper.of(navigatorKey.currentContext!).showConnectionRestoredMessage();
      } else {
        GeneralHelper.of(navigatorKey.currentContext!).showConnectionLostMessage();
      }
    });
  }
}
