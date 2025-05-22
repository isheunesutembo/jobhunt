import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    final searchQuery = ref.watch(searchQueryProvider);

    final vacancies = ref.watch(searchVacancy);

    return Scaffold(
      body: RefreshIndicator(
        backgroundColor: Colors.black,
        onRefresh: () async {
        return  ref.refresh(searchVacancy.future);
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
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Find Your Dream Job",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
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
                              ref.read(searchQueryProvider.notifier).state =
                                  value;
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 40),
                                prefixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.search,
                                    size: 30,
                                  ),
                                  color: Colors.black,
                                  onPressed: () {},
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
                  ],
                ),
              ),
              const JobCategoriesWidget(),
              const Padding(
                padding: EdgeInsets.only(right: 8, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Jobs",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              vacancies.when(
                  data: (vacancies) {
                    if (vacancies.isEmpty) {
                      return const Center(
                        child: Text(
                          'No vacancies found.',
                          style: TextStyle(fontSize: 16, color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    }
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: vacancies.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const VacancyDetailsScreen(),
                                        settings: RouteSettings(
                                            arguments: vacancies[index])));
                              },
                              child: VacancyItemWidget(
                                vacancy: vacancies[index],
                              ));
                        });
                  },
                  error: (error, stackTrace) =>
                      ErrorText(error: error.toString()),
                  loading: () => const Loader())
            ],
          ),
        ),
      ),
    );
  }
}
