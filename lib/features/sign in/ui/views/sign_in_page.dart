import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habbit_tracking_app/core/helper/spacing.dart';
import 'package:habbit_tracking_app/core/theming/app_colors.dart';
import 'package:habbit_tracking_app/core/theming/app_textstyles.dart';
import 'package:habbit_tracking_app/features/sign%20in/ui/widgets/custom_sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              const BlackArea(),
              SizedBox(
                height: 560.h,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(32.r),
                      topLeft: Radius.circular(32.r),
                    ),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.w,
                    vertical: 24.h,
                  ),
                  child: const CustomSignInForm(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BlackArea extends StatelessWidget {
  const BlackArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
    verticalSpace(30),
          Text("Login Account", style: AppTextstyles.font16WhiteSemiBold),
          verticalSpace(2),
          Text(
            "Welcome back To Application",
            style: AppTextstyles.font13Greyregular,
          ),
          verticalSpace(50.h),
          Center(
            child: Text(
              "Login",
              style: AppTextstyles.headerStyle,
            ),
          ),
        ],
      ),
    );
  }
}
