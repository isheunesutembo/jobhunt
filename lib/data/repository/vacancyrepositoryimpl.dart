
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/data/remote/remote_data_source.dart';
import 'package:jobhunt/domain/models/vacancymodel.dart';
import 'package:jobhunt/domain/repository/vacancyrepository.dart';
final vacancyRepositoryImpProvider=Provider((ref) => VacancyRepositoryImp(remoteDataSource: ref.watch(remoteDataSource)));
class VacancyRepositoryImp implements VacancyRepository{
  final RemoteDataSource _remoteDataSource;
  VacancyRepositoryImp({required RemoteDataSource remoteDataSource}):_remoteDataSource=remoteDataSource;
  @override
  Future<List<VacancyModel>> getVacancies() {
   return  _remoteDataSource.getVacancies();
  }

}