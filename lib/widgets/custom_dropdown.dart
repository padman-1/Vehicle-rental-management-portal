import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({
    required this.items,
    required this.hintText,
    super.key,
    this.currentValue,
    this.onChanged,
  });
  final List<T> items;
  final T? currentValue;
  final ValueChanged<T?>? onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
        value: currentValue,
        items: items
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e.toString(),
                  ),
                ))
            .toList(),
        hint: Text(hintText),
        onChanged: onChanged);
  }
}