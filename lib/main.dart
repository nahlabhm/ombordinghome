import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/models/modelproduct.dart';
import 'package:test1/screens/ombording.dart';

void main() {
  
  runApp( ChangeNotifierProvider(
      create: (BuildContext context)=>FilmStore(),
    child:const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
    
      ),
      home: const Ombordingscreens(),
    );
  }
}
