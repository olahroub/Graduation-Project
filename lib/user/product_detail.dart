import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

// الصفحة التي تظهر عند الضغط على صورة المنتج وتظهر تفاصيل معلومات المنتج اكثر

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.post});
  final dynamic post;
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  var dio = Dio();

  List<ProductDetails> products = [];
  int index = 0;
  bool isLoading = true;


  addproducts() async{
    var res = await dio.get( "http://10.0.2.2:8000/api/products/all");
    var response = ProductsResponse.fromJson(res.data);
    if(response.status == false){

      return;
    }
    setState(() {
      this.products = response.data;
    });
  }

   addToCart1(ProductDetails data) async {
    return  addproducts ;
  }

 Future addToCart(ProductDetails item) async {
    isLoading = true;
    var result =  addToCart1(item);
    var reslt = addproducts();
    isLoading = false;
    return result;
    return reslt;
  }

  @override


  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(

    ),
          body: Container(

              child: ListView(
                children: <Widget>[
                Stack(
                children: <Widget>[
                  Container(

                    color: Colors.white,
                    child: Column(
                    children: <Widget>[
                      Container(
                      height: 280.0,
                      width:double.infinity,
                      child: Image.asset('assets/baytiyat.jpeg',
                        //this.products[index].photo ,
                        fit: BoxFit.cover,

                      ),
                      ),
                    ],
                    ),
                    ),

                ],
                ),
                Divider(
                color: Colors.grey[300],
                height: 1.0,
                ),
                Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 13.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Text(
                      "\$20",
                    //  "\$${this.products[index].price.toString()}" ,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0,),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric( vertical: 5.0),
                      child: Text(
                        "كبة مقلية",
                      // this.products[index].name ,
                      style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
                      ),
                    Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      "كبة بحشوة لحمة وصنوبر ،سعر الحبة 2 شيكل",
                      //  this.products[index].details,
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[500]),
                    )
                    ),
                      Padding(
                          padding: EdgeInsets.only(top: 18.0),
                          child: TextField(
                            decoration:InputDecoration(
                              hintText: 'أضف تفاصيل للمنتج الذي تريد شراؤه إذا كان يوجد',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 0.5),


                              )
                            ) ,
                          )
                      ),
                    ],
                    ),
                    )
                    ],
                    ),
                    ),
                bottomNavigationBar: Container(
                  height: 70.0,
                  decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                  top: BorderSide(color: Colors.grey.shade300, width: 1.0))),
                  child:
                    GestureDetector(
                      onTap:() {

                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Item added in cart successfully")));
                      },

                      child: Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 50.0),
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                            color: Colors.pink[300],
                            ),
                            child: Center(
                            child: Text(" أضف إلى عربة التسوق " ,
                            style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                                            ),),
                                            )
                                            )
                                            ),
                      ),
    ),

 )
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
  late final List<ProductDetails> data;

  ProductsResponse.fromJson(Map<String, dynamic> json){
  status = json['status'];
  msg = json['msg'];
  data = List.from(json['data']).map((e)=>ProductDetails.fromJson(e)).toList();
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

