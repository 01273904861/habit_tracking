part of 'sign_up_cubit.dart';

 class SignUpState {}

final class SignUpInitial extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpFailure extends SignUpState {
  final String errorMessage;
  SignUpFailure({required this.errorMessage});
}

class SignUpLoading extends SignUpState {}
