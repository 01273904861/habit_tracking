import 'package:flutter/material.dart';
import 'package:habbit_tracking_app/core/Router/routes.dart';
import 'package:habbit_tracking_app/core/helper/extension.dart';
import 'package:habbit_tracking_app/core/theming/app_textstyles.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.signUpPage);
      },
      child: RichText(
        text: TextSpan(
          text: "Don't have an account yet?  Register ",
          style: AppTextstyles.font13Greyregular,
          children: const [
            TextSpan(
              text: "here",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
