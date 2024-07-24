import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:jobhunt/configs/config.dart';
import 'package:jobhunt/models/jobcategory.dart';
import 'package:jobhunt/util/failure.dart';
final categoryRepositoryProvider=Provider((ref) => CategoryRepository());
class CategoryRepository {
  static var client = http.Client();
  Future< Either<AppFailure,List<JobCategory>>> getJobCategories() async {
    Map<String, String> requestHeaders = {
      "Accept": "application/json",
    };
    var url = Uri.http(AppConfig.baseUrl, AppConfig.jobCategoriesUrl);
    var response = await client.get(url, headers: requestHeaders);
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
