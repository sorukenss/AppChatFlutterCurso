import 'package:flutter/material.dart';

class LogoInitial extends StatelessWidget {

  final String title;
  
  const LogoInitial({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        margin: const EdgeInsets.only(top: 60),
        child:  Column(
          children: [
            Image(image: AssetImage('assets/tag-logo.png')),
            SizedBox(height: 15,),
            Text(title, style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),)
          ],
        ),
      ),
    );
  }
}