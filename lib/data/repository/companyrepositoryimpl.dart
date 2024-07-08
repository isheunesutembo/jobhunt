import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/data/remote/remote_data_source.dart';
import 'package:jobhunt/data/repository/categoriesrepositoryimpl.dart';
import 'package:jobhunt/domain/models/companymodel.dart';
import 'package:jobhunt/domain/repository/companyrepository.dart';
final commpanyRepositoryImplProvider=Provider((ref) => CompanyRepositoryImpl(remoteDataSource: ref.watch(remoteDataSource)));
class CompanyRepositoryImpl implements CompanyRepository{
  final RemoteDataSource _remoteDataSource;
  CompanyRepositoryImpl({required RemoteDataSource remoteDataSource}):_remoteDataSource=remoteDataSource;
  @override
  Future<CompanyModel> getCompanyById(String id) {
   return  _remoteDataSource.getCompaniesById(id);
    
  }

}