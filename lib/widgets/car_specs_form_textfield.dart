import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarSpecsFormTextField extends StatelessWidget {
  const CarSpecsFormTextField({super.key, required this.icon, required this.labeltext, required this.hintext,  this.controller, this.maxLines=1,});

  final String hintext;
  final String labeltext;
  final Icon icon;
  final int maxLines;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        icon: icon,
        hintText: hintext,
        labelText: labeltext,
      ),
    );
  }
}