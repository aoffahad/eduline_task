import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/validators/validators.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/text_field_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final RxBool obscureNew = true.obs;
  final RxBool obscureConfirm = true.obs;

  String? confirmValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Confirm your password";
    }
    if (value != newPasswordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  void onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      Get.toNamed('/verifyCode');
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Reset Password",
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Your password must be at least 8 characters long and include a combination of letters, numbers",
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff94A3B8),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  "New Password",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff0F172A),
                  ),
                ),
                SizedBox(height: 10),
                Obx(
                  () => GlobalTextField(
                    hintText: "Enter new password",
                    labelText: "New Password",
                    controller: newPasswordController,
                    obscureText: obscureNew.value,
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: Icon(
                      obscureNew.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onSuffixTap: () => obscureNew.value = !obscureNew.value,
                    validator: AppValidators.password, // Use global validator
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  "Confirm New Password",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff0F172A),
                  ),
                ),
                SizedBox(height: 10),
                Obx(
                  () => GlobalTextField(
                    hintText: "Confirm new password",
                    labelText: "Confirm Password",
                    controller: confirmPasswordController,
                    obscureText: obscureConfirm.value,
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: Icon(
                      obscureConfirm.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onSuffixTap:
                        () => obscureConfirm.value = !obscureConfirm.value,
                    validator: confirmValidator,
                  ),
                ),
                SizedBox(height: 36),
                GlobalButton(
                  text: "Submit",
                  onPressed: onSubmit,
                  buttonColor: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
