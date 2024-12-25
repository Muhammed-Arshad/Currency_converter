import 'package:flutter/material.dart';

class AmountField extends StatelessWidget {
  final TextEditingController ctrl;
  const AmountField({super.key, required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: ctrl,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide:  BorderSide(color: Colors.blue.shade300, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.blue.shade300, width: 1),
          ),
          labelText: 'Amount'),
    );
  }
}
