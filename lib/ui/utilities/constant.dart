import 'package:flutter/material.dart';

SizedBox spacer({double? width, double? height}) {
  return SizedBox(
    width: width,
    height: height,
  );
}

showSnackbar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
