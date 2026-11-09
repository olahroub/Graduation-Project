import 'package:baytiyat/pages/vendorPages/vendor_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../user/profile.dart';
import 'orders.dart';


class VendorShopping extends StatefulWidget {
  const VendorShopping({super.key});

  @override
  State<VendorShopping> createState() => _VendorShoppingState();
}

class _VendorShoppingState extends State<VendorShopping> {

  List<ProductDetails> carts = [];

  var pages = [
  VendorHome(),       //متجر
  VendorShopping(), //حقيبة التسوق
  Orders(),    // الطلبيات
  Profile()   //انا
  ];

  int index = 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: carts.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.blueGrey.shade200,
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      child: Image.asset(this.carts[index].photo ,
                        fit: BoxFit.cover,

                      ),
                    ),

                    SizedBox(
                      width: 130,
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5.0,
                          ),

                          Text("hgytigk",
                              style: const TextStyle(
                                  fontWeight:
                                  FontWeight.bold)),

                          Text("kdddddjkhgyteeee32w3eds",
                              style: const TextStyle(
                                  fontWeight:
                                  FontWeight.bold)),

                          Text(this.carts[index].price.toString(),
                              style: const TextStyle(
                                  fontWeight:
                                  FontWeight.bold)),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      ),



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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "متجر"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "حقيبة التسوق"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "الطلبيات"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "أنا"),

        ],
      ),


    );
  }
}

class ProductDetails {
  ProductDetails({
    required this.id,
    required this.name,
    required this.details,
    required this.photo,
    required this.price,
  });
  late final int id;
  late final String name;
  late final String details;
  late final String photo;
  late final int price;

  ProductDetails.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    price = json['price'];
    price = json['details'];
  }
}


