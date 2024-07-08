

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/data/repository/categoriesrepositoryimpl.dart';
import 'package:jobhunt/data/repository/companyrepositoryimpl.dart';
import 'package:jobhunt/data/repository/vacancyrepositoryimpl.dart';
import 'package:jobhunt/domain/models/categorymodel.dart';
import 'package:jobhunt/domain/models/companymodel.dart';
import 'package:jobhunt/domain/models/vacancymodel.dart';
final homeViewModelProvider=AsyncNotifierProvider<HomeViewModel,bool>(HomeViewModel.new);

final getCategoriesProvider=FutureProvider((ref) {
  final categories=ref.watch(homeViewModelProvider.notifier).getJobCategories();
  return categories;
});
final getVacanciesProvider=FutureProvider((ref) {
  final vacancies=ref.watch(homeViewModelProvider.notifier).getVacancies();
  return vacancies;
});

final getCompanyByIdProvider=FutureProvider.family((ref,String id){
   final company=ref.watch(homeViewModelProvider.notifier).getCompanyById(id);
  return company;
});
class HomeViewModel extends AsyncNotifier<bool>{

  bool build(){
    return false;
  }
  Future<List<CategoryModel>>getJobCategories()async{
  
    return ref.watch(CategoryRepositoryImplProvider).getJobCategories();
  }

  Future<List<VacancyModel>>getVacancies()async{
    return ref.watch(vacancyRepositoryImpProvider).getVacancies();
  }

  Future<CompanyModel>getCompanyById(String id)async{
    return ref.watch(commpanyRepositoryImplProvider)
    .getCompanyById(id);
    
  }
}