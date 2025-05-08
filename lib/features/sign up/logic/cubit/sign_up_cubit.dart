import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  void signUp() {
    emit(SignUpLoading());
  }
}
