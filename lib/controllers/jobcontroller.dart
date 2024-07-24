
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobhunt/models/jobcategory.dart';
import 'package:jobhunt/repository/categoryrepository.dart';
final jobCategoriesControllerProvider=AsyncNotifierProvider<JobCategoryController,AsyncValue<List<JobCategory>>>(JobCategoryController.new);

final getJobCategoriesProvider=AutoDisposeFutureProvider<List<JobCategory>>((ref) {
  final jobCategoryController=ref.watch(jobCategoriesControllerProvider.notifier);

  return jobCategoryController.getJobCategories();
});
class JobCategoryController extends AsyncNotifier<AsyncValue<List<JobCategory>>>{
  late CategoryRepository _categoryRepository;
  AsyncValue<List<JobCategory>>build(){
    _categoryRepository=ref.watch(categoryRepositoryProvider);
  return null!;
  }
  Future<List<JobCategory>>getJobCategories()async{
   final res= await _categoryRepository.getJobCategories();

   return switch(res){
    Left(value:final l)=>throw l.message,
    Right(value:final r)=>r
   };
    

  }
}