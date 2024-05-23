import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String petunjukunama;
  final bool sensorpass;

  MyTextField({
    super.key,
    required this.controller,
    required this.petunjukunama,
    required this.sensorpass,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: TextField(
        controller: controller,
        obscureText: sensorpass,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black87),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade800),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: petunjukunama,
        ),
      ),
    );
  }
}
