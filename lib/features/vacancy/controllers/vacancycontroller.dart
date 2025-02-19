import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobhunt/features/vacancy/repository/vacanciesrepository.dart';
import '../models/vacancy.dart';
final vacancyControllerProvider=AsyncNotifierProvider<VacancyController,List<Vacancy>>(VacancyController.new);
final getVacanciesProvider=FutureProvider((ref){
  final vacancies=ref.watch(vacancyControllerProvider.notifier);
  ref.keepAlive();
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
ref.keepAlive();
return vacancy.getVacanciesByCategory(categoryId);
});
class VacancyController extends AsyncNotifier<List<Vacancy>>{
  late VacanciesRepository _vacanciesRepository;
  
  @override
  FutureOr<List<Vacancy>>build()async{
    
    _vacanciesRepository=ref.watch(vacancyRepositoryProvider);
    refreshData();
    return await  getVacancies();
  }
   Future<void> refreshData() async {
    state = const AsyncValue.loading(); // Set state to loading
    state = await AsyncValue.guard(() async => await  getVacancies()); // Fetch new data
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