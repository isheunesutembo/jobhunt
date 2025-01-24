


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import 'package:jobhunt/features/vacancy/repository/vacanciesrepository.dart';

import '../models/vacancy.dart';
final vacancyControllerProvider=AsyncNotifierProvider<VacancyController,AsyncValue<void>>(VacancyController.new);
final getVacanciesProvider=FutureProvider((ref){
  final vacancies=ref.watch(vacancyControllerProvider.notifier);
  return vacancies.getVacancies();

});
final getVacancyById=FutureProvider.family((ref,String id){
  final vacancy=ref.watch(vacancyControllerProvider.notifier);
  return vacancy.getVacancyById(id);
});

final searchVacancy=FutureProvider.family((ref,String search){
  final vacancy=ref.watch(vacancyControllerProvider.notifier);
  return vacancy.searchVacancies(search);
});
final getVacancyBycategoryProvider=FutureProvider.family<List<Vacancy>,String>((ref,String categoryId){
final vacancy=ref.watch(vacancyControllerProvider.notifier);
return vacancy.getVacanciesByCategory(categoryId);
});
class VacancyController extends AsyncNotifier<AsyncValue<void>>{
  late VacanciesRepository _vacanciesRepository;
  
  @override
  AsyncValue<void>build(){
    _vacanciesRepository=ref.watch(vacancyRepositoryProvider);
    return const AsyncValue.data(null);
  }
  Future<List<Vacancy>>getVacancies()async{
    final res=await _vacanciesRepository.getJobVacancies();
    return switch(res){
      Left(value:final l)=> throw l,
      Right(value:final r)=>r
    };
  }
  Future<List<Vacancy>>getVacanciesByCategory(String categoryId)async{
    final res=await _vacanciesRepository.getJobVacanciesByCategory(categoryId);
    return switch(res){
      Left(value:final l)=> throw l,
      Right(value:final r)=>r
    };
  }

  Future<Vacancy>getVacancyById(String id)async{
    final res=await _vacanciesRepository.getVacancyById(id);
    return switch(res){
      Left(value:final l)=>throw l,
      Right(value:final r)=>r
    };
  }

  Future<List<Vacancy>>searchVacancies(String search)async{
    final res=await _vacanciesRepository.searchVacancies(search);
    return switch(res){
      Left(value:final l)=>throw l,
      Right(value:final r)=>throw r
    };
  }
  
}