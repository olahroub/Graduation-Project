import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/shared.dart';
import 'package:baytiyat/show_error.dart';
import '../widgets/edit_text.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  List<String> types = ["vendor", "customer"];
  String? type = "customer";

  var dio = Dio();

  register(BuildContext context) async{


    FormData formData = FormData.fromMap({
      "type": "${type}",
      "name":name.text,
      "phone":phone.text,
      "password":password.text
    });


     var res = await dio.post(
         "http://10.0.2.2:8000/api/users/register", data: formData);


    if(res.data["status"] == false){
      showError(context, res.data["msg"]);
      //alert msg
      return;
    }
    var user = res.data["data"];
    Shared.shared!.setString("logged","YES");
    Shared.shared!.setString("name",user["name"]);
    Shared.shared!.setString("phone",user["phone"]);
    Shared.shared!.setString("type",user["type"]);
    Shared.shared!.setInt("id",user["id"]);

    if(type=="customer") {
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

            Text('SIGN UP' ,
                style: GoogleFonts.robotoCondensed(
                fontSize:30, fontWeight:FontWeight.bold)),

            SizedBox(height: 20),

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
                    controller: name,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'اسم المستخدم',
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 6),

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

            SizedBox(height: 6),

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

            DropdownButton(
              value: type,
                items: types.map((e){
              return DropdownMenuItem(child: Text(e),
              value: e);
            }).toList(),
                onChanged: (n){
              setState(() {
                type = n;
              });

                }) ,

            SizedBox(height: 15),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: GestureDetector(
                onTap:() {
                  if (phone.text.trim() == "يرجى ادخال رقم الهاتف") {
                    return null;
                  }
                  register(context);
                  // Navigator.of(context).pushReplacementNamed("vendor_home");
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
                          child: Text(" إنشاء حساب جديد " ,
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
              Navigator.of(context).pushNamed("login");
            },
                child: Text("هل لديك حساب بالفعل ؟",
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
