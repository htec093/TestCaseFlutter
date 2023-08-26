import 'dart:async';

import '../../../data/models/failures.dart';

import '../../../../app/data/repositories/init_settings_repository.dart'
    as init_settings_repo;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/app_constants.dart';
import '../../../../utils/general_helper.dart';
import '../../../data/models/route_argument.dart';
import '../../../data/models/version.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  GlobalKey<ScaffoldState>? scaffoldKey;
  Failure? failure;
  Version? versionInfo;

  /// loading: 0 , errorResponse: 1,
  var screenState = 0.obs;

  SplashController() {
    scaffoldKey = GlobalKey<ScaffoldState>();
    failure = Failure(0, '');
  }

  @override
  void onInit() {
    listenForSettings();
    super.onInit();
  }

  Future<void> listenForSettings() async {
    screenState.value = 0;
    init_settings_repo.initSettings().then((response) {
      response.fold((fail) {
        screenState.value = 1;
        failure = fail;
      }, (settings) {
        Future.delayed(const Duration(seconds: 3))
            .then((value) => Get.offAllNamed(
                  Routes.HOME,
                ));
      });
    });
  }
}
