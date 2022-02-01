// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.textController,
    required this.classController,
    required this.validationFunction,
    required this.saveFunction,
    this.icon = CupertinoIcons.circle,
    this.hint = "",
    this.obscureText = false,
    this.minLines = 1,
    this.fontSize = 14,
    this.shadowHeight = 50,
    this.alignLabel = false
  }) : super(key: key);

  final TextEditingController textController;
  final GetxController classController;
  final Function validationFunction;
  final Function saveFunction;
  final IconData icon;
  final String hint;
  final bool obscureText;
  final int minLines;
  final double fontSize;
  final double shadowHeight;
  final bool alignLabel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: shadowHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.zero,
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 4, spreadRadius: 2, offset: Offset(0, 4)),
            ]
          ),
        ),
        TextFormField(
          controller: textController,
          obscureText: obscureText,
          cursorColor: Colors.black,
          minLines: minLines,
          maxLines: minLines,
          style: TextStyle(fontSize: fontSize),
          textAlign: TextAlign.left,
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
              label: Icon(icon),
              alignLabelWithHint: alignLabel,
              hintText: hint,
              // labelText: label,
              // labelStyle: TextStyle(color: Colors.black),
              fillColor: Colors.white,
              filled: true,
              focusColor: Colors.black,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(color: Colors.black)),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(color: Colors.red)
              ),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(color: Colors.red)
              ),
          ),
          validator: (val) => validationFunction(val),
          onSaved: (val) => saveFunction(val),
        ),
      ]
    );
  }
}