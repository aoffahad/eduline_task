import 'package:flutter/material.dart';

import 'button_widget.dart';

class GlobalPopup extends StatelessWidget {
  final Widget? imageWidget;
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onButtonTap;

  const GlobalPopup({
    super.key,
    this.imageWidget,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    // Responsive width: 80% of screen, max 360
    // final popupWidth = MediaQuery.of(context).size.width * 0.8;
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 360, minWidth: 260),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Close Button
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close, color: Colors.grey[500], size: 26),
                ),
              ),
              if (imageWidget != null) ...[imageWidget!, SizedBox(height: 14)],
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xff222B45),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(color: Color(0xff8F9BB3), fontSize: 15),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 26),
              SizedBox(
                width: double.infinity,
                child: GlobalButton(text: buttonText, onPressed: onButtonTap),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
