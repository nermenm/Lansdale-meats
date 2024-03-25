import 'package:flutter/material.dart';

class Helpers {

    static errorSnackBar(context, error) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          error,
          style: const TextStyle(color: Colors.white),
        )));
  }

  static successSnackBar(context, message) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        )));
  }
}