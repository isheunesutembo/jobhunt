import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobhunt/data/local/sharedservice.dart';
import 'package:jobhunt/presentation/home/components/category_widget.dart';
import 'package:jobhunt/presentation/vacancy/components/vacancy_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    
    return Scaffold(
      appBar: AppBar(
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: (){
           SharedService.logOut(context);
          }, child: Text("Log Out")),
        )
      ],
      ),
      body: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,children: [
        const SizedBox(height: 120,child: CategoryWidget()),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
            children: [
          
              Flexible(
                child: SizedBox(
                  height: 60,
                  width: 330,
                  child: TextField(
                    decoration: InputDecoration(hintText: "Search for a job",
                    filled: true,suffixIcon: const Icon(Icons.search),border: OutlineInputBorder(borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ),
             Container(height: 40,width: 40,decoration: BoxDecoration(shape: BoxShape.rectangle,color: Colors.grey,borderRadius: BorderRadius.circular(5)),child: const Icon(Icons.tune,color: Colors.white,))
          
            ],
          ),
        ),
        
        const Padding(
           padding:  EdgeInsets.all(8.0),
           child: Text("Vacancies For You",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
         ),
          const SizedBox(height: 15,),
          SizedBox(height: height*0.7,child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: VacancyWidget(),
          ))
          
        ],),
      ),
    );
  }
}