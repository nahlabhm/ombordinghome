


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/models/modelproduct.dart';
import 'package:test1/screens/cart.dart';
import 'package:test1/screens/films.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key,});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
 int  _selectedIndex=0;
late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      Cartscreens(),
      Cartscreens(), // Replace with the actual screen for films
    ];
  }

    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Add logic to navigate to the selected screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => _screens[_selectedIndex]),
    );
  }
  @override
  Widget build(BuildContext context) {
      final films = context.watch<FilmStore>().film;
    return Scaffold(
      
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu_open), onPressed: () {  },),
        actions: [
        IconButton(icon: Icon(Icons.shop_sharp), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Cartscreens()));  },), 
        SizedBox(width: 15,) ,
             Container(
        margin: EdgeInsets.only(right: 10),

        child: CircleAvatar(
          backgroundImage: AssetImage("assets/Profile Image.png"),
         )
       )
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration( 
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 160,
            width: double.infinity,
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(25),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Promotion 50%",
                style: TextStyle( 
                  color: Colors.white,
                  fontSize: 20
                ),),
                SizedBox(height: 20,),
                OutlinedButton(onPressed: (){}, 
                child: Text("Get Started",
                style: TextStyle( 
                  color: Colors.white,
                  fontSize: 14
                ),))
              ]),
              Image.asset("assets/pop-corn.png")
              ])
          ),
        Padding(padding: EdgeInsets.all(15),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Films New"),
            Text("see all")
          ],
       ),),
         Expanded(
            child: SizedBox(
              height: 550,
              child: Padding(padding: EdgeInsets.all(20),
              child:ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: films.length,
                itemBuilder: (BuildContext context, int index) {
                  return Films(film: films[index]);
                },)
       ) )),

       Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white
        ),
   margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
          padding: EdgeInsets.all(20),
                  child: Row(
          children: [
            Image.asset("assets/movies/the-black-demon.jpg",
            height: 80,),
          SizedBox(width: 20,),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
                Text( "the-black-demon"),
                Text("\$ 200")
             ],
            ),
           
          
          ],
        ),
       )
       ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }


}