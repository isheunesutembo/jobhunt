import 'dart:convert';
import 'dart:io';
import 'dart:js_interop';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:jobhunt/configs/config.dart';
import 'package:jobhunt/models/resume.dart';
import 'package:jobhunt/models/vacancy.dart';
import 'package:jobhunt/providers/httpprovider.dart';
import 'package:jobhunt/util/failure.dart';
final resumeRepositoryProvider=Provider((ref)=>ResumeRepository(client: ref.watch(httpProvider)));
class ResumeRepository{
  final http.Client _client;
  ResumeRepository({required http.Client client}):_client=client;

  

  Future<Either<AppFailure,Resume>>uploadResume(File resume,String userId)async{
      Map<String, String> requestHeaders = {
      "Accept": "application/json",
    };
    var url = Uri.http(AppConfig.baseUrl, AppConfig.resumeUrl);
    var request =http.MultipartRequest('POST',Uri.parse(url.toString()));
     request.files.add(await http.MultipartFile.fromPath("resume",resume.path));
     request.fields["userId"]=userId;
    try {
      var streamResponse=await request.send();
      var response=await http.Response.fromStream(streamResponse);
      var data=jsonDecode(response.body);
      if (response.statusCode == 200) {
        return Right(Resume.fromJson(data));
      } else {
        return Left(AppFailure(message: data['message']));
      }
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }

  }
}