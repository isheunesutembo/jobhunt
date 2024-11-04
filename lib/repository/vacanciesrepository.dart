import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:jobhunt/configs/config.dart';
import 'package:jobhunt/models/vacancy.dart';
import 'package:jobhunt/providers/httpprovider.dart';
import 'package:jobhunt/util/failure.dart';
final vacancyRepositoryProvider=Provider((ref)=>VacanciesRepository(client: ref.watch(httpProvider)));
class VacanciesRepository{
  final http.Client _client;
  VacanciesRepository({required http.Client client}):_client=client;

  Future<Either<AppFailure,List<Vacancy>>>getJobVacancies()async{
     Map<String, String> requestHeaders = {
      "Accept": "application/json",
      "Content-Type":"application/json"
    };
    var url = Uri.http(AppConfig.baseUrl, AppConfig.vacanciesUrl);
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

  Future<Either<AppFailure,Vacancy>>getVacancyById(String id)async{
      Map<String, String> requestHeaders = {
    
      "Content-Type":"application/json"
    };
    var url = Uri.http(AppConfig.baseUrl, "${AppConfig.vacanciesUrl}/$id");
    var response = await _client.get(url, headers: requestHeaders);
    var data = jsonDecode(response.body);
    Map<String,dynamic>jsonData=json.decode(response.body);
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