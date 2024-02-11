

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/models/modelproduct.dart';

class Cartscreens extends StatefulWidget {
  const Cartscreens({super.key});

  @override
  State<Cartscreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<Cartscreens> {
void removeFromCart(BuildContext context, Film film){
  showDialog(context: context, builder: (context)=>
  AlertDialog(
    content: const Text("remove from cart"),
    actions: [
      MaterialButton(onPressed: ()=>Navigator.pop(context),
      child:const Text("Clean")),
        MaterialButton(onPressed: ()=>{
          Navigator.pop(context),
          context.read<FilmStore>().removeFromCart(film)
        },
      child:const Text("Yes")),
    ],
  )
  );
}
 int currentNumber =0;
void incrementNumber() {
    setState(() {
      currentNumber++;
    });
  }

  void decrementNumber() {
    setState(() {
 if (currentNumber > 0) {
        currentNumber--;
      }    });
  }
  @override
  Widget build(BuildContext context) {
    final Cart=context.watch<FilmStore>().cart;
    return Scaffold (
      appBar: AppBar(
        leading:IconButton(icon: Icon(Icons.arrow_back), onPressed: ()=>Navigator.pop(context),)
      ),
      body: Column(
        children: [
          Expanded(
            child: Cart.isEmpty
            ? const Center(child:Text("cart is empty ... "))
            : ListView.builder(
              itemCount: Cart.length,
              itemBuilder: (BuildContext context, int index) { 
                return ListTile(
                     title: Text(Cart[index].name),
                     subtitle:  Text(Cart[index].price.toStringAsFixed(2)),
                     trailing: IconButton(onPressed: ()=>removeFromCart(context,Cart[index]), icon: Icon(Icons.remove_circle_outlined)),
                     leading:Image.asset(Cart[index].image,height:60)
                );
            
               },)
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20)
            ),
            padding:EdgeInsets.all(20),
            height:80,
            width:double.infinity,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(onPressed: (){}, child: Text("pay")
                ),
                Row(
                  children: [
                    GestureDetector(
          onTap: incrementNumber,
                      child:Container(
                         height:25,
                          width:25,
                        decoration:BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ) ,
                        child:Icon(Icons.add,color: Colors.white,)
                      )
                    ),
                  Text(currentNumber.toString()), // Display the current number
        GestureDetector(
          onTap: decrementNumber,
                      child:Container(
                         height:25,
                          width:25,
                        decoration:BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ) ,
                        child:Icon(Icons.remove,color: Colors.white,)
                      )
                    )
                  ],
                )

              ],
            )
          )
        ],
      ),
    );
  }
  
}