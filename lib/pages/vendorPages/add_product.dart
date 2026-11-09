
import 'dart:io';
import 'package:baytiyat/show_error.dart';
import 'package:baytiyat/widgets/button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../widgets/edit_text.dart';


class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  final TextEditingController name = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController description = TextEditingController();


  ImagePicker imagePicker = ImagePicker();
  pickImage() async{
    var f = await imagePicker.pickImage(source: ImageSource.camera);
    if(f!=null){
      setState(() {
        file = File(f.path);
      });
    }
  }
  File? file;

  var dio = Dio();

  TextEditingController VendorProductController = TextEditingController();

  post(BuildContext context) async{
    FormData formData = FormData.fromMap({
      "product":VendorProductController.text,
      "name":name.text,
      "price":price.text,
      "description":description.text,
      "photo": await MultipartFile.fromFile(file!.path, filename: "anything")
    });

    var res = await dio.post("http://10.0.2.2/api/vendor_products/add",data: formData);
    if(res.data["status"]==false){
      showError(context, res.data["msg"]);
      return;
    }
  //  Navigator.of(context).pop(res.data["data"]);
  }


  openCamera() async{
    await Permission.camera
        .onGrantedCallback(() {
          pickImage();
    })
        .onDeniedCallback(() {
      showAlertDialog(context);
    })
        .onPermanentlyDeniedCallback(() {
      Navigator.of(context).pop();
    })
        .request();
  }


  showAlertDialog(context) async{
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context ){
        return CupertinoAlertDialog(
          title: const Text('Permission Denied'),
          content: const Text('Allow access to gallery and photos'),
          actions: <CupertinoDialogAction> [
            CupertinoDialogAction(
              onPressed: (){ Navigator.of(context).pop(); },
              child: const Text('Cancel'),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: (){ openAppSettings(); },
              child: const Text('Settings'),
            )
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.pink[40],
      body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
                "أدخل المعلومات التالية لإضافة منتجك" ,
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            ),
            SizedBox(height: 40),

            GestureDetector(
              onTap: (){
                openCamera();
               // pickImage();
              },
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),
                color: Colors.pink[300]),
                child: file !=null ? Image.file(file!, fit: BoxFit.cover,): SizedBox()  ,

              ),
            ),

            SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.pinkAccent
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextField(
                            controller: name,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'اسم المنتج',
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 5),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: Colors.pinkAccent
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextField(
                            controller: price,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'سعر المنتج',
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 5),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: Colors.pinkAccent
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
                          child: TextField(
                            controller: description,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'وصف للمنتج',
                            ),
                          ),
                        ),
                      ),
                    ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: GestureDetector(
                onTap:() {
                  Navigator.of(context).pushReplacementNamed("vendor_home");
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
                          child: Text(" حفظ " ,
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
      ],
    )
    ),
      ),
    );
  }
}
