import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:jobhunt/configs/config.dart';
import 'package:jobhunt/data/local/sharedservice.dart';
import 'package:jobhunt/domain/models/categorymodel.dart';
import 'package:jobhunt/domain/models/companymodel.dart';
import 'package:jobhunt/domain/models/usermodel.dart';
import 'package:jobhunt/domain/models/vacancymodel.dart';
import 'package:jobhunt/presentation/util/failure.dart';
final remoteDataSource=Provider((ref) => RemoteDataSource());
class RemoteDataSource{
   static var client = http.Client();
   Future<Either<AppFailure,UserModel>>logInUser(String email,String password)async{
       Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      "Accept": "application/json",
    };
      var url=Uri.http(AppConfig.baseUrl,AppConfig.logInUrl);
    var response=await client.post(url,headers: requestHeaders,
    body: jsonEncode({"email":email,"password":password}));
     var data=jsonDecode(response.body);
    try{
    
    if(response.statusCode==200||response.statusCode==201){
     
      SharedService.storeToken(data["userToken"]);
      return Right(UserModel.fromJson(data));
    
    }else{
       Left(AppFailure(message: response.statusCode.toString()));
    }
    }catch(e){

      Left(AppFailure(message:e.toString()));

    }
    return Right(UserModel.fromJson(data));
    

  }
   Future<Either<AppFailure,UserModel>>registerUser(String email,String username,String password)async{
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      "Accept": "application/json",
    };
         var url=Uri.http(AppConfig.baseUrl,AppConfig.registerUrl);
    var response=await client.post(url,headers: requestHeaders,
    body: jsonEncode({"email":email,"username":username,"password":password}));
    final resBodyMap=jsonDecode(response.body) as Map<String,dynamic>;
    try{
   
    if(response.statusCode==200||response.statusCode==201){
      
      Right(UserModel.fromJson(resBodyMap['message']));
    }else{
      Left(AppFailure(message:response.statusCode.toString()));
    }
    

  }catch(e){
    Left(AppFailure(message: e.toString()));

  }
  return Right(UserModel.fromJson(resBodyMap['messgae']));
  }

  Future<List<CategoryModel>>getJobCategories()async{
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
   try{
     var url=Uri.http(AppConfig.baseUrl,AppConfig.jobCategoriesUrl);
    var response=await client.get(url,headers: requestHeaders);

    if(response.statusCode==200){
      var data=jsonDecode(response.body);
    
      return categoriesFromJson(data);
    }else{
      Left(AppFailure(message: response.statusCode.toString()));
    }
   }catch(e){
    Left(AppFailure(message: e.toString()));

   }
   return null!;


  }
  Future<Either<AppFailure,List<VacancyModel>>>getVacancies()async{
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url=Uri.http(AppConfig.baseUrl,AppConfig.vacanciesUrl);
    var response=await client.get(url,headers: requestHeaders);
    var data=jsonDecode(response.body);
    try{
    

    if(response.statusCode==200){
      
    
      return Right(vacanciesFromJson(data));
    }else{
     Left(AppFailure(message: response.statusCode.toString()));
    }
    }catch(e){
      Left(AppFailure(message: e.toString()));
    }
   return Right(vacanciesFromJson(data));

  }

  Future<CompanyModel>getCompaniesById(String id)async{
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url=Uri.http(AppConfig.baseUrl,"${AppConfig.companiesUrl}/${id}");
    var response=await client.get(url,headers: requestHeaders);

    if(response.statusCode==200){
      var data=jsonDecode(response.body);
    
      return CompanyModel.fromJson(data);
    }else{
      return throw Exception(response.statusCode.toString());
    }


  }


}