import 'package:flutter/material.dart';

import '../../vacancy/models/company.dart';


class CompanyProfileWidget extends StatelessWidget {
  Company company;
  CompanyProfileWidget({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (company.logo != null ) ...{
                Image.network(
                  company.logo.toString(),
                  height: 50,
                  width: 50,
                )
              } else ...{
                Image.asset(
                  "assets/images/developer.png",
                  height: 50,
                  width: 50,
                )
              },Text(company.name.toString(),
              style:const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
              
            ],
          ),
        ),
      ),
    );
  }
}
