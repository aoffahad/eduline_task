import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/validators/validators.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/text_field_widget.dart';

class ForgotPasswordEmailScreen extends StatefulWidget {
  @override
  State<ForgotPasswordEmailScreen> createState() =>
      _ForgotPasswordEmailScreenState();
}

class _ForgotPasswordEmailScreenState extends State<ForgotPasswordEmailScreen> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void onContinue() {
    if (_formKey.currentState?.validate() ?? false) {
      Get.toNamed('/resetPass');
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Forgot Password",
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "Enter your email, we will send a verification code to email",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff64748B),
                  ),
                  textAlign: TextAlign.center,
                ),

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
              GlobalTextField(
                hintText: "Enter your email",
                labelText: "Email",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator:
                    AppValidators
                        .email, 
              ),
              SizedBox(height: 30),
              GlobalButton(
                text: "Continue",
                onPressed: onContinue,
                buttonColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
