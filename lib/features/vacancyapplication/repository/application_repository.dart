import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobhunt/configs/config.dart';
import 'package:jobhunt/features/vacancyapplication/models/application_model.dart';
import 'package:jobhunt/providers/httpprovider.dart';
import 'package:jobhunt/features/auth/repository/localauthrepository.dart';
import 'package:jobhunt/util/failure.dart';
import 'package:jobhunt/features/vacancyapplication/widgets/send_application_button.dart';
import 'package:http/http.dart' as http;

final applicationRepositoryProvider = Provider((ref) => ApplicationRepository(
    localAuthRepository: ref.watch(localAuthRepositoryProvider),
    client: ref.watch(httpProvider)));

class ApplicationRepository {
  final LocalAuthRepository _localAuthRepository;
  final http.Client _client;
  ApplicationRepository(
      {required LocalAuthRepository localAuthRepository,
      required http.Client client})
      : _localAuthRepository = localAuthRepository,
        _client = client;

  Future<Either<AppFailure, ApplicationModel>> sendApplication(String vacancyId,
      String resumeId, String companyId, String userId,String status) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer ${_localAuthRepository.getUserToken()}"
    };
    var url = Uri.http(AppConfig.baseUrl, AppConfig.applicationUrl);
    var response = await _client.post(url,
        headers: requestHeaders,
        body: jsonEncode({
          "vacancyId": vacancyId,
          "resume": resumeId,
          "status":status,
          "company": companyId,
          "userId": userId
        }));
    var data = jsonDecode(response.body);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(ApplicationModel.fromJson(data));
      } else {
        return Left(AppFailure(message: data['message']));
      }
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }

  Future<Either<AppFailure, List<ApplicationModel>>> getUserApplications(
      String userId) async {
    Map<String, String> requestHeaders = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer ${_localAuthRepository.getUserToken()}"
    };
    var url = Uri.http(
        AppConfig.baseUrl, "${AppConfig.applicationsByUserUrl}/$userId");
    var response = await _client.get(url, headers: requestHeaders);
    var data = jsonDecode(response.body);

    try {
      if (response.statusCode == 200) {
        return Right(applicationFromJson(data));
      } else {
        return Left(AppFailure(message: data['message']));
      }
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }
}
