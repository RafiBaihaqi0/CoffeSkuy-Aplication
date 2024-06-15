
import 'package:flutter/material.dart';

const String baseURL = "http://10.60.235.48:8000/api/";
const Map<String, String> headers = {"Content-Type":"application/json"};

errorSnackBar(BuildContext context, String text){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(text),
      duration: const Duration(seconds: 1),
      )
  );
}