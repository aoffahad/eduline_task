import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/global_popup_widget.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String? email;

  const VerifyCodeScreen({Key? key, this.email}) : super(key: key);

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController codeController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  int _seconds = 60;
  Timer? _timer;
  bool _resendEnabled = false;

  @override
  void initState() {
    super.initState();
    startTimer();
    codeController.addListener(_onCodeChanged);
  }

  @override
  void dispose() {
    _timer?.cancel();
    codeController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void startTimer() {
    setState(() {
      _seconds = 60;
      _resendEnabled = false;
    });
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds > 1) {
        setState(() => _seconds--);
      } else {
        timer.cancel();
        setState(() => _resendEnabled = true);
      }
    });
  }

  void _onResend() {
    startTimer();

  }

  void _onCodeChanged() {
    if (codeController.text.length == 4) {

      Future.delayed(Duration(milliseconds: 100), () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder:
              (_) => GlobalPopup(
                imageWidget: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 64,
                ),
                title: "Verified",
                description: "Your code has been verified successfully!",
                buttonText: "Continue",
                onButtonTap: () {
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pop(); // close popup
                  Get.offAllNamed('/signin');
                },
              ),
        );
      });
    }
  }

  Widget _buildPinBoxes() {
    List<Widget> boxes = [];
    String code = codeController.text.padRight(4, " ");
    for (int i = 0; i < 4; i++) {
      boxes.add(
        Container(
          width: 54,
          height: 54,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Color(0xffe2e8f0), width: 1.5),
            color: Color(0xfffafbfc),
          ),
          child: Text(
            code[i] == " " ? "" : "●",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: boxes);
  }

  void _onKeyPressed(String value) {
    if (value == "<") {
      if (codeController.text.isNotEmpty) {
        codeController.text = codeController.text.substring(
          0,
          codeController.text.length - 1,
        );
      }
    } else if (codeController.text.length < 4 &&
        RegExp(r'\d').hasMatch(value)) {
      codeController.text += value;
    }
    // Listener will handle auto popup
  }

  Widget _buildCustomKeyboard() {
    List<List<String>> keys = [
      ["1", "2", "3"],
      ["4", "5", "6"],
      ["7", "8", "9"],
      ["", "0", "<"],
    ];
    return Column(
      children:
          keys.map((row) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
                  row.map((key) {
                    if (key.isEmpty) return SizedBox(width: 64);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: GestureDetector(
                        onTap: () => _onKeyPressed(key),
                        child: Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: Color(0xfff1f5f9),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          alignment: Alignment.center,
                          child:
                              key == "<"
                                  ? Icon(
                                    Icons.backspace_outlined,
                                    color: Color(0xff64748B),
                                    size: 26,
                                  )
                                  : Text(
                                    key,
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff0F172A),
                                    ),
                                  ),
                        ),
                      ),
                    );
                  }).toList(),
            );
          }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final email = widget.email ?? "your email";
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 12),
          Text(
            "Verify Code",
            style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "Please enter the code we just sent to\n$email",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Color(0xff94A3B8),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 24),
          _buildPinBoxes(),
          SizedBox(height: 24),
          _resendEnabled
              ? TextButton(
                onPressed: _onResend,
                child: Text(
                  "Resend Code",
                  style: TextStyle(
                    color: Color(0xff3370FF),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              )
              : Text(
                "Resend code in 00:${_seconds.toString().padLeft(2, "0")}",
                style: TextStyle(
                  color: Color(0xff94A3B8),
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
          Spacer(),
          _buildCustomKeyboard(),
          SizedBox(height: 18),
        ],
      ),
    );
  }
}
