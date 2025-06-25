import 'package:flutter/material.dart';

Widget myInput({label = '', controllerValue, hintText = '', TextStyle? labelStyle}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [
      SizedBox(height: 15),

      Text(label, style: labelStyle ?? TextStyle(),),

      TextField(
        decoration: InputDecoration(
          hintText: hintText, border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: const Color.fromARGB(255, 16, 8, 65), width: 2),
          ),
        ),

        onChanged: (value) => {
          controllerValue.value = value,
        },
      ),
    ],
  );
}
