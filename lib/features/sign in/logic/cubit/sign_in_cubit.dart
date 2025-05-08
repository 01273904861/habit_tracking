import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {


  SignInCubit() : super(SignInInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  void signIn() {
    emit(SignInLoading());
  }


 
 
dispose() {
    emailController.dispose();
    passwordController.dispose();
  }



}
