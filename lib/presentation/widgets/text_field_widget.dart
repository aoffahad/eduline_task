import 'package:flutter/material.dart';

class GlobalTextField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final double? width;
  final double? height;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixTap;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged; // <-- Add this!
  final String? errorText; // <-- Add this!
  final EdgeInsetsGeometry? contentPadding;

  const GlobalTextField({
    Key? key,
    required this.hintText,
    this.labelText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.width,
    this.height,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.validator,
    this.onChanged, // <-- Add this!
    this.errorText, // <-- Add this!
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final input = TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged, // <-- Use it!
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon:
            onSuffixTap != null
                ? GestureDetector(onTap: onSuffixTap, child: suffixIcon)
                : suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        contentPadding:
            contentPadding ??
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        errorText: errorText, // <-- Add this!
      ),
    );

    if (width != null || height != null) {
      return SizedBox(width: width, height: height, child: input);
    }
    return input;
  }
}
