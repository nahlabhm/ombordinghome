


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/models/modelproduct.dart';

class Films extends StatelessWidget {
  final Film film;
  const Films({super.key,required this.film});

void addtocart(BuildContext context){
  showDialog(context: context, builder: (context)=>
    AlertDialog(
      content: Text("add to cart"),
      actions: [
        MaterialButton(onPressed: ()=>Navigator.pop(context),
        child: Text("clean") ,),
         MaterialButton(
          onPressed: (){Navigator.pop(context);
          context.read<FilmStore>().addToCart(film);
          },
        child: Text("Yes") ,)
      ],
    )
  );
}
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
      ),
         width:200,
      margin:EdgeInsets.all(10),
      padding:EdgeInsets.all(20),
      child:Stack(
              children: [
         
         Column(
        children: [
      
          Image.asset(film.image,
          height: 100,
          width:100 ),
          SizedBox(height: 10,),
          Text(film.name),
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Text(film.price.toStringAsFixed(2)+'\$'),
            Row(
              children: [
                            IconButton(icon: Icon(Icons.star,color: Colors.deepOrangeAccent,), onPressed: () {  },),
                                                        Text(film.rating),


              ],
            )
            ]
          ),
         OutlinedButton(onPressed: ()=>addtocart(context), child: Text("add cart"))
        ],
      ),
       Positioned(
            top: 4,
            left: 4,
            child:Center(
              child: Container(
                
                height: 35,
                width: 35,
                child: IconButton(icon: Icon(Icons.star,color: Colors.deepOrange,), onPressed: () {  },),
          )))
              ]
      )
    );
  }
}