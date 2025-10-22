import 'package:eduline/core/constant/font_style.dart';
import 'package:eduline/core/constant/image_constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  // final SplashController _controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.splashScreen, height: 150),
                const SizedBox(height: 30),
                Text(
                  "Theory test in my language",
                  style: FontStyles.interText24W700TextPrimary,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                Text(
                  "I must write the real test will be in English language and this app just helps you to understand the materials in your language",
                  style: FontStyles.interText14W400TextSecondary,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                const CircularProgressIndicator(color: Colors.blue),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
