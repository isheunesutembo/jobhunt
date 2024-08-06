

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobhunt/models/vacancy.dart';
import 'package:jobhunt/repository/vacanciesrepository.dart';
final vacancyControllerProvider=AsyncNotifierProvider<VacancyController,List<Vacancy>>(VacancyController.new);
final getVacanciesProvider=FutureProvider((ref){
  final vacancies=ref.watch(vacancyControllerProvider.notifier);
  return vacancies.getVacancies();

});
final getVacancyById=FutureProvider.family((ref,String id){
  final vacancy=ref.watch(vacancyControllerProvider.notifier);
  return vacancy.getVacancyById(id);
});
class VacancyController extends AsyncNotifier<List<Vacancy>>{
  late VacanciesRepository _vacanciesRepository;
  
  @override
  List<Vacancy>build(){
    _vacanciesRepository=ref.watch(vacancyRepositoryProvider);
    return null!;
  }
  Future<List<Vacancy>>getVacancies()async{
    final res=await _vacanciesRepository.getJobVacancies();
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
  
}