// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        elevation: 8,
        fillColor: Colors.white,
        child: Icon(icon, size: 40, color: Colors.black),
        padding: EdgeInsets.all(16),
        shape: CircleBorder(
            side: BorderSide(
                color: Colors.black,
                width: 3
            )
        ),
        hoverElevation: 16,
        hoverColor: Colors.white24,
        // highlightColor: Colors.white,
        onPressed: onPressed
    );
  }
}