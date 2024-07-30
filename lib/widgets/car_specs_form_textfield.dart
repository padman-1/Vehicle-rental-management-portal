import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarSpecsFormTextField extends StatelessWidget {
  const CarSpecsFormTextField({
    super.key,
    required this.hintext,
    this.controller,
    this.maxLines = 1,
    this.onChanged,
  });

  final String hintext;
  final ValueChanged<String>? onChanged;
  final int maxLines;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintext,
      ),
    );
  }
}
