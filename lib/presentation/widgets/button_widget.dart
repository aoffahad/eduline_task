import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final Color? buttonColor;
  final Color? textColor;
  final double? borderRadius;
  final double? fontSize;
  final FontWeight? fontWeight;

  const GlobalButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height,
    this.width,
    this.buttonColor,
    this.textColor,
    this.borderRadius,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? MediaQuery.of(context).size.width - 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 25),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: fontSize ?? 16,
            fontWeight: fontWeight ?? FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
