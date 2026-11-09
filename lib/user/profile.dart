import 'dart:ui';

import 'package:baytiyat/user/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('حولنا'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('الإصدار'),
            subtitle: Text('3.0.8'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){

              showDialog(
                  context: context,
                  builder: (context)=>AlertDialog(
                    backgroundColor: Colors.white,
                    content: Text(" . إنه أحدث إصدار",
                    textAlign: TextAlign.center,),
                    actions: [
                      Center(
                        child: ElevatedButton(onPressed: (){
                         Navigator.of(context).pop();
                      },
                          child: Text("حسنًا",
                          style: TextStyle(
                            color: Colors.white,
                          )),

                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.pink[300]),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                          minimumSize: MaterialStateProperty.all(Size(double.infinity, 20)),
                          side: MaterialStateProperty.all(BorderSide(
                            color: Colors.pink,
                            width: 0.5,
                          )),
                          padding:MaterialStateProperty.all(EdgeInsets.all(15)),
                      ),

                      ),
                      ),

                    ],
                  )
              );
            },
          ),

          // Divider(),
          // ListTile(
          //   title: Text(' اللغة '),
          //   trailing: Icon(Icons.arrow_forward_ios),
          //   onTap: () {
          //
          //     DropdownButton<String>(
          //       value: 'العربية',
          //       onChanged:
          //       items: [
          //
          //         DropdownMenuItem(
          //           child: Text('العربية'),
          //           onTap:() {
          //             Get.updateLocale(Locale("ar"));
          //             Get.back();
          //           },
          //         ),
          //
          //         DropdownMenuItem(
          //           child: Text('English'),
          //           onTap:() {
          //             Get.updateLocale(Locale("en"));
          //             Get.back();
          //           },
          //         ),
          //       ],
          //     );
          //   },
          // ),

          Divider(),
          ListTile(
            title: Text('السياسة والخصوصية'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).pushNamed("privacy");
            },
          ),

          Divider(),
          ListTile(
            title: Text('شروط الخدمة'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).pushNamed("terms_service");
            },
          ),

          Divider(),
          ListTile(
            title: Text('الملكية الفكرية'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).pushNamed("intellectual_property");
            },
          ),

          Divider(),
          ListTile(
            title: Text('ما هو Baytiyat'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("about");
            },
          ),


        Divider(),
        ListTile(
          title: Text('حذف الحساب'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () async {
               final bool confirmed = await showDialog(
                context: context,
                builder: (context)=>AlertDialog(
                  backgroundColor: Colors.white,
                  title: Text('حذف الحساب',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                  content: Text('هل أنت متأكد من رغبتك في حذف حسابك؟'),
                  actions: <Widget>[
                    TextButton(
                      child: Text('إلغاء'),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                    TextButton(
                      child: Text('موافق'),
                      onPressed: () => Navigator.of(context).pop(true),
                    ),
                  ],
            ),
            );
            if (confirmed) {
    // إرسال طلب لحذف الحساب
    // ...

    // إظهار رسالة تأكيد
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
             content: Text('تم حذف حسابك بنجاح.'),
            ),
            );

            Navigator.of(context).pushReplacementNamed("register");
            }
          },
        ),
      ],
    ) ,


      bottomNavigationBar: SizedBox(
        height: 65.0,
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: Colors.grey, width: 1)
              )
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pushReplacementNamed("home_guest");
                } ,
                  child: const Text("تسجيل الخروج",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                    color: Colors.pink,
                  ),
                ),
              )
              // ElevatedButton(onPressed: (){
              //   Navigator.of(context).pushReplacementNamed("home_guest");
              // },

            ],
          ),
        ),

     ),

    );
  }
}
