import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/button_widget.dart';

class EnableLocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/location_image.png",
              width: media.width * 0.5,
              height: media.width * 0.5,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 32),
            Text(
              "Enable Location",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              "Kindly allow us to access your location to provide you with suggestions for nearby salons",
              style: TextStyle(
                color: Color(0xff64748B),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            GlobalButton(
              text: "Enable",
              onPressed: () {
                Get.toNamed('/selectLanguage');
              },
              buttonColor: Color(0xff2563eb),
            ),
            SizedBox(height: 18),
            GestureDetector(
              onTap: () {
                Get.toNamed('/selectLanguage');
              },
              child: Text(
                "Skip, Not Now",
                style: TextStyle(
                  color: Color(0xff222B45),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
