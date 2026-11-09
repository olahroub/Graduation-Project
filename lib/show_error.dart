import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showError(BuildContext context,String msg){
  showDialog<void>(
    context: context,

    builder: (context) {
      return AlertDialog(
        content: Text(msg),
      );
    },
  );
}