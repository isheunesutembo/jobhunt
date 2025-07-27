import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobhunt/configs/config.dart';
import 'package:jobhunt/features/auth/models/usermodel.dart';
import 'package:jobhunt/providers/httpprovider.dart';
import 'package:jobhunt/features/auth/repository/localauthrepository.dart';
import 'package:jobhunt/util/failure.dart';
import 'package:http/http.dart' as http;

final authRepositoryProvider = Provider((ref) => AuthRepository(
    localAuthRepository: ref.watch(localAuthRepositoryProvider),client: ref.watch(httpProvider)));

class AuthRepository { 
  final LocalAuthRepository _localAuthRepository;
  final http.Client _client;

  AuthRepository({required LocalAuthRepository localAuthRepository,required http.Client client})
      : _localAuthRepository = localAuthRepository,_client=client;

  Future<Either<AppFailure, UserModel>> logInWithEmailPassword(
      String email, String password) async {
    Map<String, String> requestHeaders = {
      "Accept": "application/json",
      "Content-Type":"application/json"
    };
    var url = Uri.http(AppConfig.baseUrl, AppConfig.logInUrl);
    var response = await _client.post(url,
        headers: requestHeaders,
        body: jsonEncode({"email": email, "password": password}));
    var data = jsonDecode(response.body);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        _localAuthRepository.setUserId(data['_id']);
        _localAuthRepository.setToken(data["userToken"]);
         _localAuthRepository.setRefreshToken(data["refreshToken"]);
        return Right(UserModel.fromJson(data));
      } else {
        return Left(AppFailure(message: data['message']));
      }
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }

  Future<Either<AppFailure, UserModel>> registerWithEmailPassword(
      String email, String username, String password) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(AppConfig.baseUrl, AppConfig.registerUrl);
    var response = await _client.post(url,
        headers: requestHeaders,
        body: jsonEncode(
            {"email": email, "username": username, "password": password}));
    var data = jsonDecode(response.body);
    try {
  
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(UserModel.fromJson(data));
      } else {
        return Left(AppFailure(message: data['message']));
      }
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }

  Future<Either<AppFailure, UserModel>> getCurrentUserData(
      String userId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization':'Bearer ${_localAuthRepository.getUserToken()}'
      
    };
    var url = Uri.http(AppConfig.baseUrl, "${AppConfig.usersUrl}/$userId");
    var response = await _client.get(url,headers: requestHeaders);
    var data = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        return Right(UserModel.fromJson(data));
      } else if(response.statusCode==403){
      await  refreshToken();
       return await getCurrentUserData(userId);
      } {
        return Left(AppFailure(message: data['message']));
      }
    } catch (e) {
      return Left(AppFailure(message: data["message"]));
    }
  }

  Future<String?>refreshToken()async{
    final refreshToken=_localAuthRepository.getRefreshToken();
    if(refreshToken==null){
      return null;
    }
    var url = Uri.http(AppConfig.baseUrl, AppConfig.refreshTokenUrl);
    final response=await http.post(
      url,
      headers: {
        'Content-Type':"application/json"
      },body: jsonEncode({
        "refreshToken":refreshToken
      })
    );
    if(response.statusCode==200){
      final data=jsonDecode(response.body);
      final newUserToken=data["userToken"];
      _localAuthRepository.setToken(newUserToken);
      return newUserToken;
    }else{
      _localAuthRepository.clearTokens();
      return null;
    }
  }
}
