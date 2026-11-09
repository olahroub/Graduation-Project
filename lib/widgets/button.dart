

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Button(String text, VoidCallback onClick){
  return Container(
    margin: EdgeInsets.all(10),
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
      onPressed: onClick,
      child: Text(text),
      style: ButtonStyle(
         // backgroundColor: MaterialStateProperty.all(),
      //    foregroundColor: MaterialStateProperty.all(value),
          shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7)
      )
  )
      ),
    ),
  );

}