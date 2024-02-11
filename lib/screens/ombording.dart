


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test1/models/ombmodels.dart';
import 'package:test1/screens/home.dart';

class Ombordingscreens extends StatefulWidget {
  const Ombordingscreens({super.key});

  @override
  State<Ombordingscreens> createState() => _OmbordingscreensState();
}

class _OmbordingscreensState extends State<Ombordingscreens> {

  int currentindex=0;
  late PageController _controller;

  @override
  void initState(){
       _controller= PageController(initialPage: 0);
       super.initState();
  }

  @override
void dispose(){
  _controller.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: contents.length,
            controller: _controller,
            onPageChanged: (int index) {setState(() {
               currentindex=index;
            }); },
            itemBuilder: (BuildContext context, int index) {  
              return Padding(padding: EdgeInsets.all(20),
              child: Column(
                children: [
                 SvgPicture.asset(contents[index].image,height:300),

                  Text(contents[index].title,
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.grey,
                        ),),

                  Text(contents[index].discription,
                   textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),)
                ],
              ),
              );
            },
            
          )),
           
           Container(
            
             child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                      ...List.generate(contents.length, (index) => Container(
              height:10,
             width:currentindex ==index ? 25:10,
             margin: EdgeInsets.only(right: 10),
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.orangeAccent
             ),
                      ))

              ],
             )
           ),
          
                   Container(
            height: 60,
            margin: EdgeInsets.all(40),
            width: double.infinity,
            child: OutlinedButton(
             child: Text(currentindex == contents.length - 1 ? "Continue" : "Next"),
              onPressed: () {
                if (currentindex == contents.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomeScreens(),
                    ),
                  );
                }
                _controller.nextPage(
                  duration: Duration(milliseconds: 100), curve: Curves.bounceInOut,
                );
                  }
                  ))
            
        ],
      ),
    );
  }
}