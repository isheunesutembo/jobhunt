import 'package:flutter/material.dart';

class SettingsItemWidget extends StatelessWidget {
  String title;
  IconData icon;
 SettingsItemWidget({super.key,required this.title,
  required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(leading: Text(title,
           style: const TextStyle(color: Colors.black,
           fontSize: 15,
           fontWeight: FontWeight.w400),
        ),
        trailing: Icon(icon,size: 30,),),
      const  Padding(
          padding:EdgeInsets.all(8.0),
          child: Divider(thickness: 3,),
        )
      ],
    );
  }
}
