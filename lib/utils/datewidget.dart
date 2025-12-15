import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pro/utils/fonts.dart';

class CustomDateFieldCard extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(DateTime)? onDateSelected;

  const CustomDateFieldCard({
    super.key,
    required this.hintText,
    required this.controller,
    this.onDateSelected,
  });

  Future<void> _pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      controller.text = DateFormat("dd-MM-yyyy").format(picked);
      if (onDateSelected != null) {
        onDateSelected!(picked);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        height: 35,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8), // reduced height
          child: GestureDetector(
            onTap: () => _pickDate(context),
            child: AbsorbPointer(
              child: TextFormField(
                controller: controller,
                style: CommonText.textDataBlock12B(),
                decoration: InputDecoration(
                  hintText: hintText,
                  isDense: true, // reduces height
                  contentPadding: const EdgeInsets.symmetric(vertical: 6), // compact
                  hintStyle: CommonText.textDataBlock12B().copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                  border: InputBorder.none,
                  suffixIcon: const Icon(Icons.calendar_today, size: 18),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}