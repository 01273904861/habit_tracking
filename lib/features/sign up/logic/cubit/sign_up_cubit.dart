import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  void signUp() async {
    try {
      emit(SignUpLoading());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      verifyUser();
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailure(
            errorMessage: 'The password provided is too weak'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailure(
            errorMessage: 'The account already exists for that email.'));
      } else {
        emit(SignUpFailure(errorMessage: 'check email and password'));
      }
    } catch (e) {
      emit(SignUpFailure(errorMessage: 'check email and password'));
    }
  }

  Future<void> verifyUser() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }


}
