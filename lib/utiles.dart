import 'package:flutter/material.dart';

Color customBlue = Color.fromRGBO(37, 43, 103, 1);

Color dateColor(String date) {
  switch (date) {
    case 'yesterday':
      return Colors.pinkAccent;
    case 'today':
      return Colors.blueAccent;
    default:
      return customBlue;
  }
}
