part of 'sign_in_cubit.dart';

class SignInState {}

final class SigninInitial extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInSuccessState extends SignInState {}

class SignInFailureState extends SignInState {
  final String errorMessage;

  SignInFailureState({required this.errorMessage});
}

class SignOutSuccessState extends SignInState {}

class SignOutFailureState extends SignInState {
  final String errorMessage;

  SignOutFailureState({required this.errorMessage});
}