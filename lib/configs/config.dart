import 'dart:io';

class AppConfig{
  static String get baseUrl {
  if (Platform.isAndroid) {
    return "10.0.2.2:6013"; 
  } else if (Platform.isIOS) {
    return "127.0.0.1:6013"; 
  } else {
    return "http://localhost:6013"; 
  }
}


static String get fullImageUrl {
  if (Platform.isAndroid) {
    return "http://10.0.2.2:6013"; 
  } else if (Platform.isIOS) {
    return "http://127.0.0.1:6013"; 
  } else {
    return "http://localhost:6013"; 
  }
}
  //android port 

  static const baseUrlAndroid=":6013";
  static const fullResumeUrl="http://127.0.0.1:6013/";
  static const registerUrl="/api/registerUser";
  static const logInUrl="/api/logInUser";
  static const refreshTokenUrl="/api/refresh-token";
  static const usersUrl="/api/users";
  static const jobCategoriesUrl="/api/categories";
  static const vacanciesUrl="/api/vacancies";
  static const companiesUrl="/api/companies";
  static const resumeUrl='/api/resumes';
  static const applicationUrl="/api/applications";
  static const applicationsByUserUrl="api/applications/applicationsbyuser";
  static const favouriteUrl="/api/favourites";

  
}