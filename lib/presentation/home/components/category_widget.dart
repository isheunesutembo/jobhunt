import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/domain/models/categorymodel.dart';
import 'package:jobhunt/presentation/home/viewmodel/homeviewmodel.dart';
import 'package:jobhunt/presentation/util/errortext.dart';
import 'package:jobhunt/presentation/util/loader.dart';

class CategoryWidget extends ConsumerWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
   
    return Container(
      width: double.infinity,
      height: 100,
      child: ref.watch(getCategoriesProvider).
      when(data: (data){
        return ListView.builder(scrollDirection: Axis.horizontal,physics:const ClampingScrollPhysics(),itemCount: data.length,itemBuilder: (context,index){
         return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            CachedNetworkImage(imageUrl: data[index].fullImagePath,
            placeholder: (context,url)=>Image.asset("assets/images/developer.png",height: 60,width: 60,
            errorBuilder: (context, error, stackTrace) => Image.asset("assets/images/developer.png",height: 60,width: 60,),),),
            
            Text(data[index].title.toString(),
            style:const TextStyle(color: Colors.black,fontSize: 15,
            fontWeight: FontWeight.w500),)
          ],),
         );
        });

      }, error: (error,stackTrace)=>ErrorText(error: error.toString()), loading: ()=>const Loader()) ,

    );
  }
}