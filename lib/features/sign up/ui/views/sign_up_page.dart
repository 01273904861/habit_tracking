import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habbit_tracking_app/core/theming/app_colors.dart';
import 'package:habbit_tracking_app/core/theming/app_textstyles.dart';
import 'package:habbit_tracking_app/features/sign%20up/ui/widgets/custom_sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
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
                height: 612.h,
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
                  child: const CustomSignUpForm(),
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
      height: 200.h,
      padding: EdgeInsets.symmetric(
        horizontal: 25.w,
      ),
      child: Center(
        child: Text(
          "Register",
          style: AppTextstyles.headerStyle,
        ),
      ),
    );
  }
}
