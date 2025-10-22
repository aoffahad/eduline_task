import 'package:eduline/core/constant/image_constants.dart';
import 'package:eduline/core/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/button_widget.dart';
import '../../widgets/text_field_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool obscure = true.obs;
  final RxBool rememberMe = true.obs;
  final RxString email = ''.obs;
  final RxString password = ''.obs;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(AppImages.logo, height: media.height * 0.30),
              ),
              Center(
                child: Text(
                  "Welcome Back",
                  style: GoogleFonts.inter(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Please login first to start your Theory Test.",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff64748B),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              Text(
                "Email Address",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff0F172A),
                ),
              ),
              const SizedBox(height: 10),

              GlobalTextField(
                hintText: "Enter your email",
                labelText: "Email",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: AppValidators.email,
                onChanged: (val) => email.value = val,
              ),
              const SizedBox(height: 20),

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
                () => GlobalTextField(
                  hintText: "Enter your password",
                  labelText: "Password",
                  controller: passwordController,
                  validator: AppValidators.password,
                  obscureText: obscure.value,
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: Icon(
                    obscure.value ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onSuffixTap: () => obscure.value = !obscure.value,
                  onChanged: (val) => password.value = val,
                ),
              ),
              const SizedBox(height: 18),

              Obx(
                () => Row(
                  children: [
                    Checkbox(
                      value: rememberMe.value,
                      activeColor: const Color(0xff2563eb),
                      onChanged: (val) => rememberMe.value = val ?? false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    const Text(
                      "Remember Me",
                      style: TextStyle(
                        color: Color(0xff64748B),
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Get.toNamed('/forgotPassEmail'),
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: Color(0xff64748B),
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              Obx(() {
                final bool isEnabled =
                    email.value.isNotEmpty && password.value.isNotEmpty;

                return GlobalButton(
                  text: "Sign In",
                  buttonColor: isEnabled ? Colors.blue : Colors.grey.shade400,
                  // onPressed: isEnabled
                  //     ? () {

                  //         if (_formKey.currentState?.validate() ?? false) {
                  //           Get.toNamed('/enableLocationScreen');
                  //         }
                  //       }
                  //     : null,
                  onPressed: () {
                    Get.toNamed('/enableLocationScreen');
                  },
                );
              }),

              const SizedBox(height: 30),

              Center(
                child: GestureDetector(
                  onTap: () => Get.toNamed('/signup'),
                  child: const Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      children: [
                        TextSpan(
                          text: "Create Account",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
