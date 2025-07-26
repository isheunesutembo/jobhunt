import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobhunt/core/pagination_state/pagination_state.dart';
import 'package:jobhunt/features/vacancy/repository/vacanciesrepository.dart';
import '../models/vacancy.dart';
final vacancyControllerProvider=AsyncNotifierProvider<VacancyController,PaginationState<Vacancy>>(VacancyController.new);
final getVacanciesProvider=FutureProvider((ref){
  final vacancies=ref.watch(vacancyControllerProvider.notifier);
  ref.keepAlive();
  return vacancies.getVacancies(page: 1);

});
final searchQueryProvider = StateProvider<String>((ref) => "");
final getVacancyById=FutureProvider.family((ref,String id){
  final vacancy=ref.watch(vacancyControllerProvider.notifier);
  return vacancy.getVacancyById(id);
});

final searchVacancy=FutureProvider<List<Vacancy>>((ref)async{
  final vacancy=ref.watch(vacancyControllerProvider.notifier);
  final query=ref.watch(searchQueryProvider);
  if(query.isEmpty){
    return await  vacancy.getVacancies(page: 1);
  }else{
    return await vacancy.searchVacancies(query);
  }
});
final getVacancyBycategoryProvider=FutureProvider.family<List<Vacancy>,String>((ref,String categoryId){
final vacancy=ref.watch(vacancyControllerProvider.notifier);
ref.keepAlive();
return vacancy.getVacanciesByCategory(categoryId);
});
class VacancyController extends AsyncNotifier<PaginationState<Vacancy>>{
  late VacanciesRepository _vacanciesRepository;
  int _page=1;
  int _limit=10;
  
  @override
  FutureOr<PaginationState<Vacancy>>build()async{
    
    _vacanciesRepository=ref.watch(vacancyRepositoryProvider);

    return _fetchPage();
  }
   
  Future<List<Vacancy>>getVacancies({required int page})async{
    final res=await _vacanciesRepository.getJobVacancies(page: _page,limit: _limit);
   
    return switch(res){
      Left(value:final l)=> throw l,
      Right(value:final r)=>r
    };
  }

  Future<PaginationState<Vacancy>> _fetchPage(
      {bool reset = false}) async {
    _page = 1;
    final carListings = await getVacancies(page: _page);
    return PaginationState(
      data: carListings,
      isLoadingMore: false,
      hasNext: carListings.length == _limit,
    );
  }

  Future<void>loadMore()async{
    if (state.value?.isLoadingMore == true || state.value?.hasNext == false) {
      return;
    }

    state = AsyncData(state.value!.copyWith(isLoadingMore: true));
    final nextPage = _page + 1;
    final newCarListings = await getVacancies(page: nextPage);
    if (newCarListings.isNotEmpty) {
      _page = nextPage;
    }
    state = AsyncData(state.value!.copyWith(
        data: [...state.value!.data, ...newCarListings],
        isLoadingMore: false,
        hasNext: newCarListings.length == _limit));
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
      Right(value:final r)=> r
    };
  }
  
}