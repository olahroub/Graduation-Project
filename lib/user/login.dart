import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../show_error.dart';
import '../utils/shared.dart';
import '../widgets/edit_text.dart';

import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  var dio = Dio();
  initState(){
    super.initState();
    ifphoneexists();
  }

  ifphoneexists() async {

     String p = Shared.shared!.getString("phone") ?? "";
     phone.text = p;
  }


  login(BuildContext context) async{
    var data = {
      "phone":phone.text,
      "password":password.text,
    };


    // var r = await http.get(Uri.parse("http://10.0.2.2:8000/api/users/all"));
    // print(r.body);
    //
    // return;
    //print("GGG");
    var  res = await dio.post("http://10.0.2.2:8000/api/users/login" , data: data);
    if(res.data["status"] == false){
      showError(context, res.data["msg"]);
      return;
    }

   // print(res.data);
    //return;
    var user = res.data["data"];
    Shared.shared!.setString("logged","YES");
    Shared.shared!.setString("name",user["name"]);
    Shared.shared!.setInt("id",user["id"]);
    Shared.shared!.setString("phone",user["phone"]);
    Shared.shared!.setString("type",user["type"]);
    if(user["type"]=="customer") {
      Navigator.of(context).pushReplacementNamed("customer_home");
    }else{
      Navigator.of(context).pushReplacementNamed("vendor_home");
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.pink[40],
      body: Center(
         child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.asset('assets/baytiyat.jpeg' ,
                  height: 150.0,
                  width: 150.0,
                  fit: BoxFit.cover,),

                SizedBox(height: 20),

                Text('SIGN IN' ,
                    style: GoogleFonts.robotoCondensed(
                        fontSize:30, fontWeight:FontWeight.bold)),

             Text(' Welcome back! Nice to see you again :-) ' ,
                 style: GoogleFonts.robotoCondensed(
                     fontSize:15 )),

                SizedBox(height: 10),
                TextFormField(controller: phone,
                  validator: (value){
                  if(value!.isEmpty){
                    return 'يرجى ادخال رقم الهاتف' ;
                  }
                  return null;
                  }),

             SizedBox(height: 30),

             Padding(
               padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
               child: Container(
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(12),
                 ),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                   child: TextField(
                     controller: phone,
                     decoration: InputDecoration(
                       border: InputBorder.none,
                       hintText: 'رقم الهاتف',
                     ),
                   ),
                 ),
               ),
             ),

             SizedBox(height: 8),

             Padding(
               padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
               child: Container(
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(12),
                 ),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                   child: TextField(
                     controller: password,
                     obscureText: true,
                     decoration: InputDecoration(
                       border: InputBorder.none,
                       hintText: 'كلمة السر',
                     ),
                   ),
                 ),
               ),
             ),

                SizedBox(height: 15),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap:() {
                      if (phone.text.trim() == "يرجى ادخال رقم الهاتف") {
                        return null;
                      }
                      login(context);
                    },

                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.pink[300],
                            borderRadius: BorderRadius.circular(12.0)
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
                  ),


                    TextButton(onPressed: (){
                      Navigator.of(context).pushReplacementNamed("register");
                    },
                        child: Text("إنشاء حساب جديد",
                          style: GoogleFonts.robotoCondensed(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize:12,
                          ),)
                    )
              ],
            ),
      ),
      ),
        );
  }
}
