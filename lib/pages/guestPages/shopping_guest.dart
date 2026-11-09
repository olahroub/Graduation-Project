import 'dart:ui';

import 'package:baytiyat/pages/guestPages/profile_guest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_guest.dart';

class ShoppingGuest extends StatefulWidget {
  const ShoppingGuest({super.key});

  @override
  State<ShoppingGuest> createState() => _ShoppingGuestState();
}

class _ShoppingGuestState extends State<ShoppingGuest> {

  var guestPages = [
    HomeGuest(),
    ShoppingGuest(),
    ProfileGuest()
  ];

  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.shopping_cart_outlined, size: 100, color: Colors.grey[300],),

               SizedBox(height: 10),

               Text(' عربة التسوق الخاصة بك فارغة ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )
              ),

               SizedBox(height: 7),

               Text(" تسجيل الدخول لرؤية عربة التسوق",
                   style: TextStyle(
                     fontSize: 15,
                     color: Colors.grey
                   )
               ),

            SizedBox(height: 15),

              GestureDetector(onTap: (){
                Navigator.of(context).pushReplacementNamed("login");
              },
                child:  Container(
                    padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 190),
                    child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.pink[300],
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: Center(
                          child: Text("تسجيل الدخول " ,
                            style: GoogleFonts.robotoCondensed(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                          ),),
                      )
                  )
              ),
            ),
            ],
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (index){
          switch (index){
            case 0 :
              Navigator.of(context).pushNamed("home_guest");
            case 1 :
              Navigator.of(context).pushNamed("shopping_guest");
            case 2 :
              Navigator.of(context).pushNamed("profile_guest");
          }
          setState(() {
            this.index = index;
          });
        },
         selectedItemColor: Colors.pink[300],

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "متجر"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "حقيبة التسوق"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "أنا"),
        ],
    ),

    );
  }
}
