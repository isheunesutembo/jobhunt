import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobhunt/configs/config.dart';
import 'package:jobhunt/models/favourite.dart';
import 'package:jobhunt/providers/httpprovider.dart';
import 'package:jobhunt/repository/localauthrepository.dart';
import 'package:jobhunt/util/failure.dart';
import 'package:http/http.dart' as http;
final favouriteRepositoryProvider=Provider((ref)=>FavouriteRepository(localAuthRepository: ref.watch(localAuthRepositoryProvider), client: ref.watch(httpProvider)));
class FavouriteRepository {
  final http.Client _client;
  final LocalAuthRepository _localAuthRepository;
  FavouriteRepository(
      {required LocalAuthRepository localAuthRepository,
      required http.Client client})
      : _localAuthRepository = localAuthRepository,
        _client = client;
  Future<Either<AppFailure, Favourite>> addToFavourites(
      String vacancyId, String userId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer ${_localAuthRepository.isLoggedIn()}"
    };
    var url = Uri.http(AppConfig.baseUrl, AppConfig.favouriteUrl);
    var response = await _client.post(url,
        headers: requestHeaders,
        body: jsonEncode({
          "userId": userId,
          "vacancy": vacancyId,
        }));
    var data = jsonDecode(response.body);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(Favourite.fromJson(data));
      } else {
        return Left(AppFailure(message: data['message']));
      }
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }

  Future<Either<AppFailure, List<Favourite>>> getFavourites(
      String userId) async {
    Map<String, String> requestHeaders = {
    
      "Content-Type":"application/json",
      "Authorization": "Bearer ${_localAuthRepository.isLoggedIn()}"
    };
    var url = Uri.http(AppConfig.baseUrl, "${AppConfig.favouriteUrl}/$userId");
    var response = await _client.get(url, headers: requestHeaders);
    var data = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        return Right(favouritesFromJson(data));
      } else {
        return Left(AppFailure(message: data['message']));
      }
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }

  Future<Either<AppFailure, Favourite>> removeFavourite(
      String favouriteId) async {
    Map<String, String> requestHeaders = {
      "Accept": "application/json",
      "Authorization": "Bearer ${_localAuthRepository.isLoggedIn()}"
    };
    var url =
        Uri.http(AppConfig.baseUrl, "${AppConfig.favouriteUrl}/$favouriteId");
    var response = await _client.get(url, headers: requestHeaders);
    var data = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        return Right(Favourite.fromJson(data));
      } else {
        return Left(AppFailure(message: data['message']));
      }
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }
}
