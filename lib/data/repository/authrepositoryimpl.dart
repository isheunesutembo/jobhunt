
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/data/remote/remote_data_source.dart';
import 'package:jobhunt/domain/models/usermodel.dart';
import 'package:jobhunt/domain/repository/authrepository.dart';

final authRepositoryImplProvider=Provider((ref) => AuthRepositoryImp(remoteDataSource: ref.watch(remoteDataSource)));
class AuthRepositoryImp implements AuthRepository{
  final RemoteDataSource _remoteDataSource;
  AuthRepositoryImp({required RemoteDataSource remoteDataSource}):_remoteDataSource=remoteDataSource;
  @override
  Future<void> logInUser(String email, String password) {
   return  _remoteDataSource.logInUser(email, password);
    
  }
  @override
  Future<void> registerUser(String email, String username, String password) {
   return  _remoteDataSource.registerUser(email, username, password);
  }

}