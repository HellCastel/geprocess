import 'package:flutter/material.dart';
import 'package:pro/utils/fonts.dart';

class CustomTextFieldCard extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const CustomTextFieldCard({
    super.key,
    required this.hintText,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          style: CommonText.textDataBlock12B(),
          decoration: InputDecoration(
            hintText: hintText,
            isDense: true,
            hintStyle: CommonText.textDataBlock12B().copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}