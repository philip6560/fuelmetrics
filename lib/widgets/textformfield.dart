
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String label;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const CustomTextFormField({required this.label, required this.controller, required this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.next,
        autofocus: false,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          floatingLabelStyle: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
          isDense: true,
          contentPadding: const EdgeInsets.only(top: 23.0, bottom: 23.0, left: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(color: Colors.purple),
          ),
        ),
      ),
    );
  }
}