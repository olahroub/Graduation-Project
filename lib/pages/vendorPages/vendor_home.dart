
import 'package:baytiyat/pages/vendorPages/vendor_shopping.dart';
import 'package:baytiyat/user/profile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'orders.dart';

class VendorHome extends StatefulWidget {
  const VendorHome({super.key});

  @override
  State<VendorHome> createState() => _VendorHomeState();
}

class _VendorHomeState extends State<VendorHome> {

  List<Map<String,dynamic>> posts = [];
  List<Map<String,dynamic>> vendors = [];

  @override
  void initState() {
    super.initState();
    getposts();
    getVendors();
  }

  var dio = Dio();
  getposts() async{
    var res = await dio.get( "http://10.0.2.2:8000/api/products/all");
    var response = ProductsResponse.fromJson(res.data);
    if(response.status == false){

      return;
    }
    setState(() {
      this.posts = response.data.cast<Map<String, dynamic>>();
    });
  }

  getVendors() async{
    var res = await dio.get("http://10.0.2.2:8000/api/users/vendors");
    var response = VendorsResponse.fromJson(res.data);
    if(response.status == false){

      return;
    }
    setState(() {
      this.vendors = response.data.cast<Map<String, dynamic>>();
      print(this.vendors);
    });
  }
  var pages = [
    VendorHome(),       //متجر
    VendorShopping(), //حقيبة التسوق
    Orders(),    // الطلبيات
    Profile()  //انا
  ];

  int index = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
          child: ListView.builder(
              itemCount: this.vendors.length,
              itemBuilder: (ctx,index){
            return ListTile(
              title: this.vendors[index]["name"],
              onTap: (){
                 Navigator.of(context).pushNamed("vendor_products",arguments: this.vendors[index]["id"]);
              },
            );
          }
          ),
      ),

      body: Column(
        children: [
           Padding(
             padding: const EdgeInsets.all(12.0),
             child: TextField(
                  decoration: InputDecoration(
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
                ),
                ),
                filled: true,
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.grey[100],
                hintStyle: new TextStyle(color: Colors.grey[600]),
                hintText: "البحث",
                ),
                autofocus: false,
                ),
           ),


             TabBar(
              labelColor: Colors.black,
              tabs: [
                Tab(
                  text: 'الطعام',
                ),
                Tab(
                  text: 'الحلويات',
                ),
                Tab(
                  text: 'الملابس',
                ),
                Tab(
                  text: 'الاكسسوارات',
                ),
              ], // list of tabs
            ),

          SizedBox(
            height: 10,
            child: Container(
              color: Color(0xFFf5f6f7),
            ),
          ),

          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context,index){
                // return Post(post:posts[index]);
              })


                  ],
          ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink[300],
        elevation: 10.0,
        child: Icon(Icons.add, color: Colors.white, weight: 50.0),
        onPressed: () async{
           await Navigator.of(context).pushNamed("add_product");

           getposts();
        },
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

class ProductsResponse {
  ProductsResponse({
    required this.status,
    required this.msg,
    required this.data,
  });
  late final bool status;
  late final String msg;
  late final List<ProductPost> data;

  ProductsResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    data = List.from(json['data']).map((e)=>ProductPost.fromJson(e)).toList();
  }

}

class ProductPost {
  ProductPost({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.photo,
    required this.price,
  });
  late final int id;
  late final String name;
  late final int categoryId;
  late final String photo;
  late final int price;

  ProductPost.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    photo = json['photo'];
    price = json['price'];
  }
}

class VendorsResponse {
  VendorsResponse({
    required this.status,
    required this.msg,
    required this.data,
  });
  late final bool status;
  late final String msg;
  late final List<Vendor> data;

  VendorsResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    data = List.from(json['data']).map((e)=>Vendor.fromJson(e)).toList();
  }

}

class Vendor {
  Vendor({
    required this.id,
    required this.name,
    required this.phone,
    required this.type,
  });
  late final int id;
  late final String name;
  late final String phone;
  late final String type;

  Vendor.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    type = json['type'];
  }

}