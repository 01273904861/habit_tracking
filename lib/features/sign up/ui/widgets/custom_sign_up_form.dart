import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habbit_tracking_app/core/helper/spacing.dart';
import 'package:habbit_tracking_app/core/widgets/app_button.dart';
import 'package:habbit_tracking_app/features/sign%20in/ui/widgets/auth_text_field.dart';
import 'package:habbit_tracking_app/features/sign%20up/logic/cubit/sign_up_cubit.dart';
import 'package:habbit_tracking_app/features/sign%20up/ui/widgets/already_have_an_account.dart';

class CustomSignUpForm extends StatefulWidget {
  const CustomSignUpForm({super.key});

  @override
  State<CustomSignUpForm> createState() => _CustomSignInFormState();
}

class _CustomSignInFormState extends State<CustomSignUpForm> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpCubit>();
    return Form(
      key: signUpCubit.signUpFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(20),
          AuthTextField(
            controller: signUpCubit.emailController,
            labelText: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } else if (!value.contains('@')) {
                return 'Please enter a valid email';
              } else {
                if (value.contains(' ')) {
                  return 'Please enter a valid email';
                }
              }
              return null;
            },
          ),
          verticalSpace(20),
          AuthTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              } else if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
            controller: signUpCubit.passwordController,
            labelText: "Password",
            obscureText: !isVisible,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              icon: isVisible
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
            ),
          ),
          verticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  const Text(
                    "Stay logged in?",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          const Spacer(),
          AppButton(
            onPressed: () {
              if (signUpCubit.signUpFormKey.currentState!.validate()) {
                signUpCubit.signUp();
              }
            },
            title: 'Register',
            borderRadius: 50,
          ),
          verticalSpace(20),
          const AlreadyHaveAnAccount(),
          verticalSpace(40),
        ],
      ),
    );
  }
}
