import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:jobhunt/configs/config.dart';
import 'package:jobhunt/features/jobcategory/models/category.dart';
import 'package:jobhunt/providers/httpprovider.dart';
import 'package:jobhunt/util/failure.dart';
final categoryRepositoryProvider=Provider((ref) => CategoryRepository(client: ref.watch(httpProvider)));
class CategoryRepository {
  final http.Client _client;
  CategoryRepository({required http.Client client}):_client=client;
  Future< Either<AppFailure,List<Category>>> getJobCategories() async {
    Map<String, String> requestHeaders = {
      "Accept": "application/json",
    };
    var url = Uri.http(AppConfig.baseUrl, AppConfig.jobCategoriesUrl);
    var response = await _client.get(url, headers: requestHeaders);
    var data = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        return Right(jobCategoriesFromJson(data));
      } else {
        return Left(AppFailure(message: data['message']));
      }
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }
}
