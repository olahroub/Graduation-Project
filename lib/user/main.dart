
import 'package:baytiyat/pages/profile_pages/intellectual_property.dart';
import 'package:baytiyat/pages/profile_pages/privacy.dart';
import 'package:baytiyat/pages/profile_pages/terms_service.dart';
import 'package:baytiyat/pages/vendorPages/add_product.dart';
import 'package:baytiyat/pages/profile_pages/about.dart';
import 'package:baytiyat/pages/vendorPages/vendor_products.dart';
import 'package:baytiyat/pages/vendorPages/vendor_shopping.dart';
import 'package:baytiyat/user/product_detail.dart';
import 'package:baytiyat/user/profile.dart';
import 'package:baytiyat/user/register.dart';
import 'package:baytiyat/pages/customerPages/customer_shopping.dart';
import 'package:baytiyat/utils/shared.dart';
import 'package:baytiyat/widgets/post.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/customerPages/customer_home.dart';

import '../pages/guestPages/home_guest.dart';
import '../pages/guestPages/profile_guest.dart';
import '../pages/guestPages/shopping_guest.dart';
import '../pages/vendorPages/orders.dart';

import '../pages/vendorPages/vendor_home.dart';
import 'login.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Shared.init();
  String logged = Shared.shared!.getString("product") ?? "No";
  runApp(TheApp(logged:logged,) );
}

class TheApp extends StatelessWidget {

  TheApp({super.key , required this.logged});
  String logged = "No";


  @override
  Widget build(BuildContext context) {
    String page = "profile"
        "";

  //  ProductPost p = ProductPost(id: 1, name: "name", categoryId: 1, photo: "photo", price: 1);
   // var p = {
   //   "photo":"",
   //   "name":"AAA",
   //   "price":"4.5"
   // };

    var v = {
      "photo":"",
      "name":"AAA",
      "price":"4.5",
      "description":"hgk,lttemyio7jl.6nmt54gbm"
    };
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
     locale: Locale("ar"),
     translations: Languages(),
     initialRoute: page,
        routes: {

          "home_guest": (context)=> HomeGuest(),
          "shopping_guest": (context)=> ShoppingGuest(),
          "profile_guest": (context)=> ProfileGuest(),


          "customer_home": (context)=> CustomerHome(),
          "customer_shopping": (context)=> CustomerShopping(),


           "vendor_home": (context)=> VendorHome(),
          "vendor_shopping": (context)=> VendorShopping(),
          "orders": (context)=> Orders(),
          "add_product": (context)=> AddProduct(),
          "vendor_products": (context)=>VendorProducts(),

          "login": (context)=> Login(),
          "register": (context)=>Register(),
          "profile": (context)=>Profile(),

          "about": (context)=> About(),
          "privacy": (context)=>Privacy(),
          "intellectual_property": (context)=>IntellectualProperty(),
          "terms_service": (context)=>TermsService(),

       //   "post": (context)=> Post(post: p ,),
          "product_detail":(context)=> ProductDetail(post: v,),

        },
    );

  }
}
class Languages extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    "en": {

    },
    "ar": {

    }
  };

}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          ],
        ),

      ),

      ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
