import 'package:eduline/core/constant/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontStyles {
  // static TextStyle interText24W700TextPrimary = const TextStyle(
  //   fontFamily: AppFonts.inter,
  //   fontSize: 24,
  //   fontWeight: FontWeight.w700,
  //   color: AppColors.textPrimary,
  // );
  static TextStyle interText24W700TextPrimary = GoogleFonts.inter(
    // fontFamily: AppFonts.inter,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle interText20W700TextPrimary = const TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  // static TextStyle interText14W400TextSecondary = const TextStyle(
  //   fontFamily: AppFonts.inter,
  //   fontSize: 14,
  //   fontWeight: FontWeight.w400,
  //   color: AppColors.textSecondary,
  // );
  static TextStyle interText14W400TextSecondary = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );
}

class AppFonts {
  static const inter = 'Inter';
}
