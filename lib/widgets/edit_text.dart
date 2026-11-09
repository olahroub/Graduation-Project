import 'package:flutter/material.dart';

class EditText extends StatelessWidget {

   EditText({super.key, required this.controller, required this.hint});
   final TextEditingController controller;
   String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: hint,
       border: OutlineInputBorder(

         borderRadius: BorderRadius.circular(7),
           borderSide: BorderSide(width: 2,  )
       ),
      ),
    ),
    );
  }
}
