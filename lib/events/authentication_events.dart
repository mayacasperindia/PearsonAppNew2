import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class VerifyVoucher extends AuthenticationEvent {
  final String voucher;

  VerifyVoucher({@required this.voucher});
}

class UserSignUp extends AuthenticationEvent {
  final String firstName,
      lastName,
      board,
      className,
      schoolState,
      schoolCity,
      schoolName;

  UserSignUp(
      {@required this.firstName,
      @required this.lastName,
      @required this.board,
      @required this.className,
      @required this.schoolState,
      @required this.schoolCity,
      @required this.schoolName});
}
