import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String content}) {
  final snackBar = SnackBar(content: Text(content));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
