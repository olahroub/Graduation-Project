import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileGuest extends StatefulWidget {
  const ProfileGuest({super.key});

  @override
  State<ProfileGuest> createState() => _ProfileGuestState();
}

class _ProfileGuestState extends State<ProfileGuest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[40],
      appBar: AppBar(
        title: Text('حولنا'),
        centerTitle: true,
      ),
      body: ListView(
        children: [

          ListTile(
            title: Text('تسجيل دخول / إنشاء حساب '),
            titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("login");
            },
          ),
          Divider(),
          ListTile(
            title: Text('الإصدار'),
            subtitle: Text('3.0.8'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){

              showDialog(
                  context: context,
                  builder: (context)=>AlertDialog(

                    content: Text(" . إنه أحدث إصدار",
                      textAlign: TextAlign.center,),
                    actions: [
                      Center(
                        child: ElevatedButton(onPressed: (){
                          Navigator.of(context).pop();
                        },
                          child: Text("حسنًا"),

                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                            minimumSize: MaterialStateProperty.all(Size(double.infinity, 20)),
                            side: MaterialStateProperty.all(BorderSide(
                              color: Colors.black,
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
              Navigator.of(context).pushNamed("about");
            },
          ),

        ],
      ),

    );
  }
}
