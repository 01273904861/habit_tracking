import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {


  SignInCubit() : super(SigninInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

void signIn() async {
    try {
      emit(SignInLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailureState(errorMessage: 'No user found for that email'));
      } else if (e.code == 'wrong-password') {
        emit(SignInFailureState(
            errorMessage: 'Wrong password provided for that user'));
      } else {
        emit(SignInFailureState(errorMessage: 'check email and password'));
      }
    } catch (e) {
      emit(SignInFailureState(errorMessage: 'check email and password'));
    }
  }

  bool checKVerification() => FirebaseAuth.instance.currentUser!.emailVerified;

  void signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      emit(SignOutSuccessState());
    } on Exception catch (e) {
      SignOutFailureState(errorMessage: e.toString());
    }
  }

 
 
dispose() {
    emailController.dispose();
    passwordController.dispose();
  }



}
