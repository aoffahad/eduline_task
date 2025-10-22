import 'package:eduline/core/constant/image_constants.dart';
import 'package:eduline/presentation/screens/onbording_screen/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eduline/presentation/widgets/button_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  final controller = Get.put(OnboardingController());

  final List<Map<String, String>> onboardingData = [
    {
      "image": AppImages.onboardingScreenOne,
      "title": "Best online courses\nin the world",
      "desc":
          "Now you can learn anywhere, anytime,\neven if there is no internet access!",
    },
    {
      "image": AppImages.onboardingScreenTwo,
      "title": "Explore your new skill\ntoday",
      "desc":
          "Our platform is designed to help you explore\nnew skills. Let’s learn & grow with Eduline!",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                final item = onboardingData[index];
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(item['image']!, height: 450, width: 300),

            
                      Text(
                        item['title']!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                         fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        item['desc']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => AnimatedContainer(
                  duration: 300.milliseconds,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: controller.currentPage.value == index ? 20 : 8,
                  decoration: BoxDecoration(
                    color:
                        controller.currentPage.value == index
                            ? Colors.blue
                            : Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          GlobalButton(
            text: controller.currentPage.value == 1 ? "Get Started" : "Next",
            onPressed: controller.nextPage,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
