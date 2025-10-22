import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  var emailError = ''.obs;
  var nameError = ''.obs;
  var passwordError = ''.obs;
  var passwordStrength = 0.0.obs;
  var passwordValid = false.obs;

  void validateEmail(String value) {
    if (value.isEmpty || !value.contains('@')) {
      emailError.value = 'Enter a valid email';
    } else {
      emailError.value = '';
    }
  }

  void validateName(String value) {
    if (value.isEmpty) {
      nameError.value = 'Enter full name';
    } else {
      nameError.value = '';
    }
  }

  void validatePassword(String value) {
    passwordStrength.value = calculateStrength(value);
    passwordValid.value = isValidPassword(value);
    if (value.isEmpty) {
      passwordError.value = 'Enter password';
    } else if (!passwordValid.value) {
      passwordError.value = 'Password too weak';
    } else {
      passwordError.value = '';
    }
  }

  double calculateStrength(String password) {
    double strength = 0;
    if (password.length >= 8) strength += 0.4;
    if (RegExp(r'[A-Za-z]').hasMatch(password)) strength += 0.3;
    if (RegExp(r'[0-9]').hasMatch(password)) strength += 0.3;
    return strength.clamp(0, 1.0);
  }

  bool isValidPassword(String password) {
    return password.length >= 8 &&
        RegExp(r'[A-Za-z]').hasMatch(password) &&
        RegExp(r'[0-9]').hasMatch(password);
  }

  void onSignUp() {
    // Validate all fields first, then process
    validateEmail(emailController.text);
    validateName(nameController.text);
    validatePassword(passwordController.text);
    if (emailError.value.isEmpty &&
        nameError.value.isEmpty &&
        passwordError.value.isEmpty) {
      // Do sign up
    }
  }
}
