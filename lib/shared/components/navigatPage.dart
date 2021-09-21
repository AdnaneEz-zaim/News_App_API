import 'package:flutter/material.dart';

void navigatTo(context,wiedget){
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => wiedget));
}