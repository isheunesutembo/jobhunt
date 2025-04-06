import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:jobhunt/configs/config.dart';
import 'package:jobhunt/features/auth/models/usermodel.dart';
import 'package:jobhunt/features/auth/repository/localauthrepository.dart';
import 'package:jobhunt/providers/httpprovider.dart';
import 'package:jobhunt/util/failure.dart';
import 'package:jobhunt/util/success.dart';

final userRepositoryProvider = Provider((ref) => UserRepository(
    localAuthRepository: ref.watch(localAuthRepositoryProvider),
    client: ref.watch(httpProvider)));

class UserRepository {
  final LocalAuthRepository _localAuthRepository;
  final http.Client _client;

  UserRepository(
      {required LocalAuthRepository localAuthRepository,
      required http.Client client})
      : _localAuthRepository = localAuthRepository,
        _client = client;

  Future<Either<AppFailure, UserModel>> getUserData(String userId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_localAuthRepository.getUserToken()}'
    };
    var url = Uri.http(AppConfig.baseUrl, "${AppConfig.usersUrl}/$userId");
    var response = await _client.get(url, headers: requestHeaders);
    var data = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        return Right(UserModel.fromJson(data));
      } else {
        return Left(AppFailure(message: data['message']));
      }
    } catch (e) {
      return Left(AppFailure(message: data["message"]));
    }
  }

  Future<Either<AppFailure, Success>> updateUserData(File profileImage,
      String username, String firstname, String lastname, String userId) async {
    Map<String, String> requestHeaders = {
      "Accept": "application/json",
      "Authorization": "Bearer ${_localAuthRepository.getUserToken()}",
      "Content-Type": "multipart/form-data",
    
    };

    var url = Uri.http(AppConfig.baseUrl, "${AppConfig.usersUrl}/$userId");
    var request = http.MultipartRequest('PATCH', Uri.parse(url.toString()));
    request.files.add(
        await http.MultipartFile.fromPath("profileImage", profileImage.path));
    request.headers.addAll(requestHeaders);
    request.fields["firstName"] = firstname;
    request.fields["lastName"] = lastname;
    request.fields["username"] = username;
    try {
      var streamResponse = await request.send();
      var response = await http.Response.fromStream(streamResponse);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return Right(Success(message: data["message"]));
      } else {
        return Left(AppFailure(message: data['message']));
      }
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }
}
