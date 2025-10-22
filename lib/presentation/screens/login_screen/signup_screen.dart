import 'package:eduline/core/constant/image_constants.dart';
import 'package:eduline/presentation/widgets/global_popup_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/button_widget.dart';
import '../../widgets/text_field_widget.dart';
import 'controller/validator_controller.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());
  final RxBool obscure = true.obs;

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    // 🔹 This reactive variable will control button enable state
    final RxBool isFormFilled = false.obs;

    // 🔹 Helper: Update button enable state whenever any field changes
    void updateFormState() {
      isFormFilled.value =
          controller.emailController.text.isNotEmpty &&
          controller.nameController.text.isNotEmpty &&
          controller.passwordController.text.isNotEmpty;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Get.back(),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Welcome to Eduline",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(height: 10),
                Text(
                  "Let's join the Eduline learning ecosystem & meet our professional mentors. It's Free!",
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                ),
                const SizedBox(height: 30),

                // ===== EMAIL =====
                Text(
                  "Email Address",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff0F172A),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => GlobalTextField(
                    hintText: 'Email Address',
                    controller: controller.emailController,
                    onChanged: (val) {
                      controller.validateEmail(val);
                      updateFormState();
                    },
                    errorText:
                        controller.emailError.value.isEmpty
                            ? null
                            : controller.emailError.value,
                  ),
                ),
                const SizedBox(height: 16),

                // ===== FULL NAME =====
                Text(
                  "Full Name",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff0F172A),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => GlobalTextField(
                    hintText: 'Full Name',
                    controller: controller.nameController,
                    onChanged: (val) {
                      controller.validateName(val);
                      updateFormState();
                    },
                    errorText:
                        controller.nameError.value.isEmpty
                            ? null
                            : controller.nameError.value,
                  ),
                ),
                const SizedBox(height: 16),

                // ===== PASSWORD =====
                Text(
                  "Password",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff0F172A),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalTextField(
                        hintText: 'Password',
                        controller: controller.passwordController,
                        onChanged: (val) {
                          controller.validatePassword(val);
                          updateFormState();
                        },
                        obscureText: obscure.value,
                        suffixIcon: Icon(
                          obscure.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onSuffixTap: () => obscure.value = !obscure.value,
                        errorText:
                            controller.passwordError.value.isEmpty
                                ? null
                                : controller.passwordError.value,
                      ),
                      const SizedBox(height: 8),

                      // Password strength bar
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 6,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Obx(
                                () => FractionallySizedBox(
                                  widthFactor:
                                      controller.passwordStrength.value,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          controller.passwordStrength.value >
                                                  0.7
                                              ? Colors.green
                                              : controller
                                                      .passwordStrength
                                                      .value >
                                                  0.4
                                              ? Colors.blue
                                              : Colors.red,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Obx(() {
                            double s = controller.passwordStrength.value;
                            String text =
                                s > 0.7
                                    ? 'Strong'
                                    : s > 0.4
                                    ? 'Medium'
                                    : 'Weak';
                            Color color =
                                s > 0.7
                                    ? Colors.green
                                    : s > 0.4
                                    ? Colors.blue
                                    : Colors.red;
                            return Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 2),
                              child: Text(
                                text,
                                style: TextStyle(fontSize: 13, color: color),
                              ),
                            );
                          }),
                        ],
                      ),

                      // Password rule text
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.check_circle_outline,
                                color:
                                    controller.passwordValid.value
                                        ? Colors.green
                                        : Colors.red,
                                size: 20,
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  'At least 8 characters with a combination of letters and numbers',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color:
                                        controller.passwordValid.value
                                            ? Colors.green
                                            : Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // ===== SIGN UP BUTTON =====
                Obx(() {
                  final bool enabled =
                      isFormFilled.value &&
                      controller.emailError.value.isEmpty &&
                      controller.nameError.value.isEmpty &&
                      controller.passwordError.value.isEmpty;

                  return SizedBox(
                    width: double.infinity,
                    child: GlobalButton(
                      text: 'Sign Up',
                      buttonColor: enabled ? Colors.blue : Colors.grey.shade400,
                      onPressed:
                          enabled
                              ? () {
                                // Form valid -> proceed
                                Get.dialog(
                                  GlobalPopup(
                                    imageWidget: Image.asset(
                                      AppImages.regSuccessfull,
                                      height: 100,
                                    ),
                                    title: 'Successfully Registered',
                                    description:
                                        'Your account has been registered successfully, now let’s enjoy our features!',
                                    buttonText: 'Continue',
                                    onButtonTap: () {
                                      Get.back();
                                      Get.offAllNamed('/signin');
                                    },
                                  ),
                                  barrierDismissible: false,
                                );
                              }
                              : null,
                    ),
                  );
                }),

                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? '),
                    GestureDetector(
                      onTap: () => Get.offAllNamed('/signin'),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
