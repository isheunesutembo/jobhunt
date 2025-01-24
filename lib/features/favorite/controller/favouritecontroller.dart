

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobhunt/features/favorite/models/favourite.dart';
import 'package:jobhunt/features/favorite/repository/favouritesrepository.dart';
import 'package:jobhunt/util/utils.dart';
final favouriteControllerProvider=AsyncNotifierProvider<FavouriteController,AsyncValue<void>>(FavouriteController.new);
final getFavourites=FutureProvider.family((ref,String userId){
  final favourites=ref.watch(favouriteControllerProvider.notifier)
  .getFavourite(userId);
  return favourites;
});
class FavouriteController extends AsyncNotifier<AsyncValue<void>>{
 late  FavouriteRepository _favouriteRepository;

   @override
  AsyncValue<void>build(){
    _favouriteRepository=ref.watch(favouriteRepositoryProvider);
    return const AsyncValue.data(null);
  }
  Future<void>addToFavourite(String vacancyId,String userId,BuildContext context)async{
    final res=await _favouriteRepository.addToFavourites(vacancyId, userId);
    final val= switch(res){
      Left(value:final l)=>showSnackBar(context,l.message),
      Right(value:final r)=>showSnackBar(context, r.toString())
    };
  }

  Future<List<Favourite>>getFavourite(String userId,)async{
    final res=await _favouriteRepository.getFavourites(userId);
    return  switch(res){
      Left(value:final l)=>throw l,
      Right(value:final r)=>r
    };
  }
  Future<void>removeFavourite(String favouriteId,BuildContext context)async{
    final res=await _favouriteRepository.removeFavourite(favouriteId);
    final val= switch(res){
      Left(value:final l)=>showSnackBar(context,l.message),
      Right(value:final r)=>showSnackBar(context, r.toString())
    };
  }

}