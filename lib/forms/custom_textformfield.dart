import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final String? Function(String?)? save;
  final void Function(String?)? onChanged;
  final String? initialValue;
  final TextEditingController? controller;

  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.hint,
    this.suffixIcon,
    this.obscureText,
    this.inputType,
    this.validator,
    this.save,
    this.onChanged,
    this.initialValue,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onSaved: save,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: inputType,
      obscureText: obscureText ?? false,
      initialValue: initialValue,
      controller: controller,
      style: Theme.of(context).textTheme.bodyText2,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: label,
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }
}
