import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habbit_tracking_app/core/Router/routes.dart';
import 'package:habbit_tracking_app/core/helper/extension.dart';
import 'package:habbit_tracking_app/core/theming/app_textstyles.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.pushNamed(Routes.signInPage);
      },
      child: RichText(
        text: TextSpan(
          text: "already have an account?  Login ",
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
