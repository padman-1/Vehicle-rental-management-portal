import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintext,
    this.maxLines = 1,
    this.controller,
    this.isPassword = false,
    this.onChanged,
  });

  final String hintext;
  final int maxLines;
  final TextEditingController? controller;
  final bool isPassword;
  final ValueChanged<String>? onChanged;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isVisible;

  @override
  void initState() {
    isVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      maxLines: widget.maxLines,
      obscureText: widget.isPassword ? !isVisible : false,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
          hintText: widget.hintext,
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: isVisible
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                )
              : null),
    );
  }
}
