import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/jobcategory/widgets/jobcategorieswidget.dart';
import 'package:jobhunt/features/vacancy/controllers/vacancycontroller.dart';
import 'package:jobhunt/util/debouncer.dart';
import 'package:jobhunt/util/errortext.dart';
import 'package:jobhunt/util/loader.dart';
import 'package:jobhunt/features/vacancy/screens/vacancy_details_screen.dart';
import 'package:jobhunt/features/vacancy/widgets/vacancy_item.dart';

import '../../vacancy/models/vacancy.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool? isLoading;
  String? query;
  TextEditingController searchText = TextEditingController();
  late Future<List<Vacancy>> _vacancies;
  final Debouncer _debouncer = Debouncer(milliseconds: 500);

  _fetchVacancies([String? query]) async {
    setState(() {
      isLoading = true;
    });
    if (query?.isNotEmpty == true) {
      _vacancies =
          ref.watch(vacancyControllerProvider.notifier).searchVacancies(query!);
    } else {
      _vacancies = ref.watch(vacancyControllerProvider.notifier).getVacancies();
    }
  }
  

  @override
  Widget build(BuildContext context) {
    _vacancies=ref.watch(vacancyControllerProvider.notifier)
    .getVacancies();
    return Scaffold(
      
   
      body: RefreshIndicator(
        backgroundColor: Colors.black,
        onRefresh: (){
          return  ref.refresh(getVacanciesProvider.future);
         
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                ),
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,children: [
                  const SizedBox(height: 30,),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Find Your Dream Job",
                    style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.w700,color: Colors.white),),
                  ),
                   Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: Card(
                    color: Colors.white,
                    elevation: 5,
                    child: TextField(
                      onChanged: (value) {
                        _debouncer.run(() {
                          _fetchVacancies(value);
                        });
                      },
                      onSubmitted: (value) {
                        _fetchVacancies(value);
                      },
                      decoration: InputDecoration(
                       
                          contentPadding: const EdgeInsets.symmetric(vertical: 40),
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.search,size: 30,),
                            color: Colors.black,
                            onPressed: () {
                              _fetchVacancies(searchText.text);
                            },
                          ),
                          hintText: 'Search by job title ,skills',
                          
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                ),
              ),
             
                ],),
              ),
              const JobCategoriesWidget(),
             
         const    Padding(
               padding:  EdgeInsets.only(right: 8,left: 8),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Jobs",
                  style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),),
                     Text("See All",
                  style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w300),),
                ],
               ),
             ),
              FutureBuilder(future: _vacancies, builder: (context,snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return const Loader();
                }else if(snapshot.hasError){
                  return ErrorText(error: snapshot.error.toString());
                }else{
                  return ListView.builder(
              scrollDirection: Axis.vertical,
              physics:const NeverScrollableScrollPhysics(),
              itemCount: snapshot.data?.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final vacancies=snapshot.data?[index];
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VacancyDetailsScreen(
                                ),settings: RouteSettings(arguments: vacancies)));
                    },
                    child: VacancyItemWidget(
                      vacancy: vacancies!,
                    ));
              });
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
