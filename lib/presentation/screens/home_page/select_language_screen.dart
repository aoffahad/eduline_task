import 'package:eduline/core/constant/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/button_widget.dart'; 

class SelectLanguageScreen extends StatefulWidget {
  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  int selectedIndex = 0;

  final List<Map<String, String>> languages = [
    {'country': 'English (US)', 'flag': AppImages.flagUsa},
    {'country': 'Spanish', 'flag': AppImages.flagUsa},
    {'country': 'French', 'flag': AppImages.flagUsa},
    {'country': 'German', 'flag': AppImages.flagUsa},
    {'country': 'Chinese', 'flag': AppImages.flagUsa},
    {'country': 'Indonesia', 'flag': AppImages.flagUsa},
    {'country': 'Afghanistan', 'flag': AppImages.flagUsa},
    {'country': 'Algeria', 'flag': AppImages.flagUsa},
    {'country': 'Malaysia', 'flag': AppImages.flagUsa},
    {'country': 'Arabic', 'flag': AppImages.flagUsa},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withValues(alpha: 0.97),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withValues(alpha: 0.99),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is Your Mother Language",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: 8),
            Text(
              "Discover what is a podcast description and podcast summary.",
              style: TextStyle(
                color: Color(0xff64748B),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 22),
            Expanded(
              child: ListView.separated(
                itemCount: languages.length,
                separatorBuilder: (_, __) => SizedBox(height: 10),
                itemBuilder: (context, idx) {
                  return Container(
                    decoration: BoxDecoration(
                      color:
                          idx == selectedIndex
                              ? Colors.white
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(18),

                      // border: Border.all(
                      //   color:
                      //       idx == selectedIndex
                      //           ? Color(0xff3370FF)
                      //           : Color(0xffe5e7eb),
                      //   width: 1.5,
                      // ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      leading: ClipOval(
                        child: Image.asset(
                          languages[idx]['flag']!,
                          width: 38,
                          height: 38,
                          fit: BoxFit.cover,
                        ),
                      ),

                      title: Text(
                        languages[idx]['country']!,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () => setState(() => selectedIndex = idx),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor:
                              idx == selectedIndex
                                  ? Color(0xff3370FF)
                                  : Color(0xffF1F5F9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          minimumSize: Size(88, 36),
                        ),
                        child: Text(
                          idx == selectedIndex ? "✓ Selected" : "Select",
                          style: TextStyle(
                            color:
                                idx == selectedIndex
                                    ? Colors.white
                                    : Color(0xff64748B),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      onTap: () => setState(() => selectedIndex = idx),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            GlobalButton(
              text: "Continue",
              onPressed: () {
                Get.offAllNamed('/handlerScreen');
              },
              buttonColor: Color(0xff2563eb),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
