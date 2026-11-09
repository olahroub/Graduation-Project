import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntellectualProperty extends StatelessWidget {
  const IntellectualProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Intellectual Property ',
        home: Scaffold(
        appBar: AppBar(
        title: const Text('الملكية الفكرية'),
          centerTitle: true,
        ),
          body: const SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [

              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text( "في حالة وجود أي مخاوف أو شكاوى بشأن انتهاك محتمل لحقوق الملكية الفكرية ، يرجى إرسال بريد إلكتروني إلينا على العنوان service@lingeriedealy.com ، مع تحديد الحقوق المزعوم انتهاكها والمنتج (المنتجات) المتهم على وجه التحديد." ,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text( "（عنوان البريد الإلكتروني هذا مخصص فقط لحقوق الملكية الفكرية والقضايا القانونية. قد لا تحصل الأسئلة الأخرى على استجابة）"
                    ,style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ),
              ],
            ),
        ),
        ),
        );
  }
}
