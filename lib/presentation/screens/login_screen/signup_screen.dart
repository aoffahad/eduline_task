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

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
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
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Get.back(),
                ),
                SizedBox(height: 8),
                Text(
                  "Welcome to Eduline",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                SizedBox(height: 10),
                Text(
                  "Let's join to Eduline learning ecosystem & meet our professional mentor. It's Free!",
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                ),
                SizedBox(height: 30),
                Text(
                  "Email Address",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff0F172A),
                  ),
                ),
                SizedBox(height: 10),
                Obx(
                  () => GlobalTextField(
                    hintText: 'Email Address',
                    controller: controller.emailController,
                    onChanged: controller.validateEmail,
                    errorText:
                        controller.emailError.value.isEmpty
                            ? null
                            : controller.emailError.value,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Full Name",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff0F172A),
                  ),
                ),
                SizedBox(height: 10),

                Obx(
                  () => GlobalTextField(
                    hintText: 'Full Name',
                    controller: controller.nameController,
                    onChanged: controller.validateName,
                    errorText:
                        controller.nameError.value.isEmpty
                            ? null
                            : controller.nameError.value,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Password",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff0F172A),
                  ),
                ),
                SizedBox(height: 10),

                Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalTextField(
                        hintText: 'Password',
                        controller: controller.passwordController,
                        onChanged: controller.validatePassword,
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
                      SizedBox(height: 8),

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

                          Row(
                            children: [
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
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    top: 2,
                                  ),
                                  child: Text(
                                    text,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: color,
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ],
                      ),

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
                              SizedBox(width: 5),
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
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),

                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  child: GlobalButton(
                    text: 'Sign Up',
                    onPressed: () {
                      Get.dialog(
                        GlobalPopup(
                          imageWidget: Image.asset(
                            AppImages.regSuccessfull,
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
                    },
                  ),
                ),

                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account? '),
                    GestureDetector(
                      onTap: () {
                        Get.offAllNamed('/signin');
                      },
                      child: Text(
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
