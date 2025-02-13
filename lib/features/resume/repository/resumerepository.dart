import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:jobhunt/configs/config.dart';
import 'package:jobhunt/features/auth/repository/authrepository.dart';
import 'package:jobhunt/providers/httpprovider.dart';
import 'package:jobhunt/features/auth/repository/localauthrepository.dart';
import 'package:jobhunt/util/failure.dart';
import 'package:jobhunt/util/success.dart';
import '../models/resume.dart';
final resumeRepositoryProvider=Provider((ref)=>ResumeRepository(client: ref.watch(httpProvider),localAuthRepository: ref.watch(localAuthRepositoryProvider),authRepository: ref.watch(authRepositoryProvider)));
class ResumeRepository{
  final http.Client _client;
  final LocalAuthRepository _localAuthRepository;
  final AuthRepository _authRepository;
  ResumeRepository({required http.Client client,required LocalAuthRepository localAuthRepository,required AuthRepository authRepository}):_client=client,_localAuthRepository=localAuthRepository,_authRepository=authRepository;
  FlutterSecureStorage flutterSecureStorage=const FlutterSecureStorage();
  

  Future<Either<AppFailure,Resume>>uploadResume(File resume,String title,String userId)async{
      Map<String, String> requestHeaders = {
      "Accept": "application/json",
      "Authorization":"Bearer ${_localAuthRepository.getUserToken()}"
    };
    
    var url = Uri.http(AppConfig.baseUrl, AppConfig.resumeUrl);
    var request =http.MultipartRequest('POST',Uri.parse(url.toString()));
     request.files.add(await http.MultipartFile.fromPath("resume",resume.path));
     request.headers.addAll(requestHeaders);
     request.fields["userId"]=userId;
     request.fields["title"]=title;
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
  Future< Either<AppFailure,List<Resume>>> getUserResumes(String userId) async {
    Map<String, String> requestHeaders = {
      "Accept": "application/json",
       "Authorization":"Bearer ${_localAuthRepository.getUserToken()}"
    };

    var url = Uri.http(AppConfig.baseUrl, "${AppConfig.resumeUrl}/$userId");
    var response = await _client.get(url, headers: requestHeaders);
    var data = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        return Right(resumeFromJson(data));
      }else {
        return Left(AppFailure(message: data['message']));
      }
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
   
  
     
  }
  Future<Either<AppFailure, Success>> deleteResume(
      String resumeId) async {
    Map<String, String> requestHeaders = {
      "Accept": "application/json",
      "Authorization": "Bearer ${_localAuthRepository.getUserToken()}"
    };
    var url =
        Uri.http(AppConfig.baseUrl, "${AppConfig.resumeUrl}/$resumeId");
    var response = await _client.delete(url, headers: requestHeaders);
    var data = jsonDecode(response.body);
    try {
    

      if (response.statusCode == 200) {
        return Right(Success(message: data['message']));
      }else if(response.statusCode==403) {
        await  _authRepository.refreshToken();
        return deleteResume(resumeId);
      
      }else {
        return Left(AppFailure(message: data['message']));
      }
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
    
   
   
   
      
  }
}