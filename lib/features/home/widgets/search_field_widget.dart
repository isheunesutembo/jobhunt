import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 350,
      child: Card(
        elevation: 5,
        child: TextField(
          onChanged: (value){
        
          },
          decoration:  InputDecoration(
            contentPadding: const EdgeInsets.all(20),
            prefixIcon: const Icon(Icons.search,color: Colors.grey,),
            hintText: 'Search For a Job',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none
            )
            
          ),
        ),
      ),
    );
  }
}