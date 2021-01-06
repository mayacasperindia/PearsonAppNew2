import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable{
  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AppLoggedIn extends AuthenticationState {}

class ShowLoginPage extends AuthenticationState{}

class VerifyingVoucher extends AuthenticationState{}

class VerifiedVoucher extends AuthenticationState{}

class Error extends AuthenticationState{}

class SigningUp extends AuthenticationState{}