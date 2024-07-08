
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/data/remote/remote_data_source.dart';
import 'package:jobhunt/domain/models/categorymodel.dart';
import 'package:jobhunt/domain/repository/categoryrepository.dart';
final CategoryRepositoryImplProvider=Provider((ref) => CategoryRepositoryImpl(remoteDataSource: ref.watch(remoteDataSource)));
class CategoryRepositoryImpl implements CategoryRepository{
  final RemoteDataSource _remoteDataSource;
  CategoryRepositoryImpl({required RemoteDataSource remoteDataSource}):_remoteDataSource=remoteDataSource;
  @override
  Future<List<CategoryModel>> getJobCategories() async{
  return   _remoteDataSource.getJobCategories();
    
  }

}
