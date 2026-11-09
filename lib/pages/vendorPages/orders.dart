import 'package:baytiyat/pages/vendorPages/vendor_home.dart';
import 'package:baytiyat/pages/vendorPages/vendor_shopping.dart';
import 'package:flutter/material.dart';

import '../../user/profile.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  var pages = [
    VendorHome(),       //متجر
    VendorShopping(), //حقيبة التسوق
    Orders(),    // الطلبيات
    Profile()  //انا
  ];

  int index = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(



        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (index){
          switch (index){
            case 0 :
              Navigator.of(context).pushNamed("vendor_home");
            case 1 :
              Navigator.of(context).pushNamed("vendor_shopping");
            case 2 :
              Navigator.of(context).pushNamed("orders");
            case 3 :
              Navigator.of(context).pushNamed("profile");
          }
          setState(() {
            this.index = index;
          });
          },

          selectedItemColor: Colors.pink[300],
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "متجر"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "حقيبة التسوق"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "الطلبيات"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "أنا"),

          ],
          ),
          );
        }
      }
