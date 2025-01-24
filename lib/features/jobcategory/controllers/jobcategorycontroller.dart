
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobhunt/features/jobcategory/repository/categoryrepository.dart';

import '../models/category.dart';
final jobCategoriesControllerProvider=AsyncNotifierProvider<JobCategoryController,AsyncValue<void>>(JobCategoryController.new);

final getJobCategoriesProvider=AutoDisposeFutureProvider<List<Category>>((ref) {
  final jobCategoryController=ref.watch(jobCategoriesControllerProvider.notifier);

  return jobCategoryController.getJobCategories();
});
class JobCategoryController extends AsyncNotifier<AsyncValue<void>>{
  late CategoryRepository _categoryRepository;
  AsyncValue<void>build(){
    _categoryRepository=ref.watch(categoryRepositoryProvider);
  return const AsyncValue.data(null);
  }
  Future<List<Category>>getJobCategories()async{
   final res= await _categoryRepository.getJobCategories();

   return switch(res){
    Left(value:final l)=>throw l.message,
    Right(value:final r)=>r
   };
    

  }
}