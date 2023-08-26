class InitSettings {
  String? appVersion;
  String? appLang;
  String? platform;
  String? osVersion;
  String? brand;
  String? model;
  String? isFirstTime;


  InitSettings();

  InitSettings.fromJSON(Map<String, dynamic> jsonMap) {
    appVersion = jsonMap['app_version'] ?? '';
    appLang = jsonMap['app_lang'] ?? '';
    platform = jsonMap['platform'] ?? '';
    osVersion = jsonMap['os_Version'] ?? '';
    brand = jsonMap['brand'] ?? '';
    model = jsonMap['model'] ?? '';
    isFirstTime = jsonMap['is_first_time'] ?? '1';
  }

  Map toMap() {
    var map =  <String, dynamic>{};
    map["app_version"] = appVersion;
    map["app_lang"] = appLang;
    map["platform"] = platform;
    map["os_Version"] = osVersion;
    map["brand"] = brand;
    map["model"] = model;
    map["is_first_time"] = isFirstTime;
    return map;
  }
}
