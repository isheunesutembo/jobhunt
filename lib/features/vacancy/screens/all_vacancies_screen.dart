import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobhunt/features/vacancy/controllers/vacancycontroller.dart';
import 'package:jobhunt/features/vacancy/screens/vacancy_details_screen.dart';
import 'package:jobhunt/features/vacancy/widgets/vacancy_item.dart';
import 'package:jobhunt/util/errortext.dart';
import 'package:jobhunt/util/loader.dart';

class AllVacanciesScreen extends ConsumerStatefulWidget {
  const AllVacanciesScreen({super.key});

  @override
  ConsumerState<AllVacanciesScreen> createState() => _AllVacanciesScreenState();
}

class _AllVacanciesScreenState extends ConsumerState<AllVacanciesScreen> {

  final ScrollController _scrollController=ScrollController();


  void _onScroll(){
    if(_scrollController.position.pixels==
    _scrollController.position.maxScrollExtent){
      ref.read(vacancyControllerProvider.notifier).loadMore();}

  }

  @override
  void initState() {
    
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final state=ref.watch(vacancyControllerProvider);
    final notifier=ref.watch(vacancyControllerProvider.notifier);
    final vacancies=ref.watch(getVacanciesProvider);
    return state.when(data: (data){
      return NotificationListener<ScrollNotification>(
        onNotification: (scrollInfo){
          if(scrollInfo.metrics.pixels==scrollInfo.metrics.maxScrollExtent){
            notifier.loadMore();
          }
          return false;
        },
        child: Scaffold(   appBar: AppBar(
        title: const Text("All Vacancies"
        ,style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),),
       
        
      ),body: 
         
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics:const BouncingScrollPhysics(),
                      itemCount: data.data.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if(index<data.data.length){
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const VacancyDetailsScreen(
                                        ),settings: RouteSettings(arguments: data.data[index])));
                            },
                            child: VacancyItemWidget(
                              vacancy: data.data[index],
                            ));
                        }else{
                          const Center(child: LinearProgressIndicator(color: Colors.orange,),);
                        }
                        
                      }),
                ),
                if(state.value!.hasNext!||(state.isLoading&&state.hasValue))...{
                   const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: LinearProgressIndicator(
                 backgroundColor: Colors.orange,
                  
                  ),
                ),
              
                }
              ],
            ),
                

                
                
          
          
      ));

    }, error: (error,stackTrace)=>ErrorText(error: error.toString()), loading: ()=>const Loader());
  }
}