import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get_storage/get_storage.dart';
import 'package:ososs_test/app/data/models/pokemon_page.dart';

import '../../../config/translations/strings_enum.dart';
import '../../../utils/app_constants.dart';
import '../models/failures.dart';
import '../models/success.dart';
import 'init_settings_repository.dart' as init_settings_repo;

// Future<Either<Failure, List<Template>>> getAllTemplates() async {
//   try {
//     bool isConnected = await checkInternetConnection();
//     if (!isConnected) {
//       return Left(Failure(-1, Strings.checkInternetConnection));
//     }
//     final String url = getServerApiUrl('templates');
//     dio.FormData formData = dio.FormData.fromMap({});
//     List<Template> templates = [];
//     final response = await dio.Dio().post(url,
//         options: dio.Options(headers: getApiHeader()), data: formData);
//     if (response.statusCode == 200) {
//       if (response.data['code'] == AppConstants.successCode) {
//         templates = (response.data['data'] != null &&
//                 (response.data['data'] as List).isNotEmpty
//             ? List.from(response.data['data'])
//                 .map((element) => Template.fromJson(element))
//                 .toSet()
//                 .toList()
//             : []);
//         allTemplateList = templates;
//         return Right(templates);
//       } else {
//         if (response.data['code'] == AppConstants.sessionExpiredCode) {
//           return Left(Failure(response.data['code'], Strings.sessionExpired));
//         } else {
//           return Left(Failure(response.data['code'], response.data['message']));
//         }
//       }
//     } else {
//       return Left(Failure(-1, Strings.unKnownErrorOccurred));
//     }
//   } catch (e) {
//     return Left(Failure(-1, Strings.unKnownErrorOccurred));
//   }
// }

// Future<Either<Failure, InfoModel>> getAppInfo() async {
//   try {
//     bool isConnected = await checkInternetConnection();
//     if (!isConnected) {
//       return Left(Failure(-1, Strings.checkInternetConnection));
//     }
//     final String url = getServerApiUrl('about');
//     dio.FormData formData = dio.FormData.fromMap({});
//     final response = await dio.Dio().post(url,
//         options: dio.Options(headers: getApiHeader()), data: formData);
//     if (response.statusCode == 200) {
//       if (response.data['code'] == AppConstants.successCode) {
//         infoModel = InfoModel.fromJson(response.data['data']);
//         return Right(infoModel);
//       } else {
//         return Left(Failure(response.data['code'], response.data['message']));
//       }
//     } else {
//       return Left(Failure(-1, Strings.unKnownErrorOccurred));
//     }
//   } catch (e) {
//     return Left(Failure(-1, Strings.unKnownErrorOccurred));
//   }
// }

Future<Either<Failure, PokemonPage>> getPokemons({String? path}) async {
  try {
    bool isConnected = await checkInternetConnection();
    if (!isConnected) {
      return Left(Failure(-1, Strings.checkInternetConnection));
    }
    final String url = path ?? 'https://pokeapi.co/api/v2/pokemon';
    final response = await dio.Dio().get(url,);
    if (response.statusCode == 200) {
      return Right(PokemonPage.fromJson(response.data));
    } else {
      return Left(Failure(-1, Strings.unKnownErrorOccurred));
    }
  } catch (e) {
    return Left(Failure(-1, Strings.unKnownErrorOccurred));
  }
}

// Future<Either<Failure, Success>> addNewFaqs(String question) async {
//   try {
//     bool isConnected = await checkInternetConnection();
//     if (!isConnected) {
//       return Left(Failure(-1, Strings.checkInternetConnection));
//     }
//     final String url = getServerApiUrl('add-question');
//     dio.FormData formData = dio.FormData.fromMap({
//       'question_en': question,
//     });
//     final response = await dio.Dio().post(url,
//         options: dio.Options(headers: getApiHeader()), data: formData);
//     if (response.statusCode == 200) {
//       if (response.data['code'] == AppConstants.successCode) {
//         return Right(Success(1, response.data['message']));
//       } else {
//         return Left(Failure(response.data['code'], response.data['message']));
//       }
//     } else {
//       return Left(Failure(-1, Strings.unKnownErrorOccurred));
//     }
//   } catch (e) {
//     return Left(Failure(-1, Strings.unKnownErrorOccurred));
//   }
// }

/// general functions

Future<bool> checkInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    return false;
  } else {
    return true;
  }
}

String getServerApiUrl(apiName) {
  return '${AppConstants.serverApiPath}$apiName';
}

Map<String, dynamic> getApiHeader() {
  return {
    HttpHeaders.acceptLanguageHeader: init_settings_repo.mInitSettings.appLang,
    // 'Authorization': 'Bearer ${subscriber_repo.currentSubscriber.sessionId}',
    HttpHeaders.acceptHeader: 'application/json',
  };
}
