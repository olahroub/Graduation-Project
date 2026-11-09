import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'About Us',
        home: Scaffold(
          appBar: AppBar(
            title: Text('ما هو Baytiyat'),
            centerTitle: true,
        ),
            body: const SingleChildScrollView(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: EdgeInsets.only(bottom: 7.0 , left: 14.0, right: 14.0, top: 20.0),
                  child: Text( "معلومات عنا" ,
                    style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20.0),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 7.0, bottom: 20.0, left: 14.0, right: 14.0),
                  child: Text( "بيتيات متجر لتسويق منتجات بيتية على الإنترنت  يقدم خدماته مباشرة إلى العملاء، تأسس التطبيق في سنة 2024، ويركز بشكل رئيسي على المنتجات المصنوعة في البيت مثل الوجبات (الطعام) ، حلويات ، ملابس ، إكسسوارات ومنتجات أخرى."
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 7.0, left: 14.0, right: 14.0),
                  child: Text( "مهمتنا" ,
                    style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20.0),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 7.0, bottom: 20.0, left: 14.0, right: 14.0),
                  child: Text( "نفخر بقدرتنا على جمع البائعين للمنتجات البيتية في تطبيق واحد (بيتيات) وقدرتهم على عرض منتجاتهم لتكون اسهل في الوصول الى الزبائن  مما يسهل على الزبون خدمة الحجز "
                  ),
                ),
      ]
    ),
    ),
        ),
    );
  }
}
