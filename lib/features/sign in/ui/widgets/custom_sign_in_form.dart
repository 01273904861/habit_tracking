import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habbit_tracking_app/core/Router/routes.dart';
import 'package:habbit_tracking_app/core/helper/extension.dart';
import 'package:habbit_tracking_app/core/helper/spacing.dart';
import 'package:habbit_tracking_app/core/widgets/app_button.dart';
import 'package:habbit_tracking_app/features/sign%20in/logic/cubit/sign_in_cubit.dart';
import 'package:habbit_tracking_app/features/sign%20in/ui/widgets/auth_text_field.dart';
import 'package:habbit_tracking_app/features/sign%20in/ui/widgets/dont_have_an_account.dart';
import 'package:habbit_tracking_app/features/sign%20up/logic/cubit/sign_up_cubit.dart';

class CustomSignInForm extends StatefulWidget {
  const CustomSignInForm({super.key});

  @override
  State<CustomSignInForm> createState() => _CustomSignInFormState();
}

class _CustomSignInFormState extends State<CustomSignInForm> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    final signInCubit = context.read<SignInCubit>();
    return Form(
      key: signInCubit.signInFormKey,
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccessState) {
            showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog(
                    content: Text('sign in  successful'),
                  );
                });
            context.pop();
            context.pushNamed(Routes.homePage);
          }
          if (state is SignInFailureState) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(state.errorMessage),
                  );
                });
          }
        },
        builder: (context, state) {
          return state is SignInLoadingState
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalSpace(20),
                    AuthTextField(
                      controller: signInCubit.emailController,
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
                      controller: signInCubit.passwordController,
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
                        if (signInCubit.signInFormKey.currentState!
                            .validate()) {
                          signInCubit.signIn();
                        }
                      },
                      title: 'Login',
                      borderRadius: 50,
                    ),
                    verticalSpace(20),
                    const DontHaveAnAccountWidget(),
                    verticalSpace(40),
                  ],
                );
        },
      ),
    );
  }
}
