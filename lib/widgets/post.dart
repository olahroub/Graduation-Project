import 'package:baytiyat/pages/customerPages/customer_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//شكل بطاقة المنتج المعروض بصفحة home

class Post extends StatefulWidget {
   Post({super.key, required this.post});

  ProductPost post;

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

             Image.network(
              widget.post.name ,
              width: 100,
              height: 200,
              fit: BoxFit.cover,
            ),

          SizedBox(height: 10.0,),
           Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                 Text(
                    widget.post.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                ),
              ),

                SizedBox(height: 10),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [
                           ElevatedButton(
                             onPressed:() {
                               Navigator.of(context).pushNamed("product");
                             },
                             child: Icon(Icons.add_shopping_cart)
                         )
                         ],
                       ),

                       Row(
                         children: [
                           Text(
                             widget.post.price.toString(),
                             style: TextStyle(
                               fontSize: 14,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),

                   // Row(
                   //   mainAxisAlignment: MainAxisAlignment.center,
                   //   children: [
                   //     Padding(
                   //       padding: EdgeInsets.symmetric(vertical: 30),
                   //       child:
                   //       ElevatedButton(
                   //           onPressed:() {
                   //             Navigator.of(context).pushReplacementNamed("product");
                   //           },
                   //           child: Icon(Icons.add_shopping_cart)
                   //       )
                   //     ),
                   //
                   //
                   //     SizedBox(width: 15),
                   //
                   //     Padding(
                   //       padding: EdgeInsets.all(30),
                   //       child:
                   //       Text(
                   //         widget.post["price"],
                   //         style: TextStyle(
                   //           fontSize: 14,
                   //           fontWeight: FontWeight.bold,
                   //         ),
                   //       ),
                   //     ),
                   //   ],
                   // ),
            ],
        )
        ),
          ],
        ),
      ),
    );
  }
}
