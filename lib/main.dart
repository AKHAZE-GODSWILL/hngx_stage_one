
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hngx_stage_one/ProfilePage.dart';


Future <void> main() async{

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Stage One',
      

      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),

      home: ProfilePage()
    );
  }
}

