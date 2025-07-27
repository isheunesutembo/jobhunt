import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:jobhunt/configs/config.dart';
import 'package:jobhunt/providers/httpprovider.dart';
import 'package:jobhunt/util/failure.dart';

import '../models/vacancy.dart';

final vacancyRepositoryProvider =
    Provider((ref) => VacanciesRepository(client: ref.watch(httpProvider)));

class VacanciesRepository {
  final http.Client _client;
  VacanciesRepository({required http.Client client}) : _client = client;

  Future<Either<AppFailure, List<Vacancy>>> getJobVacancies({required int page,required int limit}) async {
    Map<String, String> requestHeaders = {
      "Accept": "application/json",
      "Content-Type": "application/json"
    };
    var url = Uri.http(AppConfig.baseUrl, AppConfig.vacanciesUrl,{
      'page':page.toString(),
      'limit':limit.toString()
    });
    var response = await _client.get(url, headers: requestHeaders);
    var data = jsonDecode(response.body);

    try {
      if (response.statusCode == 200) {
        return Right(vacanciesFromJson(data['vacancies']));
      } else {
        return Left(AppFailure(message: data['message']));
      }
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }

  Future<Either<AppFailure, List<Vacancy>>> getJobVacanciesByCategory(String categoryId) async {
    Map<String, String> requestHeaders = {
      "Accept": "application/json",
      "Content-Type": "application/json"
    };
    var url = Uri.http(AppConfig.baseUrl, "${AppConfig.vacanciesUrl}/vacancyByCategory/$categoryId");
    var response = await _client.get(url, headers: requestHeaders);
    var data = jsonDecode(response.body);

    try {
      if (response.statusCode == 200) {
        return Right(vacanciesFromJson(data));
      } else {
        return Left(AppFailure(message: data['message']));
      }
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }

  Future<Either<AppFailure, List<Vacancy>>> searchVacancies(
      String search) async {
    Map<String, String> requestHeaders = {
      "Accept": "application/json",
      "Content-Type": "application/json;charset=UTF-8",
      'Charset': 'utf-8'
    };
    var url =
        Uri.parse("http://${AppConfig.baseUrl}${AppConfig.vacanciesUrl}/search?query=$search");
    var response = await _client.get(url, headers: requestHeaders);
    var data = jsonDecode(response.body);

    try {
      if (response.statusCode == 200) {
       
        return Right(vacanciesFromJson(data["vacancies"]));
      } else {
        return Left(AppFailure(message: data['message']));
      }
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }

  Future<Either<AppFailure, Vacancy>> getVacancyById(String id) async {
    Map<String, String> requestHeaders = {"Content-Type": "application/json"};
    var url = Uri.http(AppConfig.baseUrl, "${AppConfig.vacanciesUrl}/$id");
    var response = await _client.get(url, headers: requestHeaders);
    var data = jsonDecode(response.body);
    Map<String, dynamic> jsonData = json.decode(response.body);
    try {
      if (response.statusCode == 200) {
        return Right(Vacancy.fromJson(jsonData));
      } else {
        return Left(AppFailure(message: data['message']));
      }
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }
}
