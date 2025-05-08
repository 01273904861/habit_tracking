import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habbit_tracking_app/core/theming/app_colors.dart';

import 'package:habbit_tracking_app/core/theming/font_weight_helper.dart';

class AppTextstyles {
  static TextStyle font13Greyregular = TextStyle(
    color: AppColors.grey,
    fontSize: 13.sp,
    fontWeight: AppFontWeightHelper.regular,
  );
  static TextStyle font32BlueBold = TextStyle(
    color: AppColors.mainBlue,
    fontWeight: AppFontWeightHelper.bold,
    fontSize: 32.sp,
  );
  static TextStyle font20BlackMeduim = TextStyle(
    color: AppColors.black,
    fontWeight: AppFontWeightHelper.meduim,
    fontSize: 20.sp,
  );
  static TextStyle font16WhitekSemiBold = TextStyle(
    color: Colors.white,
    fontWeight: AppFontWeightHelper.semiBold,
    fontSize: 16.sp,
  );

  static TextStyle font24BlueBold = TextStyle(
    fontWeight: AppFontWeightHelper.bold,
    color: AppColors.mainBlue,
    fontSize: 24.sp,
  );

  static TextStyle font14GreyRegular = TextStyle(
    fontWeight: AppFontWeightHelper.regular,
    color: AppColors.grey,
    fontSize: 14.sp,
    height: 1.5,
  );
  static TextStyle font14LigtGreyRegular = TextStyle(
    fontWeight: AppFontWeightHelper.regular,
    color: AppColors.lighterGrey,
    fontSize: 14.sp,
  );
  static TextStyle font12BlueRegular = TextStyle(
    fontWeight: AppFontWeightHelper.regular,
    color: AppColors.mainBlue,
    fontSize: 12.sp,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    fontWeight: AppFontWeightHelper.semiBold,
    color: Colors.white,
    fontSize: 16.sp,
  );
  static TextStyle font12LigtGreyRegular = TextStyle(
    fontWeight: AppFontWeightHelper.regular,
    color: AppColors.lightGrey,
    fontSize: 12.sp,
  );
  static TextStyle font12BlackRegular = TextStyle(
    fontWeight: AppFontWeightHelper.regular,
    color: AppColors.black,
    fontSize: 12.sp,
  );
  static TextStyle font12BlackSemiBold = TextStyle(
    fontWeight: AppFontWeightHelper.semiBold,
    color: AppColors.black,
    fontSize: 12.sp,
  );
  static TextStyle font16WhiteMeduim = TextStyle(
    fontWeight: AppFontWeightHelper.meduim,
    color: Colors.white,
    fontSize: 16.sp,
  );
  static TextStyle font18BlackRegular = TextStyle(
    fontWeight: AppFontWeightHelper.regular,
    color: Colors.black,
    fontSize: 18.sp,
  );
  static TextStyle font12GreyMeduim = TextStyle(
    fontWeight: AppFontWeightHelper.meduim,
    color: AppColors.lighterGrey,
    fontSize: 12.sp,
  );

  ///title of appBar
  static TextStyle font18BlackSemiBold = TextStyle(
    fontWeight: AppFontWeightHelper.semiBold,
    color: Colors.black,
    fontSize: 18.sp,
  );

  static TextStyle headerStyle = GoogleFonts.quicksand(
    color: AppColors.white,
    fontWeight: FontWeight.bold,
    fontSize: 35.sp,
  );
}
