

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobhunt/configs/config.dart';
import 'package:jobhunt/providers/httpprovider.dart';
import 'package:jobhunt/features/auth/repository/localauthrepository.dart';
import 'package:jobhunt/util/failure.dart';
import 'package:http/http.dart' as http;

import '../../auth/models/usermodel.dart';


final userRepositoryProvider=Provider((ref)=>UserRepository(localAuthRepository: ref.watch(localAuthRepositoryProvider), client: ref.watch(httpProvider)));
class UserRepository{
  final LocalAuthRepository _localAuthRepository;
  final http.Client _client;

  UserRepository({required LocalAuthRepository localAuthRepository,required http.Client client})
      : _localAuthRepository = localAuthRepository,_client=client;
  Future<Either<AppFailure,UserModel>>getUserById(String id)async{
      Map<String, String> requestHeaders = {
      "Accept": "application/json",
      "Authorization":"Bearer ${_localAuthRepository.getUserToken()}"
    };
    var url = Uri.http(AppConfig.baseUrl, "${AppConfig.usersUrl}/$id");
    var response = await _client.get(url, headers: requestHeaders);
    var data = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        return Right(UserModel.fromJson(data));
      } else {
        return Left(AppFailure(message: data['message']));
      }
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }

  }
}