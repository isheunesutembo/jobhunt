import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/resume/controllers/resumecontroller.dart';
import 'package:jobhunt/features/auth/repository/localauthrepository.dart';
import 'package:jobhunt/util/errortext.dart';
import 'package:jobhunt/util/loader.dart';
import 'package:jobhunt/features/vacancyapplication/screens/send_application_screen.dart';
import 'package:jobhunt/features/vacancyapplication/widgets/company_profile_widget.dart';
import 'package:jobhunt/features/resume/widgets/resume_widget.dart';
import 'package:jobhunt/features/vacancy/widgets/vacancy_tags_list.dart';

import '../models/vacancy.dart';

class VacancyDetailsScreen extends ConsumerWidget {
  const VacancyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vacancy = ModalRoute.of(context)!.settings.arguments as Vacancy;
     final userId = ref.watch(localAuthRepositoryProvider).getUserId();
        final resume = ref.watch(getResumesProvider(userId.toString()));
      
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.share),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.favorite),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                vacancy.title.toString(),
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Salary:",style:TextStyle(fontWeight: FontWeight.w800)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "\$${vacancy.salary.toString()}",
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
              ),
            ),
       const     Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text("Experience",style: TextStyle(fontWeight: FontWeight.w800),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                vacancy.experience??"",
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
         const   Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text("Job Description:",style: TextStyle(fontWeight: FontWeight.w800),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                vacancy.description.toString(),
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
              ),
            ),
          const  Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text("Job Requirements",style: TextStyle(fontWeight: FontWeight.w800),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(vacancy.requirements??"",style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),),
            ),
              const  Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text("Benefits",style: TextStyle(fontWeight: FontWeight.w800),),
            ),
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(vacancy.benefits??"",style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),),
            ),
             Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: SizedBox(
                      height: 67,
                      width: 350,
                      child: ElevatedButton(onPressed: (){
                        showModalBottomSheet(backgroundColor: Colors.white,context: context, builder: (BuildContext context){
                          return   SafeArea(
                            child: SizedBox(height: 500,
                            width: double.infinity,
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
                              const SizedBox(height: 20,),
                              const Center(child: Text("Select Your Resume",
                              style: TextStyle(color: Colors.black,
                              fontSize: 18,fontWeight: FontWeight.bold),)),
                             resume.when(data: (data){
                            return ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                final  resume=data[index];
                                return data.isNotEmpty || data.first.resume !=null ? GestureDetector(onTap: (){
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=> SendApplicationScreen(vacancy:vacancy ,resume: resume,)));
                                },child: ResumeWidget(resume: data[index])):Column(children: [
                                  const Text("You have no resume ",
                                  style: TextStyle(color: Colors.black,fontSize: 10,
                                  fontWeight: FontWeight.w500),),
                                  ElevatedButton(onPressed: (){
                                    Navigator.pushNamed(context, "/addresumescreen");
                            
                                  }, child: const Text("Add Resume",style:TextStyle(color: Colors.black,fontSize: 10,
                                  fontWeight: FontWeight.w500),))
                                ],);
                              });
                             }, error: (error,stackTrace)=>ErrorText(error: error.toString()), loading: ()=>const Loader())
                            ],),),
                          );
                        });
                      },style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ) ), child: const Text("apply",
                      style:  TextStyle(color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),)),
                    ),
                  ),
                ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VacancyTagsList(vacancy: vacancy),
            ),
           const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Vacancy Listed By",style: TextStyle(color: Colors.black,fontSize:18,fontWeight: FontWeight.w500 ),),
            ),
            const SizedBox(height: 15,),
            CompanyProfileWidget(company: vacancy.company!)
          ],
        ),
      )),
    );
  }
}
