import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:dio/dio.dart' as dio;

import '../../../config/translations/strings_enum.dart';
import '../../../utils/app_constants.dart';
import '../local/my_shared_pref.dart';
import '../models/failures.dart';
import '../models/init_settings.dart';
import '../models/version.dart';


InitSettings mInitSettings = InitSettings();
PackageInfo? mPackageInfo;
DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
Map<String, dynamic> deviceData = <String, dynamic>{};
bool isLanguageChanged = false;
Version? mLastVersion;
final navigatorKey = GlobalKey<NavigatorState>();

Future<Either<Failure, InitSettings>> initSettings() async {
  final settings = MySharedPref.getInitSettings();
  if (settings != null) {
    mInitSettings = InitSettings.fromJSON(json.decode(settings));
  } else {
    await getPackageInfo();
    if (mPackageInfo == null) {
      return Left(Failure(-1, 'error_occurred_while_checking_package_info'));
    }
    await initPlatformState();
    if (deviceData.containsKey('Error:')) {
      return Left(Failure(-1, 'Failed to get platform version.'));
    }
    mInitSettings.appVersion = mPackageInfo!.version;
    mInitSettings.brand = deviceData['brand'] ?? '';
    mInitSettings.model = deviceData['model'];
    mInitSettings.osVersion =
        deviceData['version.codename'] ?? deviceData['systemVersion'];
    mInitSettings.platform = Platform.isAndroid ? 'Android' : 'IOS';
    MySharedPref.setInitSettings(json.encode(mInitSettings.toMap()));
  }
  return Right(mInitSettings);
}

Future<void> getPackageInfo() async {
  mPackageInfo = await PackageInfo.fromPlatform();
}

Future<void> initPlatformState() async {
  try {
    if (Platform.isAndroid) {
      deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
    } else if (Platform.isIOS) {
      deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
    }
  } on PlatformException {
    deviceData = <String, dynamic>{'Error:': 'Failed to get platform version.'};
  }
}

Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
  return <String, dynamic>{
    'version.securityPatch': build.version.securityPatch,
    'version.sdkInt': build.version.sdkInt,
    'version.release': build.version.release,
    'version.previewSdkInt': build.version.previewSdkInt,
    'version.incremental': build.version.incremental,
    'version.codename': build.version.codename,
    'version.baseOS': build.version.baseOS,
    'board': build.board,
    'bootloader': build.bootloader,
    'brand': build.brand,
    'device': build.device,
    'display': build.display,
    'fingerprint': build.fingerprint,
    'hardware': build.hardware,
    'host': build.host,
    'id': build.id,
    'manufacturer': build.manufacturer,
    'model': build.model,
    'product': build.product,
    'supported32BitAbis': build.supported32BitAbis,
    'supported64BitAbis': build.supported64BitAbis,
    'supportedAbis': build.supportedAbis,
    'tags': build.tags,
    'type': build.type,
    'isPhysicalDevice': build.isPhysicalDevice,
    'systemFeatures': build.systemFeatures,
  };
}

Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
  return <String, dynamic>{
    'name': data.name,
    'systemName': data.systemName,
    'systemVersion': data.systemVersion,
    'model': data.model,
    'localizedModel': data.localizedModel,
    'identifierForVendor': data.identifierForVendor,
    'isPhysicalDevice': data.isPhysicalDevice,
    'utsname.sysname:': data.utsname.sysname,
    'utsname.nodename:': data.utsname.nodename,
    'utsname.release:': data.utsname.release,
    'utsname.version:': data.utsname.version,
    'utsname.machine:': data.utsname.machine,
  };
}




