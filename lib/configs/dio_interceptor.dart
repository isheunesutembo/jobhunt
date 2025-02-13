import 'package:dio/dio.dart';
import 'package:jobhunt/configs/config.dart';

import '../features/auth/repository/localauthrepository.dart';

class DioInterceptor extends Interceptor{
  final Dio dio;
  final LocalAuthRepository localAuthRepository;
  DioInterceptor(this.dio,this.localAuthRepository);
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      print("Token expired. Trying to refresh...");
      final refreshedToken = await refreshToken();
      if (refreshedToken!=null) {
        RequestOptions requestOptions = err.requestOptions;
        return handler.resolve(await dio.fetch(requestOptions)); // Retry request
      } else {
      localAuthRepository.clearTokens();
      }
    }
    return handler.next(err);
  }
  Future<String?>refreshToken()async{
    final refreshToken=localAuthRepository.getRefreshToken();
    if(refreshToken==null){
      return null;
    }
    final response=await dio.post("${AppConfig.baseUrl}/${AppConfig.refreshTokenUrl}");
    if(response.statusCode==200){
      final data=response.data["accessToken"];
      final newUserToken=data;
      localAuthRepository.setToken(newUserToken);
      return newUserToken;
    }else{
      localAuthRepository.clearTokens();
      return null;
    }
  }

}