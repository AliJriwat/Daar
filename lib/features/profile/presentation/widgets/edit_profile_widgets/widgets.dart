import 'package:flutter/material.dart';

Widget editTextField({
  required TextEditingController controller,
  String? hintText,
}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      border: const OutlineInputBorder(),
    ),
  );
}
